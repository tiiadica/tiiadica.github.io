---
layout: page
title: "The Royal Family Podcast"
permalink: /podcast/
---

<div class="podcast-intro">
  <p>Welcome to The Royal Family podcast - your ultimate destination for Kansas City Royals analysis, discussions, and passionate fan perspectives!</p>
</div>

<!-- Platform Links -->
<div class="podcast-platforms nes-container is-rounded">
  <p class="title">Listen on Your Favorite Platform</p>
  <div class="platform-icons">
    <a href="https://podcasts.apple.com/us/podcast/the-royal-family-kc-royals-podcast/id1234567890" class="platform-link" title="Apple Podcasts" target="_blank" rel="noopener noreferrer">
      <i class="platform-icon apple-podcasts">🎧</i>
      <span>Apple Podcasts</span>
    </a>
    <a href="https://open.spotify.com/show/1234567890" class="platform-link" title="Spotify" target="_blank" rel="noopener noreferrer">
      <i class="platform-icon spotify">🎵</i>
      <span>Spotify</span>
    </a>
    <a href="https://music.amazon.com/podcasts/1234567890" class="platform-link" title="Amazon Music" target="_blank" rel="noopener noreferrer">
      <i class="platform-icon amazon-music">🎵</i>
      <span>Amazon Music</span>
    </a>
    <a href="https://media.rss.com/the-royal-family-kc-royals-podcast/feed.xml" class="platform-link" title="RSS Feed" target="_blank" rel="noopener noreferrer">
      <i class="platform-icon rss">📡</i>
      <span>RSS Feed</span>
    </a>
  </div>
</div>

<!-- Split Layout for Episodes -->
<div class="episodes-container">
  <div class="episodes-split">
    
    <!-- Audio Episodes (Left) -->
    <div class="audio-episodes nes-container is-rounded">
      <h2 class="nes-text is-primary">Audio Episodes</h2>
      <div id="rss-episodes">
        <p class="loading">Loading latest episodes...</p>
      </div>
    </div>
    
    <!-- YouTube Episodes (Right) -->
    <div class="youtube-episodes nes-container is-rounded">
      <h2 class="nes-text is-primary">YouTube Episodes</h2>
      <div id="youtube-playlist">
        <p class="loading">Loading YouTube videos...</p>
      </div>
    </div>
    
  </div>
</div>

<style>
/* Podcast-specific styles */
.podcast-intro {
  margin-bottom: 2rem;
  text-align: center;
}

.podcast-platforms {
  margin-bottom: 2rem;
}

.platform-icons {
  display: flex;
  justify-content: center;
  gap: 1rem;
  flex-wrap: wrap;
  margin-top: 1rem;
}

.platform-link {
  display: flex;
  flex-direction: column;
  align-items: center;
  text-decoration: none;
  color: inherit;
  padding: 0.5rem;
  border-radius: 4px;
  transition: opacity 0.3s ease;
  min-width: 100px;
}

.platform-link:hover {
  opacity: 0.8;
}

.platform-icon {
  font-size: 2rem;
  margin-bottom: 0.5rem;
}

.platform-link span {
  font-size: 0.8rem;
  text-align: center;
}

.episodes-container {
  margin-top: 2rem;
}

.episodes-split {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 2rem;
}

.audio-episodes, .youtube-episodes {
  padding: 1rem;
}

.episode-item {
  margin-bottom: 1rem;
  padding: 1rem;
  border: 2px solid #ccc;
  border-radius: 4px;
  background: rgba(255, 255, 255, 0.1);
}

.episode-title {
  font-weight: bold;
  margin-bottom: 0.5rem;
  color: #C09C5B;
}

.episode-date {
  font-size: 0.8rem;
  color: #aaa;
  margin-bottom: 0.5rem;
}

.episode-description {
  font-size: 0.9rem;
  margin-bottom: 0.5rem;
}

.loading {
  text-align: center;
  font-style: italic;
  color: #aaa;
}

/* Responsive design */
@media (max-width: 768px) {
  .episodes-split {
    grid-template-columns: 1fr;
  }
  
  .platform-icons {
    gap: 0.5rem;
  }
  
  .platform-link {
    min-width: 80px;
  }
  
  .platform-icon {
    font-size: 1.5rem;
  }
}
</style>

<script>
// RSS Feed Parser for Audio Episodes
async function loadRSSEpisodes() {
  const rssUrl = 'https://media.rss.com/the-royal-family-kc-royals-podcast/feed.xml';
  const proxyUrl = 'https://api.allorigins.win/get?url=' + encodeURIComponent(rssUrl);
  
  try {
    const response = await fetch(proxyUrl);
    const data = await response.json();
    const parser = new DOMParser();
    const xmlDoc = parser.parseFromString(data.contents, 'text/xml');
    
    const items = xmlDoc.querySelectorAll('item');
    const episodesContainer = document.getElementById('rss-episodes');
    
    if (items.length === 0) {
      episodesContainer.innerHTML = '<p>No episodes found.</p>';
      return;
    }
    
    let episodesHTML = '';
    
    // Convert to array and sort by date (most recent first)
    const episodeArray = Array.from(items).map(item => {
      const pubDate = new Date(item.querySelector('pubDate')?.textContent || '');
      return { item, pubDate };
    }).sort((a, b) => b.pubDate - a.pubDate);
    
    episodeArray.slice(0, 10).forEach(({ item }) => {
      const title = item.querySelector('title')?.textContent || 'Untitled Episode';
      const description = item.querySelector('description')?.textContent || '';
      const pubDate = item.querySelector('pubDate')?.textContent || '';
      const enclosure = item.querySelector('enclosure');
      const audioUrl = enclosure?.getAttribute('url') || '';
      
      const date = new Date(pubDate).toLocaleDateString();
      const shortDescription = description.length > 150 ? 
        description.substring(0, 150) + '...' : description;
      
      episodesHTML += `
        <div class="episode-item">
          <div class="episode-title">${title}</div>
          <div class="episode-date">${date}</div>
          <div class="episode-description">${shortDescription}</div>
          ${audioUrl ? `<audio controls style="width: 100%; margin-top: 0.5rem;">
            <source src="${audioUrl}" type="audio/mpeg">
            Your browser does not support the audio element.
          </audio>` : ''}
        </div>
      `;
    });
    
    episodesContainer.innerHTML = episodesHTML;
    
  } catch (error) {
    console.error('Error loading RSS feed:', error);
    document.getElementById('rss-episodes').innerHTML = 
      '<p>Unable to load episodes at this time. Please try again later.</p>';
  }
}

// YouTube Playlist Loader
async function loadYouTubePlaylist() {
  const playlistId = 'PLz-qXKR6_H_miJi7Vg8QVgeug83Jq5d73';
  
  // For now, we'll use a simplified approach since we need YouTube API key for full functionality
  // This creates placeholder structure that can be enhanced later
  const youtubeContainer = document.getElementById('youtube-playlist');
  
  try {
    // Simple iframe embed for the playlist
    youtubeContainer.innerHTML = `
      <div class="youtube-embed" style="margin-bottom: 1rem;">
        <iframe width="100%" height="315" 
          src="https://www.youtube.com/embed/videoseries?list=${playlistId}" 
          title="The Royal Family Podcast YouTube Playlist" 
          frameborder="0" 
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
          allowfullscreen
          style="border-radius: 4px;">
        </iframe>
      </div>
      <p style="text-align: center; margin-top: 1rem;">
        <a href="https://youtube.com/playlist?list=${playlistId}" 
           target="_blank" 
           rel="noopener noreferrer"
           class="nes-btn is-primary">
          View Full Playlist on YouTube
        </a>
      </p>
    `;
  } catch (error) {
    console.error('Error loading YouTube playlist:', error);
    youtubeContainer.innerHTML = 
      '<p>Unable to load YouTube videos at this time.</p>';
  }
}

// Load content when page loads
document.addEventListener('DOMContentLoaded', function() {
  loadRSSEpisodes();
  loadYouTubePlaylist();
});
</script>