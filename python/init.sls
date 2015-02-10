python:
  pkg.installed:
    - pkgs:
      {% if grains['os_family'] == 'Arch' %}
      - python
      - python-pip
      - python2
      - python2-pip
      {% else %}
      - python
      - python-pip
      - python3
      - python3-pip
      {% endif %}
