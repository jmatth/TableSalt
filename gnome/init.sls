{% if grains['os_family'] == 'Arch' %}
{% for package in salt['cmd.run']('pacman -Qgq gnome').split() %}
{{ package }}:
  pkg.installed
{% endfor %}
{% endif %}
