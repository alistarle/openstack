pipeline {
  agent any
  stages {
    stage('') {
      steps {
        sh '''kolla-ansible --user root -i ./inventory --configdir . --passwords /var/jenkins_home/passwords.yml bootstrap-servers
kolla-ansible --user root -i ./inventory --configdir . --passwords /var/jenkins_home/passwords.yml prechecks
kolla-ansible --user root -i ./inventory --configdir . --passwords /var/jenkins_home/passwords.yml deploy '''
      }
    }
  }
}
