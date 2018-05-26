pipeline {
  agent any
  stages {
    stage('Bootstrap Servers') {
      steps {
        sh '''
        kolla-ansible -v -e 'ansible_become=true' -e 'ansible_user=root' -i ./inventory --configdir . --passwords /var/jenkins_home/passwords.yml bootstrap-servers
        '''
      }
    }
 
    stage('Prechecks') {
      steps {
        sh '''
        kolla-ansible -v -e 'ansible_become=true' -e 'ansible_user=root' -i ./inventory --configdir . --passwords /var/jenkins_home/passwords.yml prechecks
        '''
      }
    }

    stage('Deploy Openstack') {
      steps {
        sh '''
        kolla-ansible -v -e 'ansible_become=true' -e 'ansible_user=root' -i ./inventory --configdir . --passwords /var/jenkins_home/passwords.yml deploy
        '''
      }
    }

    stage('Test Openstack') {
      steps {
        sshagent (credentials: ['rally']) {
          sh 'ssh -o StrictHostKeyChecking=no -l rally -p 5000 10.42.66.209 /home/rally/scripts/benchmark.sh'
        }
      }
    }
  }
}
