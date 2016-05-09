generate_ssh_keys:
  cmd.run:
    - name: ssh-keygen -C "nginx-user" -b 2048 -t rsa -f /srv/salt/keys/id_rsa -q -N ""
    - require:
      - file: create_key_directory
    - unless: cat /srv/salt/keys/id_rsa

create_key_directory:
  file.directory:
    - name: /srv/salt/keys/
    - makedirs: True
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - mode
