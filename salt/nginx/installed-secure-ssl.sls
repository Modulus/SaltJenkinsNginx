include:
  - nginx.installed

install_openssl:
  pkg.installed:
    - pkgs:
       - openssl

generate_key_and_crt:
  cmd.run:
    - name: openssl req -new -newkey rsa:4096 -days 3650  -nodes -x509 -subj "/C=NO/ST=Hordaland/L=Bergen/O=Dis/CN=www.example.com" -keyout /etc/nginx/ssl/nginx.key  -out /etc/nginx/ssl/nginx.cert
    - require:
      - pkg: nginx.installed
    - unless: cat /etc/nginx/ssl/nginx.key
    - require:
      - file: /etc/nginx/ssl

nginx.start:
  service.running:
    - name: nginx
    - watch:
      - pkg: nginx.package
      - file: /etc/nginx/sites-enabled/jenkins.conf
      - file: /etc/nginx/htpasswd
      - cmd: generate_key_and_crt
      - file: jenkins-config
    - require:
      - file: jenkins-config
      - file: htpasswd-config
      - file: /etc/nginx/sites-enabled/jenkins.conf
      - pkg: nginx.installed

htpasswd-config:
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

