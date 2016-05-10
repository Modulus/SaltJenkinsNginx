include:
  - jenkins
  - build_server.ssh

extend:
  jenkins:
    service:
      - watch:
        - cmd: jenkins.install.plugins

install.unzip:
  pkg.installed:
    - name: unzip
    - require_in:
      - cmd: jenkins.install.plugins

# Installing plugins with bash script, the formula way is not working
jenkins.install.plugins:
  cmd.run:
    - name: /var/lib/jenkins/install_plugins.sh workflow-aggregator github
    - cwd: /var/lib/jenkins/
    - require:
      - file: copy.install.script

copy.install.script:
  file.managed:
    - name: /var/lib/jenkins/install_plugins.sh
    - source: salt://build_server/install_plugins.sh
    - mode: 770



        #- file: jenkins.pipeline.plugin
        #- file: jenkins.script.security.plugin
        # - file: jenkins.junit.plugin
        # - file: jenkins.matrix.project.plugin
        # - file: jenkins.windows.slaves.plugin
        # - file: jenkins.icon.shim.plugin
        # - file: jenkins.matrix.auth.plugin
        # - file: jenkins.credentials.plugin
        # - file: jenkins.owas.markup.formatter.plugin
        # - file: jenkins.ssh.credentials.plugin
        # - file: jenkins.git.client.plugin
        # - file: jenkins.mailer.plugin
        # - file: jenkins.scm.api.plugin
        #- cmd: cmd.spit.out.password

#cmd.spit.out.password:
#  cmd.wait:
#    - name: cat /var/lib/jenkins/secrets/initialAdminPassword



# TODO: Download files and have them linked locally
# Git plugin and dependencies
# jenkins.git.plugin:
#   file.managed:
#     - source: http://updates.jenkins-ci.org/download/plugins/workflow-aggregator/2.1/workflow-aggregator.hpi
#     - name: /var/lib/jenkins/plugins/workflow-aggregator.hpi
#     - source_hash: sha256=0a9c6710caba7e033913b1f41dd2e75c3eb0c0811c952bc0755b43ab69c73f4c
#
# jenkins.pipeline.plugin:
#   file.managed:
#     - source: http://updates.jenkins-ci.org/download/plugins/git/2.4.4/git.hpi
#     - name: /var/lib/jenkins/plugins/git.hpi
#     - source_hash: sha256=7d85a8ea79bb010984b0bf424d9edfb2c2d59e94608d940149f7555141770fdc
#
# jenkins.script.security.plugin:
#   file.managed:
#     - source: http://updates.jenkins-ci.org/download/plugins/script-security/1.19/script-security.hpi
#     - source_hash: sha256=c9131b663b6e78bc21659ef90828f68036f8a6d9badc1961c2e2dad1443b97fa
#     - name: /var/lib/jenkins/plugins/script-security.hpi
#
#
# jenkins.junit.plugin:
#   file.managed:
#     - source: http://updates.jenkins-ci.org/download/plugins/junit/1.13/junit.hpi
#     - source_hash: sha256=6cd3761decf78c2b49190b3f7de8ed1d626e5acbdc7bfc8c9ed6699ca80fb539
#     - name: /var/lib/jenkins/plugins/junit.hpi
#
# jenkins.matrix.project.plugin:
#   file.managed:
#     - source: http://updates.jenkins-ci.org/download/plugins/matrix-project/1.6/matrix-project.hpi
#     - source_hash: sha256=3c6fd1c5807f197fe7649449661b2c1a103efb1f88c39fc330391e7d372877dd
#     - name: /var/lib/jenkins/plugins/matrix-project.hpi
#
#
# jenkins.windows.slaves.plugin:
#   file.managed:
#     - source: http://updates.jenkins-ci.org/download/plugins/windows-slaves/1.1/windows-slaves.hpi
#     - source_hash: sha256=fd21a33764cabe6063f4f6852b014e1dbfabd842e5a900fdad9e27cfcb6b1086
#     - name: /var/lib/jenkins/plugins/windows-slaves.hpi
#
# jenkins.icon.shim.plugin:
#   file.managed:
#     - source: http://updates.jenkins-ci.org/download/plugins/icon-shim/2.0.3/icon-shim.hpi
#     - source_hash: sha256=8ab2f1617b68561a7f0254fb27578840aa9b7e158d0bd8c51628dbc64e8ab0ca
#     - name: /var/lib/jenkins/plugins/icon-shim.hpi
#
# jenkins.matrix.auth.plugin:
#   file.managed:
#     - source: http://updates.jenkins-ci.org/download/plugins/matrix-auth/1.3.2/matrix-auth.hpi
#     - source_hash: sha256=6430fd2bc24a305d01493ae7db0931576e84585ffd01f7b826134aa20757ab01
#     - name: /var/lib/jenkins/plugins/matrix-auth.hpi
#
# jenkins.credentials.plugin:
#   file.managed:
#     - source: http://updates.jenkins-ci.org/download/plugins/credentials/1.28/credentials.hpi
#     - source_hash: sha256=17467c6289b07b375b5055961f54e61b04172f76638bb972f05d0724fd963540
#     - name: /var/lib/jenkins/plugins/credentials.hpi
#
# jenkins.owas.markup.formatter.plugin:
#   file.managed:
#     - source: http://updates.jenkins-ci.org/download/plugins/antisamy-markup-formatter/1.3/antisamy-markup-formatter.hpi
#     - source_hash: sha256=08334fdc28b431734d487ae7442871de4df7b5dca547058d08b70d8ffce30403
#     - name: /var/lib/jenkins/plugins/antisamy-markup-formatter.hpi
#
# jenkins.ssh.credentials.plugin:
#   file.managed:
#     - source: http://updates.jenkins-ci.org/download/plugins/ssh-credentials/1.11/ssh-credentials.hpi
#     - source_hash: sha256=e80f36af0162794d80164ae479d7cc36077174f50d57d04f2d814b4bbe4eab18
#     - name: /var/lib/jenkins/plugins/ssh-credentials.hpi
#
# jenkins.git.client.plugin:
#   file.managed:
#     - source: https://updates.jenkins-ci.org/download/plugins/git-client/1.19.6/git-client.hpi
#     - source_hash: sha256=4b94e1bca80ced374593a7872a2e24fe83334557412cdf8a139d3a7c01b4c9ca
#     - name: /var/lib/jenkins/plugins/git-client.hpi
#
# jenkins.mailer.plugin:
#   file.managed:
#     - source: http://updates.jenkins-ci.org/download/plugins/mailer/1.17/mailer.hpi
#     - source_hash: sha256=b29b8a9474543af2c08741733b5b021632d607d0f8a9fc7f8b3e3b3d253d5967
#     - name: /var/lib/jenkins/plugins/mailer.hpi
#
# jenkins.scm.api.plugin:
#   file.managed:
#     - source: http://updates.jenkins-ci.org/download/plugins/scm-api/1.2/scm-api.hpi
#     - source_hash: sha256=21c0d389ecbfedb84ad92fa736f93171fe2042d3418e1ed8b65d8dd1d0adfafc
#     - name: /var/lib/jenkins/plugins/scm-api.hpi


#pipeline plugin and dependencies
#jenkins.plugin.pipeline.plugin:
#  file.managed:
#    - source: http://updates.jenkins-ci.org/download/plugins/workflow-aggregator/2.1/workflow-aggregator.hpi
#    - source_hash:
#    - name:

#http://updates.jenkins-ci.org/latest/workflow-scm-step.hpi
  #http://updates.jenkins-ci.org/latest/pipeline-stage-view.hpi
