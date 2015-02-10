libreoffice:
  pkg:
    - installed
{% if grains['os_family'] == 'Arch' %}
    - name: libreoffice-fresh

hunspell-en:
  pkg:
    - installed
{% endif %}
