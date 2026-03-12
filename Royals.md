---
layout: page
title: Royals
permalink: /royals/
---

{% include featured-by-category.html category="Royals" %}
<ul>
{% for post in site.categories.Royals %}
  <li>
    <a href="{{ post.url }}">{{ post.title }}</a>
    <span class="post-date">{{ post.date | date: "%Y-%m-%d" }}</span>
  </li>
{% endfor %}
</ul>
<section id="recent-posts" class="nes-container is-rounded" style="margin-bottom:1rem;">
  <p class="title">Recent Posts</p>
  {% if site.posts.size == 0 %}
    <p class="small">No posts yet.</p>
  {% else %}
    <ul class="post-list">
      {% for post in site.categories.Royals limit:5 %}
        <li>
          <a href="{{ post.url }}">{{ post.title }}</a>
          <span class="post-date small">{{ post.date | date: "%Y-%m-%d" }}</span>
          {% if post.categories %}
            <span class="small">
              {% for cat in post.categories %}
                <a href="/categories/{{ cat | downcase | urlencode }}/">{{ cat }}</a>{% unless forloop.last %}, {% endunless %}
              {% endfor %}
            </span>
          {% endif %}
        </li>
      {% endfor %}
    </ul>
    <p class="small"><a href="/news/">View all posts →</a></p>
  {% endif %}
</section>

<section id="new-episode" class="nes-container is-rounded" style="margin-bottom:1rem;">
  <p class="title" style="color: #FFFFFF;">New Episode</p>
  <div id="latest-video-container" style="text-align: center;">
    <p>Loading video...</p>
  </div>
</section>

<script>
fetch('/podcast_videos.json')
  .then(response => response.json())
  .then(data => {
    const container = document.getElementById('latest-video-container');
    container.innerHTML = '';
    
    if (data.videos && data.videos.length > 0) {
      const latestVideo = data.videos[data.videos.length - 1]; // Last video is most recent
      
      const videoDiv = document.createElement('div');
      videoDiv.style.marginBottom = '1rem';
      videoDiv.style.display = 'flex';
      videoDiv.style.justifyContent = 'center';
      
      const iframe = document.createElement('iframe');
      iframe.style.width = '560px';
      iframe.style.maxWidth = '100%';
      iframe.height = '400';
      iframe.src = `https://www.youtube.com/embed/${latestVideo.id}?rel=0`;
      iframe.title = latestVideo.title;
      iframe.frameBorder = '0';
      iframe.allow = 'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share';
      iframe.allowFullscreen = true;
      iframe.style.borderRadius = '4px';
      
      videoDiv.appendChild(iframe);
      container.appendChild(videoDiv);
    }
  })
  .catch(error => {
    console.error('Error loading video:', error);
    document.getElementById('latest-video-container').innerHTML = '<p>Error loading latest episode</p>';
  });
</script>
