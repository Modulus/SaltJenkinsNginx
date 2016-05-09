jenkins.ssh:
  cmd.run:
    - name: ssh-keygen -C "nginx-user" -b 2048 -t rsa -f {{pillar['jenkins']['lookup']['home']}}/.ssh/id_rsa -q -N ""
    - unless: cat {{pillar['jenkins']['lookup']['home']}}/.ssh/id_rsa
    - require:
      - file: jenkins.ssh.folder

jenkins.ssh.folder:
  file.directory:
    - name: {{pillar['jenkins']['lookup']['home']}}/.ssh
    - makedirs: True
    - user: jenkins
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - mode
