---
layout: page
title: Local
permalink: /local/
---
<div class="nav">
  <a class="nes-btn is-primary" href="/podcast/">PODCAST</a>
  <a class="nes-btn is-success" href="/royals/">ROYALS</a>
  <a class="nes-btn is-warning" href="/categories/current/">CURRENT</a>
  <a class="nes-btn is-chiefs" href="/categories/chiefs/">CHIEFS</a>
  <a class="nes-btn is-local" href="/local/">LOCAL</a>
  <a class="nes-btn is-dark" href="/categories/stats/">STATS</a>
</div>

{% include featured-by-category.html category="local" %}
<section id="recent-posts" class="nes-container is-rounded" style="margin-bottom:1rem;">
  <p class="title">Recent Posts</p>
  {% if site.posts.size == 0 %}
    <p class="small">No posts yet.</p>
  {% else %}
    <ul class="post-list">
      {% for post in site.categories.local limit:5 %}
        <li>
          <a href="{{ post.url }}">{{ post.title }}</a>
          <span class="post-date small">{{ post.date | date: "%Y-%m-%d" }}</span>
          {% if post.categories %}
  <span class="small">
    {% for cat in post.categories %}
      {% include category-badge.html category=cat %}
    {% endfor %}
  </span>
{% endif %}
        </li>
      {% endfor %}
    </ul>
    <p class="small"><a href="/news/">View all posts →</a></p>
  {% endif %}
</section>

<div style="display: flex; justify-content: center; margin: 2rem 0;">
  <iframe src="https://theroyalfamilypodkc.substack.com/embed" width="480" height="320" style="border: 1px solid #EEE; background: white" frameborder="0" scrolling="no"></iframe>
</div>

