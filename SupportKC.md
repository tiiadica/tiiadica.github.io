---
layout: page
title: Support KC
permalink: /categories/supportkc/
---

{% include featured-by-category.html category="Support KC" %}
<ul>
{% for post in site.categories.supportkc %}
  <li>
    <a href="{{ post.url }}">{{ post.title }}</a>
    <span class="post-date">{{ post.date | date: "%Y-%m-%d" }}</span>
  </li>
{% endfor %}
</ul>
