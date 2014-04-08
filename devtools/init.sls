# Generate list of development tools to install from package groups
{% if grains['os_family'] == 'Arch' %}
base-devel:
  pkg.installed:
    - pkgs:
      {% for package in salt['cmd.run']('pacman -Sgq base-devel').split() %}
      - {{ package }}
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

clang:
  pkg.installed

the_silver_searcher:
  pkg.installed
