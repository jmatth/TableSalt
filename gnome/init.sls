gnome:
  {% if grains['os_family'] == 'Arch' %}
  pkg.installed:
    - pkgs:
      {% for package in salt['cmd.run']('pacman -Sgq gnome').split() %}
      - {{ package }}
      {% endfor %}
  {% endif %}
