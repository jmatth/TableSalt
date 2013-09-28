vim:
  pkg:
    - installed
    {% if grains['cpuarch'][:3] == 'arm' %}
    - name: vim
    {% elif grains['os_family'] == 'RedHat' %}
    - name: vim-enhanced
    {% elif grains['os_family'] == 'Debian' %}
    - name: vim-nox
    {% elif grains['os_family'] == 'Arch' %}
    - name: gvim
    {% endif %}
