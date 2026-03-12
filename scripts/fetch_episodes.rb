require 'net/http'
require 'uri'
require 'nokogiri'
require 'json'
require 'fileutils'

def fetch_audio_episodes
  puts "Fetching audio episodes..."
  
  begin
    uri = URI('https://media.rss.com/the-royal-family-kc-royals-podcast/feed.xml')
    response = Net::HTTP.get(uri)
    doc = Nokogiri::XML(response)
    
    episodes = []
    doc.xpath('//item').each do |item|
      title = item.xpath('title').text
      pub_date = item.xpath('pubDate').text
      audio_url = item.xpath('enclosure/@url').text
      
      next if title.empty? || audio_url.empty?
      
      episodes << {
        'title' => title,
        'date' => pub_date,
        'audioUrl' => audio_url
      }
    end
    
    # Sort by date and take latest 10
    episodes = episodes.sort_by { |ep| DateTime.parse(ep['date']) rescue DateTime.now }.reverse.first(10)
    
    # Create _data directory if it doesn't exist
    FileUtils.mkdir_p('_data')
    
    # Save to JSON file
    File.write('_data/podcast_episodes.json', JSON.pretty_generate({ 'episodes' => episodes }))
    
    puts "✓ Fetched #{episodes.length} audio episodes"
    true
  rescue => e
    puts "✗ Error fetching audio episodes: #{e.message}"
    puts e.backtrace.join("\n")
    false
  end
end

def fetch_youtube_videos
  puts "Fetching YouTube videos..."
  
  begin
    playlist_id = 'PLz-qXKR6_H_miJi7Vg8QVgeug83Jq5d73'
    uri = URI("https://www.youtube.com/feeds/videos.xml?playlist_id=#{playlist_id}")
    response = Net::HTTP.get(uri)
    doc = Nokogiri::XML(response)
    
    videos = []
    doc.xpath('//entry', 'yt' => 'http://www.youtube.com/xml/schemas/2015/metadata.xsd').each do |entry|
      title = entry.xpath('title').text
      link = entry.xpath('link/@href').text
      video_id = link.match(/v=([^&]+)/)&.[](1)
      
      next if video_id.nil? || video_id.empty? || title.empty?
      
      videos << {
        'id' => video_id,
        'title' => title
      }
    end
    
    # Create _data directory if it doesn't exist
    FileUtils.mkdir_p('_data')
    
    # Save to JSON file
    File.write('_data/podcast_videos.json', JSON.pretty_generate({ 'videos' => videos }))
    
    puts "✓ Fetched #{videos.length} YouTube videos"
    true
  rescue => e
    puts "✗ Error fetching YouTube videos: #{e.message}"
    puts e.backtrace.join("\n")
    false
  end
end

# Run both functions
puts "Starting podcast episode fetch..."
puts "=" * 50

audio_success = fetch_audio_episodes
puts ""
video_success = fetch_youtube_videos

puts "=" * 50
if audio_success && video_success
  puts "✓ All tasks completed successfully"
  exit 0
else
  puts "✗ Some tasks failed"
  exit 1
end
