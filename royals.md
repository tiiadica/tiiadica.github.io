---
layout: page
title: Royals
permalink: /royals/
---

<p>Posts tagged with the 'Royals' category.</p>
<ul>
{% for post in site.categories.Royals %}
  <li>
    <a href="{{ post.url }}">{{ post.title }}</a>
    <span class="post-date">{{ post.date | date: "%Y-%m-%d" }}</span>
  </li>
{% endfor %}
</ul>