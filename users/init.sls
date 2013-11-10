{% for username, user in pillar.get('users', {}).items() %}
{{ username }}:
  group.present:
    - name: {{ username }}
    - gid: {{ user.uid }}
  {% if 'keys' in user %}
  file.managed:
    - name: /home/{{ username }}/.ssh/id_rsa
    - makedirs: true
    - user: {{ username }}
    - group: {{ username }}
    - mode: 600
    - contents_pillar: users:{{ username }}:keys:private
  file.managed:
    - name: /home/{{ username }}/.ssh/id_rsa.pub
    - makedirs: true
    - user: {{ username }}
    - group: {{ username }}
    - mode: 644
    - contents_pillar: users:{{ username }}:keys:public
  {% endif %}
  user.present:
    - uid: {{ user.uid }}
    - gid: {{ user.uid }}
    - home: /home/{{ username }}
    - shell: {{ user.get('shell', '/bin/zsh') }}
    - realname: {{ user.realname }}
    - password: {{ user.password }}
    - enforce_password: false
    - remove_groups: false
    - groups:
      - users
      {% for group in user.groups %}
      - {{ group }}
      {% endfor %}
{% endfor %}
