python3:
  pkg.installed:
    {% if grains['os_family'] == 'Arch' %}
    - name: python
    {% endif %}
