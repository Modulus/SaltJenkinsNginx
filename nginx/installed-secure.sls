include:
  - users.present

nginx.package:
  pkg.installed:
    - pkgs:
      - nginx
    - require:
      - user: nginx-user
  service.running:
    - name: nginx
    - watch:
      - pkg: nginx.package
      - file: /etc/nginx/sites-enabled/jenkins.conf
      - file: /etc/nginx/htpasswd
    - require:
      - file: jenkins-config
      - file: htpasswd-config 
remove-default-sites:
  file.absent:
    - name: /etc/nginx/sites-enabled/default
    - require:
      - pkg: nginx.package

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
