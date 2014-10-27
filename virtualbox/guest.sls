virtualbox-guest-pkgs:
  pkg.installed:
  {% if grains['os_family'] == 'Arch' %}
    - pkgs:
      - virtualbox-guest-modules
      - virtualbox-guest-utils
  {% endif %}

{% for mod in ['vboxsf', 'vboxguest', 'vboxvideo'] %}
{{ mod }}:
  kmod.present:
    - persist: True
    - require:
      - pkg: virtualbox-guest-pkgs
{% endfor %}
