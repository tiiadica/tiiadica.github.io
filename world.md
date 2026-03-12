---
layout: page
title: World
permalink: /categories/world/
---

{% include featured-by-category.html category="world" %}
<ul>
{% for post in site.categories.world %}
  <li>
    <a href="{{ post.url }}">{{ post.title }}</a>
    <span class="post-date">{{ post.date | date: "%Y-%m-%d" }}</span>
  </li>
{% endfor %}
</ul>
