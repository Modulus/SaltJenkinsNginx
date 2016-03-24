include:
  - nginx.installed-secure-ssl

jenkins.nginx.start:
  service.running:
    - name: nginx
    - watch:
      - pkg: nginx.installed
      - file: /etc/nginx/sites-enabled/jenkins.conf
      - file: jenkins.htpasswd-config
      - cmd: generate_key_and_crt
      - file: jenkins-config
    - require:
      - file: jenkins-config
      - file: jenkins.htpasswd-config
      - file: jenkins-config
      - pkg: nginx.installed


jenkins-config:
  file.managed:
    - name: /etc/nginx/sites-enabled/jenkins.conf
    - source: salt://nginx/jenkins-secure.conf
    - group: build
    - user: nginx-user
    - mode: 640

jenkins.htpasswd-config:
  file.managed:
    - name : /etc/nginx/htpasswd
    - source: salt://nginx/htpasswd
    - group: build
    - user: nginx-user
    - mode: 644
    - require:
      - pkg: nginx.installed



