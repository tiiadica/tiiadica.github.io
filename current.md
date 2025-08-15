---
layout: page
title: Current
permalink: /categories/current/
---

<h1>KC Current Posts</h1>
<p>Posts about Kansas City Current and women's professional soccer.</p>
<ul>
{% for post in site.categories.current %}
  <li>
    <a href="{{ post.url }}">{{ post.title }}</a>
    <span class="post-date">{{ post.date | date: "%Y-%m-%d" }}</span>
  </li>
{% endfor %}
</ul>