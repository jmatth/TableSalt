{% for username, user in pillar.get('users', {}).items() %}
{{ username }}:
  user.present:
    - home: /home/{{ username }}
    - shell: {{ user.get('shell', '/bin/zsh') }}
    - realname: {{ user.get('realname', '') }}
    {% if 'password' in user %}
    - password: {{ user.password }}
    {% endif %}
    - enforce_password: false
    - remove_groups: false
    - groups:
      - users
      {% for group in user.get('groups', []) %}
      - {{ group }}
      {% endfor %}

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
{% endfor %}
