---
layout: page
title: Categories
permalink: /categories/
---

<p>Browse all categories used on the site.</p>
<ul class="category-list">
{% assign cats = site.categories | sort %}
{% for cat in cats %}
  {% assign cat_name = cat[0] %}
  <li>
    <a href="/{{ cat_name | downcase | replace: ' ', '-' }}/">
      {{ cat_name | capitalize }} ({{ cat[1].size }})
    </a>
  </li>
{% endfor %}
</ul>