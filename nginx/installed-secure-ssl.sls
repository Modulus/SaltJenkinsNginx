include:
  - users.present
  - nginx.installed

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
    - unless: cat /etc/nginx/ssl/nginx.key


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

