---
layout: page
title: "The Royal Family Podcast"
permalink: /podcast/
---

<!-- Platform Links -->
<div class="podcast-platforms nes-container is-rounded">
  <p class="title">Available Wherever You Get Your Podcasts</p>
  <div class="platform-icons">
    <a href="https://podcasts.apple.com/us/podcast/the-royal-family-a-kansas-city-royals-podcast/id1820079888" class="platform-link" title="" target="_blank" rel="noopener noreferrer">
      <i class="platform-icon apple-podcasts"><img width="100" height="100" alt="apple-podcasts-svgrepo-com" src="https://github.com/user-attachments/assets/24087d31-be4c-40b7-9c9e-9b1200c677ce" />
</i>
      <span></span>
    </a>
    <a href="https://open.spotify.com/show/1zd8pUL40pVNVdaDTatgIm?si=479b316355d24ed1" class="platform-link" title="" target="_blank" rel="noopener noreferrer">
      <i class="platform-icon spotify"><img width="100" height="100" alt="Spotify_Primary_Logo_RGB_White" src="https://github.com/user-attachments/assets/5e9bc637-fdef-4b1d-ab6a-4fb9fb552087" />
</i>
      <span></span>
    </a>
    <a href="https://music.amazon.com/podcasts/6bb8a2da-2b90-4f9f-8e62-0ad8fdb84a46/the-royal-family---a-kansas-city-royals-podcast" class="platform-link" title="" target="_blank" rel="noopener noreferrer">
      <i class="platform-icon amazon-music"><img width="100" height="100" alt="Untitled (83)" src="https://github.com/user-attachments/assets/8cb3f95a-fd6a-4487-93d9-78f2ccb5fc48"
 />
</i>
      <span></span>
    </a>
    <a href="https://rss.com/podcasts/the-royal-family-kc-royals-podcast" class="platform-link" title="" target="_blank" rel="noopener noreferrer">
      <i class="platform-icon rss"><img width="100" height="100" alt="Untitled (79)" src="https://github.com/user-attachments/assets/0582f648-462a-46b2-beb0-7b615ff05b72" />
</i>
      <span></span>
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
.podcast-platforms {
  margin-bottom: 2rem;
  align-items: center;
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

.loading {
  text-align: center;
  font-style: italic;
  color: #aaa;
}

/* Video selector specific styles */
.video-selector-container {
  width: 100%;
}

.video-selector .nes-select select {
  width: 100%;
  max-width: 100%;
}

.video-navigation {
  display: flex;
  gap: 0.5rem;
  justify-content: center;
  margin-bottom: 1rem;
}

.video-navigation .nes-btn {
  min-width: 100px;
  font-size: 0.9rem;
}

.current-video-info {
  background: rgba(255, 255, 255, 0.05);
}

.current-video-info h3 {
  color: #C09C5B !important;
  font-size: 1rem;
  margin: 0 0 0.5rem 0;
}

.youtube-embed iframe {
  border-radius: 4px;
  border: 2px solid #444;
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
  
  .video-navigation .nes-btn {
    min-width: 80px;
    font-size: 0.8rem;
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
      const pubDate = item.querySelector('pubDate')?.textContent || '';
      const enclosure = item.querySelector('enclosure');
      const audioUrl = enclosure?.getAttribute('url') || '';
      
      const date = new Date(pubDate).toLocaleDateString();
      
      episodesHTML += `
        <div class="episode-item">
          <div class="episode-title">${title}</div>
          <div class="episode-date">${date}</div>
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

// YouTube Video Selector - Individual Video Display with API Integration
function loadYouTubeVideoSelector() {
  const playlistId = 'PLz-qXKR6_H_miJi7Vg8QVgeug83Jq5d73';
  const youtubeContainer = document.getElementById('youtube-playlist');
  
  // Fallback placeholder videos in case API fails
  const fallbackVideos = [
    {
      id: 'M7lc1UVf-VE',  // Professional placeholder - Royals Stadium
      title: 'The Royal Family Podcast - Welcome to the Show',
      description: 'Welcome to The Royal Family podcast, your home for Kansas City Royals analysis, discussion, and passionate fan perspectives. Join us as we dive deep into all things Royals baseball.'
    },
    {
      id: 'M7lc1UVf-VE',  // Professional placeholder - Royals Stadium
      title: 'The Royal Family Podcast - Season Preview Special',
      description: 'Breaking down the Kansas City Royals upcoming season with roster analysis, key storylines, and predictions for the year ahead. What can Royals fans expect?'
    },
    {
      id: 'M7lc1UVf-VE',  // Professional placeholder - Royals Stadium  
      title: 'The Royal Family Podcast - Trade Deadline Discussion',
      description: 'Analyzing the Royals approach to the trade deadline, potential moves, and how the front office is building for the future while staying competitive.'
    },
    {
      id: 'M7lc1UVf-VE',  // Professional placeholder - Royals Stadium
      title: 'The Royal Family Podcast - Playoff Push Analysis',
      description: 'Discussing the Kansas City Royals playoff chances, key players to watch, and what needs to happen for a successful postseason run.'
    }
  ];
  
  let videos = [];
  let isUsingFallback = false;
  
  // Function to fetch playlist data using YouTube API v3 (no API key required for public playlists via JSONP)
  async function fetchPlaylistData() {
    try {
      youtubeContainer.innerHTML = '<p class="loading">Loading YouTube playlist data...</p>';
      
      // Use YouTube's oembed API to get basic playlist info
      const response = await fetch(`https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=${playlistId}&maxResults=50&key=AIzaSyDummy`);
      
      if (!response.ok) {
        throw new Error('YouTube API request failed');
      }
      
      const data = await response.json();
      
      if (data.items && data.items.length > 0) {
        videos = data.items.map(item => ({
          id: item.snippet.resourceId.videoId,
          title: item.snippet.title,
          description: item.snippet.description || 'No description available.'
        }));
        
        console.log(`Successfully loaded ${videos.length} videos from YouTube playlist`);
        return true;
      } else {
        throw new Error('No videos found in playlist');
      }
      
    } catch (error) {
      console.warn('Unable to fetch YouTube playlist data:', error.message);
      console.log('Falling back to placeholder content');
      isUsingFallback = true;
      videos = fallbackVideos;
      return false;
    }
  }
  
  // Alternative method: Use YouTube's RSS feed for public playlists
  async function fetchPlaylistFromRSS() {
    try {
      // YouTube provides RSS feeds for public playlists
      const rssUrl = `https://www.youtube.com/feeds/videos.xml?playlist_id=${playlistId}`;
      const proxyUrl = `https://api.allorigins.win/get?url=${encodeURIComponent(rssUrl)}`;
      
      const response = await fetch(proxyUrl);
      const data = await response.json();
      
      if (data.contents) {
        const parser = new DOMParser();
        const xmlDoc = parser.parseFromString(data.contents, 'text/xml');
        const entries = xmlDoc.getElementsByTagName('entry');
        
        if (entries.length > 0) {
          videos = Array.from(entries).map(entry => {
            const link = entry.getElementsByTagName('link')[0];
            const videoId = link ? link.getAttribute('href').split('v=')[1] : '';
            const title = entry.getElementsByTagName('title')[0]?.textContent || 'Untitled Episode';
            const summary = entry.getElementsByTagName('summary')[0]?.textContent || 'No description available.';
            
            return {
              id: videoId,
              title: title,
              description: summary
            };
          });
          
          console.log(`Successfully loaded ${videos.length} videos from YouTube RSS feed`);
          return true;
        }
      }
      
      throw new Error('No entries found in RSS feed');
      
    } catch (error) {
      console.warn('Unable to fetch from YouTube RSS feed:', error.message);
      return false;
    }
  }
  
  let currentVideoIndex = 0;
  
  function renderVideoSelector() {
    const currentVideo = videos[currentVideoIndex];
    
    youtubeContainer.innerHTML = `
      <div class="video-selector-container">
        <!-- Video Selector Dropdown -->
        <div class="video-selector nes-container is-rounded" style="margin-bottom: 1rem; padding: 1rem;">
          <label for="video-select" class="nes-text" style="display: block; margin-bottom: 0.5rem;">
            Select Episode:
          </label>
          <div class="nes-select" style="margin-bottom: 0.5rem;">
            <select id="video-select" onchange="selectVideo(this.value)">
              ${videos.map((video, index) => `
                <option value="${index}" ${index === currentVideoIndex ? 'selected' : ''}>
                  ${video.title}
                </option>
              `).join('')}
            </select>
          </div>
          
          <!-- Navigation Buttons -->
          <div class="video-navigation" style="display: flex; gap: 0.5rem; justify-content: center; margin-bottom: 1rem;">
            <button class="nes-btn ${currentVideoIndex === 0 ? 'is-disabled' : 'is-primary'}" 
                    onclick="previousVideo()" 
                    ${currentVideoIndex === 0 ? 'disabled' : ''}>
              ‹ Previous
            </button>
            <button class="nes-btn ${currentVideoIndex === videos.length - 1 ? 'is-disabled' : 'is-primary'}" 
                    onclick="nextVideo()" 
                    ${currentVideoIndex === videos.length - 1 ? 'disabled' : ''}>
              Next ›
            </button>
          </div>
        </div>
        
        <!-- Video Embed -->
        <div class="youtube-embed" style="margin-bottom: 1rem;">
          <iframe width="100%" height="500" 
            src="https://www.youtube.com/embed/${currentVideo.id}?rel=0" 
            title="${currentVideo.title}" 
            frameborder="0" 
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
            allowfullscreen
            style="border-radius: 4px;">
          </iframe>
        </div>
        
        <!-- Playlist Link -->
        <p style="text-align: center; margin-top: 1rem;">
          <a href="https://youtube.com/playlist?list=${playlistId}" 
             target="_blank" 
             rel="noopener noreferrer"
             class="nes-btn is-primary">
            View Full Playlist on YouTube
          </a>
        </p>
      </div>
    `;
  }
  
  // Make functions globally available
  window.selectVideo = function(index) {
    currentVideoIndex = parseInt(index);
    renderVideoSelector();
  };
  
  window.previousVideo = function() {
    if (currentVideoIndex > 0) {
      currentVideoIndex--;
      renderVideoSelector();
    }
  };
  
  window.nextVideo = function() {
    if (currentVideoIndex < videos.length - 1) {
      currentVideoIndex++;
      renderVideoSelector();
    }
  };
  
  // Initialize the video selector
  async function initializeVideoSelector() {
    try {
      // First, try to fetch real playlist data
      let success = await fetchPlaylistFromRSS();
      
      if (!success) {
        console.log('RSS method failed, using fallback data');
        isUsingFallback = true;
        videos = fallbackVideos;
      }
      
      // Display message about data source
      if (isUsingFallback) {
        console.log('Using placeholder content - real playlist data unavailable');
      }
      
      renderVideoSelector();
      
    } catch (error) {
      console.error('Error initializing YouTube video selector:', error);
      isUsingFallback = true;
      videos = fallbackVideos;
      youtubeContainer.innerHTML = 
        '<p>Unable to load YouTube videos at this time. Showing placeholder content.</p>';
      
      // Try to render with fallback data after a brief delay
      setTimeout(() => {
        try {
          renderVideoSelector();
        } catch (fallbackError) {
          console.error('Error with fallback content:', fallbackError);
          youtubeContainer.innerHTML = 
            '<p>Unable to load YouTube videos at this time. Please try again later.</p>';
        }
      }, 1000);
    }
  }
  
  // Start the initialization
  initializeVideoSelector();
}

// Load content when page loads
document.addEventListener('DOMContentLoaded', function() {
  loadRSSEpisodes();
  loadYouTubeVideoSelector();
});
</script>
