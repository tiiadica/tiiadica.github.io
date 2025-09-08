---
layout: page
title: World
permalink: /categories/world/
---

<h1>World Sports Posts</h1>
<p>Posts about international sports and global sporting events.</p>
<ul>
{% for post in site.categories.world %}
  <li>
    <a href="{{ post.url }}">{{ post.title }}</a>
    <span class="post-date">{{ post.date | date: "%Y-%m-%d" }}</span>
  </li>
{% endfor %}
</ul>