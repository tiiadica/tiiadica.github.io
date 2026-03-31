---
layout: page
title: Support KC
permalink: /categories/supportkc/
---
<div class="nav">
  <a class="nes-btn is-primary" href="/podcast/">PODCAST</a>
  <a class="nes-btn is-success" href="/royals/">ROYALS</a>
  <a class="nes-btn is-warning" href="/categories/current/">CURRENT</a>
  <a class="nes-btn is-world" href="/categories/world/">WORLD</a>
  <a class="nes-btn is-inkc" href="/categories/supportkc/">IN KC</a>
  <a class="nes-btn is-dark" href="/categories/stats/">STATS</a>
</div>

{% include featured-by-category.html category="Support KC" %}
<ul>
{% for post in site.categories.supportkc %}
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
      {% for post in site.categories.supportkc limit:5 %}
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
