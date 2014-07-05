{% if grains['virtual'] == 'VirtualBox' %}
include:
  - virtualbox.guest

vboxvideo:
  kmod.present:
    - persist: True
    - require:
      - pkg: virtualbox-guest-pkgs

vboxservice:
  service.running:
    - enable: True

{% else %}

{% for gpu in grains.get('gpus', []) %}
{% if gpu.vendor == 'intel' %}
xf86-video-intel:
  pkg.installed

intel-dri:
  pkg.installed
{% endif %}
{% endfor %}

{% endif %}
