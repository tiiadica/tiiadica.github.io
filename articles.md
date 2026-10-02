---
layout: page
title: Articles
permalink: /articles/
---
<div class="nav">
  <a class="nes-btn is-primary" href="/podcast/">PODCAST</a>
  <a class="nes-btn is-success" href="/royals/">ROYALS</a>
  <a class="nes-btn is-warning" href="/categories/current/">CURRENT</a>
  <a class="nes-btn is-chiefs" href="/categories/chiefs/">CHIEFS</a>
  <a class="nes-btn is-local" href="/local/">LOCAL</a>
  <a class="nes-btn is-dark" href="/articles/">ARTICLE</a>
</div>

<main class="wrap">
  <ul class="post-list">
    {% for post in site.posts %}
      <li>
        {% if post.image %}
          <div style="margin-bottom: 1rem;">
            <img src="{{ post.image }}" alt="{{ post.title }}" style="width: 100%; height: 300px; object-fit: cover; border-radius: 4px;">
          </div>
        {% endif %}
        <a href="{{ post.url }}">{{ post.title }}</a>
        <span class="small">{{ post.date | date: "%Y-%m-%d" }}</span>
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
</main>
