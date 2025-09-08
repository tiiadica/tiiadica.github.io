---
layout: page
title: World
permalink: /world/
---

<h1>World Sports Posts</h1>
<p>Posts about international sports, global competitions, and worldwide athletic events.</p>

<div class="nes-container is-rounded" style="margin-bottom: 1rem;">
  <h2>Featured: KC Athletes on the World Stage</h2>
  <p>Kansas City athletes and teams regularly compete at the highest international levels, representing our city with pride and excellence around the globe.</p>
  
  <h3>International Connections</h3>
  <ul>
    <li><strong>Soccer:</strong> KC Current players representing their countries in international competitions</li>
    <li><strong>Baseball:</strong> Royals alumni competing in World Baseball Classic</li>
    <li><strong>Olympic Sports:</strong> Kansas City natives competing for Olympic medals</li>
    <li><strong>Global Leagues:</strong> Local players finding success in international professional leagues</li>
  </ul>
  
  <h3>World Events Impact</h3>
  <p>Major international sporting events influence Kansas City's sports culture. From World Cup viewing parties to Olympic celebrations, our city embraces global competition while supporting our local athletes who compete internationally.</p>
  
  <h3>Cultural Exchange</h3>
  <p>International players and coaches bring global perspectives to Kansas City sports, enriching our teams and community with diverse approaches to training, strategy, and sportsmanship.</p>
</div>

<ul>
{% for post in site.categories.world %}
  <li>
    <a href="{{ post.url }}">{{ post.title }}</a>
    <span class="post-date">{{ post.date | date: "%Y-%m-%d" }}</span>
  </li>
{% endfor %}
</ul>