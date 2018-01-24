---
layout: default
title: Tags
efn: false
---
<h1 class="page-heading">Tags</h1>
<ul>
{% assign tags_list = site.tags %}
  {% if tags_list.first[0] == null %}
    {% for tag in tags_list %}
      <li><a href="#{{ tag }}">{{ tag | capitalize }} ({{ site.tags[tag].size }})</a></li>
    {% endfor %}
  {% else %}
    {% for tag in tags_list %}
      <li><a href="tag/{{ tag[0] }}">{{ tag[0] | capitalize }} ({{ tag[1].size }})</a></li>
    {% endfor %}
  {% endif %}
{% assign tags_list = nil %}
</ul>
