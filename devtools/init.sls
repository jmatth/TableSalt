# Generate list of development tools to install from package groups
{% if grains['os_family'] == 'Arch' %}
{% for package in salt['cmd.run']('pacman -Qgq base-devel').split() %}
devtools-{{ package }}:
  pkg.installed:
    - name: {{ package }}
{% endfor %}
{% endif %}

git:
  pkg.installed
