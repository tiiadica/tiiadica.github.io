require 'net/http'
require 'rexml/document'
require 'json'

module Jekyll
  class PodcastFetcher < Generator
    safe true
    priority :high

    def generate(site)
      fetch_audio_episodes
      fetch_youtube_videos
    end

    private

    def fetch_audio_episodes
      begin
        uri = URI('https://media.rss.com/the-royal-family-kc-royals-podcast/feed.xml')
        response = Net::HTTP.get(uri)
        doc = REXML::Document.new(response)
        
        episodes = []
        items = doc.elements.to_a('//item')
        
        items.each do |item|
          title = item.elements['title']&.text || 'Untitled Episode'
          pub_date = item.elements['pubDate']&.text || ''
          enclosure = item.elements['enclosure']
          audio_url = enclosure&.attributes['url'] || ''
          
          episodes << {
            'title' => title,
            'date' => pub_date,
            'audioUrl' => audio_url
          }
        end
        
        # Sort by date and take latest 10
        episodes = episodes.sort_by { |ep| DateTime.parse(ep['date']) rescue DateTime.now }.reverse.first(10)
        
        # Save to _data directory
        data_dir = File.join(site.source, '_data')
        Dir.mkdir(data_dir) unless File.exist?(data_dir)
        
        File.write(
          File.join(data_dir, 'podcast_episodes.json'),
          JSON.pretty_generate({ 'episodes' => episodes })
        )
        
        puts "✓ Fetched #{episodes.length} audio episodes"
      rescue => e
        puts "✗ Error fetching audio episodes: #{e.message}"
      end
    end

    def fetch_youtube_videos
      begin
        playlist_id = 'PLz-qXKR6_H_miJi7Vg8QVgeug83Jq5d73'
        uri = URI("https://www.youtube.com/feeds/videos.xml?playlist_id=#{playlist_id}")
        response = Net::HTTP.get(uri)
        doc = REXML::Document.new(response)
        
        videos = []
        entries = doc.elements.to_a('//entry')
        
        entries.each do |entry|
          link = entry.elements['link']
          href = link&.attributes['href'] || ''
          video_id = href.match(/v=([^&]+)/)&.[](1) || ''
          title = entry.elements['title']&.text || 'Untitled Video'
          summary = entry.elements['summary']&.text || 'No description available.'
          
          next if video_id.empty?
          
          videos << {
            'id' => video_id,
            'title' => title,
            'description' => summary
          }
        end
        
        # Save to _data directory
        data_dir = File.join(site.source, '_data')
        Dir.mkdir(data_dir) unless File.exist?(data_dir)
        
        File.write(
          File.join(data_dir, 'podcast_videos.json'),
          JSON.pretty_generate({ 'videos' => videos })
        )
        
        puts "✓ Fetched #{videos.length} YouTube videos"
      rescue => e
        puts "✗ Error fetching YouTube videos: #{e.message}"
      end
    end
  end
end
