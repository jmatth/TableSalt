include:
  - ssh

sshd:
  service:
    - running
    - enabled
    {% if grains['os_family'] == 'Debian' %}
    - name: ssh
    {% endif %}
    - require:
      - file: sshd
  file.managed:
    - name: /etc/ssh/sshd_config
    - source: salt://ssh/server/sshd_config
    - user: root
    - group: root
    - mode: 644
    - require:
      {% if grains['os_family'] == 'Debian' %}
      - pkg: openssh-server
      {% else %}
      - pkg: openssh
      {% endif %}

{% if grains['os_family'] == 'Debian' %}
openssh-server:
  pkg.installed
{% endif %}
