pipeline {
  agent any
  stages {
    stage('Bootstrap Servers') {
      steps {
        sh '''
        kolla-ansible -e 'ansible_become=true' -e 'ansible_user=root' -i ./inventory --configdir . --passwords /var/jenkins_home/passwords.yml bootstrap-servers
        '''
      }
    }

    stage('Prechecks') {
      steps {
        sh '''
        kolla-ansible -e 'ansible_become=true' -e 'ansible_user=root' -i ./inventory --configdir . --passwords /var/jenkins_home/passwords.yml prechecks
        '''
      }
    }

    stage('Deploy Openstack') {
      steps {
        sh '''
        kolla-ansible -e 'ansible_become=true' -e 'ansible_user=root' -i ./inventory --configdir . --passwords /var/jenkins_home/passwords.yml deploy 
        '''
      }
    }
  }
}
