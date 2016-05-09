jenkins:
  lookup:
    port: 8080
    jenkins_port: 8080
    home: /usr/local/jenkins
    user: jenkins
    group: www-data
    cli_path: '/usr/local/jenkins/jenkins-cli.jar'
    #server_name: localhost
    plugins:
      installed:
        - git
        - github
        - workflow-aggregator
        - nexus-artifact-uploader
    pkgs:
      - jenkins
