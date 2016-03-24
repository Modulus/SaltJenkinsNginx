include:
  - nginx.installed-secure-ssl

jenkins.nginx.start:
  service.running:
    - name: nginx
    - watch:
      - pkg: nginx.installed
      - file: /etc/nginx/sites-enabled/jenkins.conf
      - file: /etc/nginx/htpasswd
      - cmd: generate_key_and_crt
      - file: jenkins-config
    - require:
      - file: jenkins-config
      - file: htpasswd-config
      - file: /etc/nginx/sites-enabled/jenkins.conf
      - pkg: nginx.installed

jenkins.htpasswd-config:
  file.managed:
    - name : /etc/nginx/htpasswd
    - source: salt://nginx/htpasswd
    - group: build
    - user: nginx-user
    - mode: 644
    - require:
      - pkg: nginx.installed



/etc/nginx/ssl:
    file.directory:
    - user: nginx-user
    - group: build
    - dir_mode: 755
    - file_mode: 644
    - recurse:
        - user
        - group
        - mode
    - require:
      - pkg: nginx.installed

