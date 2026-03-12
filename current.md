---
layout: page
title: Current
permalink: /categories/current/
---
{% include featured-by-category.html category="current" %}
<ul>
{% for post in site.categories.current %}
  <li>
    <a href="{{ post.url }}">{{ post.title }}</a>
    <span class="post-date">{{ post.date | date: "%Y-%m-%d" }}</span>
  </li>
{% endfor %}
</ul>
