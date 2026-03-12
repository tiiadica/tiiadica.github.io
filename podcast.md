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
      <i class="platform-icon apple-podcasts"><img width="100" height="100" alt="apple-podcasts-svgrepo-com" src="https://github.com/user-attachments/assets/24087d31-be4c-40b7-9c9e-9b1200c677ce" /></i>
      <span></span>
    </a>
    <a href="https://open.spotify.com/show/1zd8pUL40pVNVdaDTatgIm?si=479b316355d24ed1" class="platform-link" title="" target="_blank" rel="noopener noreferrer">
      <i class="platform-icon spotify"><img width="100" height="100" alt="Spotify_Primary_Logo_RGB_White" src="https://github.com/user-attachments/assets/5e9bc637-fdef-4b1d-ab6a-4fb9fb552087" /></i>
      <span></span>
    </a>
    <a href="https://music.amazon.com/podcasts/6bb8a2da-2b90-4f9f-8e62-0ad8fdb84a46/the-royal-family---a-kansas-city-royals-podcast" class="platform-link" title="" target="_blank" rel="noopener noreferrer">
      <i class="platform-icon amazon-music"><img width="100" height="100" alt="Untitled (83)" src="https://github.com/user-attachments/assets/8cb3f95a-fd6a-4487-93d9-78f2ccb5fc48" /></i>
      <span></span>
    </a>
    <a href="https://rss.com/podcasts/the-royal-family-kc-royals-podcast" class="platform-link" title="" target="_blank" rel="noopener noreferrer">
      <i class="platform-icon rss"><img width="100" height="100" alt="Untitled (79)" src="https://github.com/user-attachments/assets/0582f648-462a-46b2-beb0-7b615ff05b72" /></i>
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
      <div id="audio-episodes-list">
        {% if site.data.podcast_episodes %}
          {% for episode in site.data.podcast_episodes.episodes %}
            <div class="episode-item">
              <div class="episode-title">{{ episode.title }}</div>
              <div class="episode-date">{{ episode.date | date: "%B %d, %Y" }}</div>
              {% if episode.audioUrl %}
                <audio controls style="width: 100%; margin-top: 0.5rem;">
                  <source src="{{ episode.audioUrl }}" type="audio/mpeg">
                  Your browser does not support the audio element.
                </audio>
              {% endif %}
            </div>
          {% endfor %}
        {% else %}
          <p>Loading episodes...</p>
        {% endif %}
      </div>
    </div>
    
    <!-- YouTube Episodes (Right) -->
    <div class="youtube-episodes nes-container is-rounded">
      <h2 class="nes-text is-primary">YouTube Episodes</h2>
      <div id="youtube-episodes-list">
        {% if site.data.podcast_videos %}
          <!-- Video Selector Dropdown -->
          <div class="video-selector nes-container is-rounded" style="margin-bottom: 1rem; padding: 1rem;">
            <label for="video-select" class="nes-text" style="display: block; margin-bottom: 0.5rem;">
              Select Episode:
            </label>
            <div class="nes-select" style="margin-bottom: 0.5rem;">
              <select id="video-select" onchange="selectVideo(this.value)">
                {% for video in site.data.podcast_videos.videos %}
                  <option value="{{ forloop.index0 }}">{{ video.title }}</option>
                {% endfor %}
              </select>
            </div>
            
            <!-- Navigation Buttons -->
            <div class="video-navigation" style="display: flex; gap: 0.5rem; justify-content: center; margin-bottom: 1rem;">
              <button class="nes-btn is-primary" onclick="previousVideo()">‹ Previous</button>
              <button class="nes-btn is-primary" onclick="nextVideo()">Next ›</button>
            </div>
          </div>
          
          <!-- Video Embed -->
          <div class="youtube-embed" style="margin-bottom: 1rem;">
            <iframe id="video-player" width="100%" height="500" 
              src="" 
              title="YouTube Video" 
              frameborder="0" 
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
              allowfullscreen
              style="border-radius: 4px;">
            </iframe>
          </div>
          
          <!-- Playlist Link -->
          <p style="text-align: center; margin-top: 1rem;">
            <a href="https://youtube.com/playlist?list=PLz-qXKR6_H_miJi7Vg8QVgeug83Jq5d73" 
               target="_blank" 
               rel="noopener noreferrer"
               class="nes-btn is-primary">
              View Full Playlist on YouTube
            </a>
          </p>
        {% else %}
          <p>Loading videos...</p>
        {% endif %}
      </div>
    </div>
    
  </div>
</div>

<style>
/* Podcast-specific styles */
.podcast-platforms {
  margin-bottom: 2rem;
  align-items: center;
  text-align: center;
}

.podcast-platforms .title {
  text-align: center;
  color: #FFFFFF !important;
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
}
</style>

<script>
// YouTube video selector
const videoData = {{ site.data.podcast_videos | jsonify }};
let currentVideoIndex = 0;

function displayVideo(index) {
  if (videoData && videoData.videos && videoData.videos[index]) {
    const video = videoData.videos[index];
    const iframe = document.getElementById('video-player');
    iframe.src = `https://www.youtube.com/embed/${video.id}?rel=0`;
    iframe.title = video.title;
  }
}

window.selectVideo = function(index) {
  currentVideoIndex = parseInt(index);
  displayVideo(currentVideoIndex);
};

window.previousVideo = function() {
  if (currentVideoIndex > 0) {
    currentVideoIndex--;
    document.getElementById('video-select').value = currentVideoIndex;
    displayVideo(currentVideoIndex);
  }
};

window.nextVideo = function() {
  if (videoData && videoData.videos && currentVideoIndex < videoData.videos.length - 1) {
    currentVideoIndex++;
    document.getElementById('video-select').value = currentVideoIndex;
    displayVideo(currentVideoIndex);
  }
};

// Initialize video player on page load
document.addEventListener('DOMContentLoaded', function() {
  displayVideo(0);
});
</script>
