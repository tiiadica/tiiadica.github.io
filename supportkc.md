---
layout: page
title: Support KC
permalink: /categories/supportkc/
---

<h1>Support KC Posts</h1>
<p>Posts about supporting Kansas City sports teams and community.</p>
<ul>
{% for post in site.categories.supportkc %}
  <li>
    <a href="{{ post.url }}">{{ post.title }}</a>
    <span class="post-date">{{ post.date | date: "%Y-%m-%d" }}</span>
  </li>
{% endfor %}
</ul>