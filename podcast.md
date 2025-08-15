---
layout: page
title: Podcast
permalink: /categories/podcast/
---

<h1>Podcast Posts</h1>
<p>Posts about our podcast episodes and Kansas City sports discussions.</p>
<ul>
{% for post in site.categories.podcast %}
  <li>
    <a href="{{ post.url }}">{{ post.title }}</a>
    <span class="post-date">{{ post.date | date: "%Y-%m-%d" }}</span>
  </li>
{% endfor %}
</ul>