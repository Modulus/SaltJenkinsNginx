include:
  - users.present
  - nginx.installed

jenkins-config:
  file.managed:
    - name: /etc/nginx/sites-enabled/jenkins.conf
    - source: salt://nginx/jenkins-secure.conf
    - group: build
    - user: nginx-user
    - mode: 640
htpasswd-config:
  file.managed:
    - name : /etc/nginx/htpasswd
    - source: salt://nginx/htpasswd
    - group: build
    - user: nginx-user
    - mode: 644
