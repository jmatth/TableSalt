{% if grains['os_family'] == 'Arch' %}
{% for package in salt['cmd.run']('pacman -Sgq gnome').split() %}
{{ package }}:
  pkg.installed
{% endfor %}
{% endif %}
