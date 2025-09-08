---
layout: page
title: Support KC
permalink: /support-kc/
---

<h1>Support KC Posts</h1>
<p>Posts about supporting Kansas City sports and community initiatives.</p>

<div class="nes-container is-rounded" style="margin-bottom: 1rem;">
  <h2>Featured: Ways to Support KC Sports</h2>
  <p>Kansas City's sports scene thrives because of community support. From attending games to supporting local businesses, every fan plays a role in our city's championship culture.</p>
  
  <h3>Show Your Support</h3>
  <ul>
    <li><strong>Attend Games:</strong> Nothing beats the energy of live sports in Kansas City</li>
    <li><strong>Local Businesses:</strong> Support restaurants and shops near our stadiums</li>
    <li><strong>Youth Sports:</strong> Get involved with local leagues and development programs</li>
    <li><strong>Community Events:</strong> Participate in team-sponsored community activities</li>
  </ul>
  
  <h3>Championship Culture</h3>
  <p>Kansas City's recent success isn't just about talented players - it's about a community that rally behind their teams through thick and thin. This support creates an atmosphere that visiting teams notice and respect.</p>
  
  <h3>Beyond the Big Leagues</h3>
  <p>Supporting KC sports means more than just professional teams. High school Friday night lights, college gameday traditions, and youth league championships all contribute to our city's rich sports culture.</p>
</div>

<ul>
{% for post in site.categories.support-kc %}
  <li>
    <a href="{{ post.url }}">{{ post.title }}</a>
    <span class="post-date">{{ post.date | date: "%Y-%m-%d" }}</span>
  </li>
{% endfor %}
</ul>