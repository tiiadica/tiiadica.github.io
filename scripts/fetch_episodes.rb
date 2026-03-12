require 'net/http'
require 'uri'
require 'nokogiri'
require 'json'
require 'fileutils'
require 'date'

# Get the repo root directory
REPO_ROOT = Dir.pwd
DATA_DIR = File.join(REPO_ROOT, '_data')

puts "Repository root: #{REPO_ROOT}"
puts "Data directory will be: #{DATA_DIR}"

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
    FileUtils.mkdir_p(DATA_DIR)
    puts "Created directory: #{DATA_DIR}"
    
    # Save to JSON file
    file_path = File.join(DATA_DIR, 'podcast_episodes.json')
    File.write(file_path, JSON.pretty_generate({ 'episodes' => episodes }))
    puts "Wrote file: #{file_path}"
    puts "File exists: #{File.exist?(file_path)}"
    
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
    
    # YouTube uses namespaces, so we need to handle them
    doc.xpath('//yt:videoId', 'yt' => 'http://www.youtube.com/xml/schemas/rss/2.0/video-objects.xsd').each do |video_id_node|
      video_id = video_id_node.text
      
      # Find the corresponding entry to get the title
      entry = video_id_node.ancestors('entry').first
      next unless entry
      
      title = entry.xpath('title').text
      
      next if video_id.nil? || video_id.empty? || title.empty?
      
      videos << {
        'id' => video_id,
        'title' => title
      }
    end
    
    puts "Found #{videos.length} videos in feed"
    
    # Create _data directory if it doesn't exist
    FileUtils.mkdir_p(DATA_DIR)
    puts "Created directory: #{DATA_DIR}"
    
    # Save to JSON file
    file_path = File.join(DATA_DIR, 'podcast_videos.json')
    File.write(file_path, JSON.pretty_generate({ 'videos' => videos }))
    puts "Wrote file: #{file_path}"
    puts "File exists: #{File.exist?(file_path)}"
    
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
puts "Checking if files exist:"
puts "podcast_episodes.json: #{File.exist?(File.join(DATA_DIR, 'podcast_episodes.json'))}"
puts "podcast_videos.json: #{File.exist?(File.join(DATA_DIR, 'podcast_videos.json'))}"

if audio_success && video_success
  puts "✓ All tasks completed successfully"
  exit 0
else
  puts "✗ Some tasks failed"
  exit 1
end
