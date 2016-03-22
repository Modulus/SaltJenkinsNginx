/etc/salt:
  file.directory:
    - group: build
    - dir_mode: 777
    - file_mode: 777


/var/cache/salt:
  file.directory:
    - group: build
    - dir_mode: 777
    - file_mode: 777

/var/log/salt:
  file.directory:
    - group: build
    - dir_mode: 777
    - file_mode: 777


/var/run/salt:
  file.directory:
    - group: build
    - dir_mode: 777
    - file_mode: 777
