include:
  - jenkins
extend:
  jenkins:
    service:
      - watch:
        - file: jenkins.git.plugin
        - file: jenkins.pipeline.plugin

# TODO: Download files and have them linked locally
jenkins.git.plugin:
  file.managed:
    - source: http://updates.jenkins-ci.org/download/plugins/workflow-aggregator/2.1/workflow-aggregator.hpi
    - name: /var/lib/jenkins/plugins/workflow-aggregator.hpi
    - source_hash: sha256=0a9c6710caba7e033913b1f41dd2e75c3eb0c0811c952bc0755b43ab69c73f4c

jenkins.pipeline.plugin:
  file.managed:
    - source: http://updates.jenkins-ci.org/download/plugins/git/2.4.4/git.hpi
    - name: /var/lib/jenkins/plugins/git.hpi
    - source_hash: sha256=7d85a8ea79bb010984b0bf424d9edfb2c2d59e94608d940149f7555141770fdc

jenkins.script.security.plugin:
  file.managed:
    - source: http://updates.jenkins-ci.org/download/plugins/script-security/1.19/script-security.hpi
    - name: /var/lib/asdfafd
    - source_hash:

jenkins.junit.plugin:
  file.managed:
    - source: http://updates.jenkins-ci.org/download/plugins/junit/1.13/junit.hpi

jenkins.matrix.project.plugin:
  file.managed:
    - source: http://updates.jenkins-ci.org/download/plugins/matrix-project/1.6/matrix-project.hpi

jenkins.windows.slaves.plugin:
  file.managed:
    - source: http://updates.jenkins-ci.org/download/plugins/windows-slaves/1.1/windows-slaves.hpi

jenkins.icon.shim.plugin:
  file.managed:
    - source: http://updates.jenkins-ci.org/download/plugins/icon-shim/2.0.3/icon-shim.hpi

jenkins.matrix.auth.plugin:
  file.managed:
    - source: http://updates.jenkins-ci.org/download/plugins/matrix-auth/1.3.2/matrix-auth.hpi

jenkins.Credentials.plugin:
  file.managed:
    - source: http://updates.jenkins-ci.org/download/plugins/credentials/1.28/credentials.hpi

jenkins.owas.markup.formatter.plugin:
  file.managed:
    - source: http://updates.jenkins-ci.org/download/plugins/antisamy-markup-formatter/1.3/antisamy-markup-formatter.hpi

jenkins.ssh.credentials.plugin:
  file.managed:
    - source: http://updates.jenkins-ci.org/download/plugins/ssh-credentials/1.11/ssh-credentials.hpi

jenkins.git.client.plugin:
  file.managed:
    - source: https://updates.jenkins-ci.org/download/plugins/git-client/1.19.6/git-client.hpi

jenkins.mailer.plugin:
  file.managed:
    - source: http://updates.jenkins-ci.org/download/plugins/mailer/1.17/mailer.hpi

jenkins.scm.api.plugin:
  file.managed:
    - source: http://updates.jenkins-ci.org/download/plugins/scm-api/1.2/scm-api.hpi
