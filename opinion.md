---
layout: page
title: Opinion
permalink: /categories/opinion/
---

<p>Opinion pieces and analysis about Kansas City sports.</p>
<ul>
{% for post in site.categories.opinion %}
  <li>
    <a href="{{ post.url }}">{{ post.title }}</a>
    <span class="post-date">{{ post.date | date: "%Y-%m-%d" }}</span>
  </li>
{% endfor %}
</ul>