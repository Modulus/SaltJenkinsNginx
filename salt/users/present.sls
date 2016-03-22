nginx-user:
  user.present:
    - fullname: nginx-user
    - home: /home/nginx-user
    - shell: /bin/bash
    - groups:
      - build
    - uid: 3000
    - gid: 4000
    - require:
      - group: build
build:  
  group.present:
    - gid: 4000
    - system: True
