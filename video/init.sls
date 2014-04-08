{% for gpu in grains.get('gpus', []) %}
{% if gpu.vendor == 'intel' %}
xf86-video-intel:
  pkg.installed

intel-dri:
  pkg.installed
{% endif %}
{% endfor %}
