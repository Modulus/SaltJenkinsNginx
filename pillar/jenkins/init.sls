jenkins:
  lookup:
    port: 80
    home: /usr/local/jenkins
    user: jenkins
    group: www-data
    server_name: localhost
    plugins:
      installed:
        - git
        - github
        - workflow-aggregator
        - nexus-artifact-uploader
    pkgs:
      - jenkins
