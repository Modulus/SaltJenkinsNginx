include:
  - users.present

install_openssl:
  pkg.installed:
    - pkgs:
       - openssl

generate_key_and_crt:
  cmd.run:
    - name: openssl req -new -newkey rsa:4096 -days 3650  -nodes -x509 -subj "/C=NO/ST=Hordaland/L=Bergen/O=Dis/CN=www.example.com" -keyout /etc/nginx/ssl/nginx.key  -out /etc/nginx/ssl/nginx.cert 
    - cwd: /etc/nginx/ssl
    - require:
      - pkg: nginx.package

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
      - pkg: nginx.package

jenkins-config:
  file.managed:
    - name: /etc/nginx/sites-enabled/jenkins.conf
    - source: salt://nginx/jenkins-secure-ssl.conf
    - group: build
    - user: nginx-user
    - mode: 640
    - require:
      - cmd: generate_key_and_crt
htpasswd-config:
  file.managed:
    - name : /etc/nginx/htpasswd
    - source: salt://nginx/htpasswd
    - group: build
    - user: nginx-user
    - mode: 644
