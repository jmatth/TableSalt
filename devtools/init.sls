# Generate list of development tools to install from package groups
{% if grains['os_family'] == 'Arch' %}
{% for package in salt['cmd.run']('pacman -Sgq base-devel').split() %}
devtools-{{ package }}:
  pkg.installed:
    - name: {{ package }}
{% endfor %}
{% elif grains['os_family'] == 'Debian' %}
build-essential:
  pkg:
    - installed
{% endif %}

cmake:
  pkg:
    - installed

ctags:
  pkg:
    - installed
    {% if grains['os_family'] == 'Debian' %}
    - name: exuberant-ctags
    {% endif %}

git:
  pkg.installed
