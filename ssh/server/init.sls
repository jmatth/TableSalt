include:
  - ssh

sshd:
  pkg:
    - installed
    {% if grains['os_family'] == 'Debian' %}
    - name: openssh-server
    {% elif grains['os_family'] == 'RedHat' %}
    - name: openssh-server
    {% elif grains['os_family'] == 'Arch' %}
    - name: ssh
    {% endif %}

  service:
    - running
    - enable: True
    {% if grains['os_family'] == 'Debian' %}
    - name: ssh
    {% elif grains['os_family'] == 'RedHat' %}
    - name: sshd
    {% elif grains['os_family'] == 'Arch' %}
    - name: sshd
    {% endif %}
    - require:
      - pkg: sshd
      - file: sshd

  file.managed:
    - name: /etc/ssh/sshd_config
    - source: salt://ssh/server/sshd_config
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: sshd
