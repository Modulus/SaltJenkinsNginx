include:
  - users.present
  - nginx.installed

generate_ssh_keys:
  cmd.run:
    - name: ssh-keygen -b 2048 -t rsa -f /srv/salt/keys/.id_rsa -q -N ""
    - require:
      - user: nginx-user
      - file: create_key_directory
      - pkg: nginx.package

create_key_directory:
  file.directory:
    - name: /srv/salt/keys/
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
  
