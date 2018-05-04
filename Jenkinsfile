pipeline {
  agent any
  stages {
    stage('') {
      steps {
        sh '''kolla-ansible -e 'ansible_become=true' -e 'ansible_become_method=sudo' -i ./inventory --configdir . --passwords /var/jenkins_home/passwords.yml bootstrap-servers
kolla-ansible -e 'ansible_become=true' -e 'ansible_become_method=sudo' -i ./inventory --configdir . --passwords /var/jenkins_home/passwords.yml prechecks
kolla-ansible -e 'ansible_become=true' -e 'ansible_become_method=sudo' -i ./inventory --configdir . --passwords /var/jenkins_home/passwords.yml deploy '''
      }
    }
  }
}
