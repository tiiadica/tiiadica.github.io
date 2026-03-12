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
        <p>Loading episodes...</p>
      </div>
    </div>
    
    <!-- YouTube Episodes (Right) -->
    <div class="youtube-episodes nes-container is-rounded">
      <h2 class="nes-text is-primary">YouTube Episodes</h2>
      <div id="youtube-episodes-list">
        <p>Loading videos...</p>
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
// Fetch and load audio episodes
fetch('/podcast_episodes.json')
  .then(response => response.json())
  .then(data => {
    const container = document.getElementById('audio-episodes-list');
    container.innerHTML = '';
    
    if (data.episodes && data.episodes.length > 0) {
      data.episodes.forEach(episode => {
        const episodeDiv = document.createElement('div');
        episodeDiv.className = 'episode-item';
        
        const titleDiv = document.createElement('div');
        titleDiv.className = 'episode-title';
        titleDiv.textContent = episode.title;
        
        const dateDiv = document.createElement('div');
        dateDiv.className = 'episode-date';
        const date = new Date(episode.date);
        dateDiv.textContent = date.toLocaleDateString('en-US', { year: 'numeric', month: 'long', day: 'numeric' });
        
        episodeDiv.appendChild(titleDiv);
        episodeDiv.appendChild(dateDiv);
        
        if (episode.audioUrl) {
          const audio = document.createElement('audio');
          audio.controls = true;
          audio.style.width = '100%';
          audio.style.marginTop = '0.5rem';
          
          const source = document.createElement('source');
          source.src = episode.audioUrl;
          source.type = 'audio/mpeg';
          
          audio.appendChild(source);
          episodeDiv.appendChild(audio);
        }
        
        container.appendChild(episodeDiv);
      });
    }
  })
  .catch(error => {
    console.error('Error loading episodes:', error);
    document.getElementById('audio-episodes-list').innerHTML = '<p>Error loading episodes</p>';
  });

// Fetch and load YouTube videos
fetch('/podcast_videos.json')
  .then(response => response.json())
  .then(data => {
    const container = document.getElementById('youtube-episodes-list');
    container.innerHTML = '';
    
    if (data.videos && data.videos.length > 0) {
      // Create video selector
      const selectorDiv = document.createElement('div');
      selectorDiv.className = 'video-selector nes-container is-rounded';
      selectorDiv.style.marginBottom = '1rem';
      selectorDiv.style.padding = '1rem';
      
      const label = document.createElement('label');
      label.htmlFor = 'video-select';
      label.className = 'nes-text';
      label.style.display = 'block';
      label.style.marginBottom = '0.5rem';
      label.textContent = 'Select Episode:';
      
      const selectDiv = document.createElement('div');
      selectDiv.className = 'nes-select';
      selectDiv.style.marginBottom = '0.5rem';
      
      const select = document.createElement('select');
      select.id = 'video-select';
      
      data.videos.forEach((video, index) => {
        const option = document.createElement('option');
        option.value = index;
        option.textContent = video.title;
        select.appendChild(option);
      });
      
      selectDiv.appendChild(select);
      selectorDiv.appendChild(label);
      selectorDiv.appendChild(selectDiv);
      
      // Create navigation buttons
      const navDiv = document.createElement('div');
      navDiv.className = 'video-navigation';
      navDiv.style.display = 'flex';
      navDiv.style.gap = '0.5rem';
      navDiv.style.justifyContent = 'center';
      navDiv.style.marginBottom = '1rem';
      
      const prevBtn = document.createElement('button');
      prevBtn.className = 'nes-btn is-primary';
      prevBtn.textContent = '‹ Previous';
      
      const nextBtn = document.createElement('button');
      nextBtn.className = 'nes-btn is-primary';
      nextBtn.textContent = 'Next ›';
      
      navDiv.appendChild(prevBtn);
      navDiv.appendChild(nextBtn);
      selectorDiv.appendChild(navDiv);
      
      // Create video embed
      const embedDiv = document.createElement('div');
      embedDiv.className = 'youtube-embed';
      embedDiv.style.marginBottom = '1rem';
      
      const iframe = document.createElement('iframe');
      iframe.id = 'video-player';
      iframe.width = '100%';
      iframe.height = '500';
      iframe.frameBorder = '0';
      iframe.allow = 'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share';
      iframe.allowFullscreen = true;
      iframe.style.borderRadius = '4px';
      
      embedDiv.appendChild(iframe);
      
      // Create playlist link
      const linkDiv = document.createElement('p');
      linkDiv.style.textAlign = 'center';
      linkDiv.style.marginTop = '1rem';
      
      const link = document.createElement('a');
      link.href = 'https://youtube.com/playlist?list=PLz-qXKR6_H_miJi7Vg8QVgeug83Jq5d73';
      link.target = '_blank';
      link.rel = 'noopener noreferrer';
      link.className = 'nes-btn is-primary';
      link.textContent = 'View Full Playlist on YouTube';
      
      linkDiv.appendChild(link);
      
      container.appendChild(selectorDiv);
      container.appendChild(embedDiv);
      container.appendChild(linkDiv);
      
      // Video navigation logic
      let currentVideoIndex = 0;
      
      function displayVideo(index) {
        if (data.videos[index]) {
          const video = data.videos[index];
          iframe.src = `https://www.youtube.com/embed/${video.id}?rel=0`;
          iframe.title = video.title;
          currentVideoIndex = index;
          select.value = index;
        }
      }
      
      select.addEventListener('change', (e) => {
        displayVideo(parseInt(e.target.value));
      });
      
      prevBtn.addEventListener('click', () => {
        if (currentVideoIndex > 0) {
          displayVideo(currentVideoIndex - 1);
        }
      });
      
      nextBtn.addEventListener('click', () => {
        if (currentVideoIndex < data.videos.length - 1) {
          displayVideo(currentVideoIndex + 1);
        }
      });
      
     // Load first video (most recent)
if (data.videos && data.videos.length > 0) {
  displayVideo(data.videos.length - 1);
}
    }
  })
  .catch(error => {
    console.error('Error loading videos:', error);
    document.getElementById('youtube-episodes-list').innerHTML = '<p>Error loading videos</p>';
  });
</script>
