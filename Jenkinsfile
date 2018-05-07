pipeline {
  agent any
  stages {
    // stage('Bootstrap Servers') {
    //   steps {
    //     sh '''
    //     kolla-ansible -e 'ansible_become=true' -e 'ansible_user=root' -i ./inventory --configdir . --passwords /var/jenkins_home/passwords.yml bootstrap-servers
    //     '''
    //   }
    // }

    // stage('Prechecks') {
    //   steps {
    //     sh '''
    //     kolla-ansible -e 'ansible_become=true' -e 'ansible_user=root' -i ./inventory --configdir . --passwords /var/jenkins_home/passwords.yml prechecks
    //     '''
    //   }
    // }

    // stage('Deploy Openstack') {
    //   steps {
    //     sh '''
    //     kolla-ansible -e 'ansible_become=true' -e 'ansible_user=root' -i ./inventory --configdir . --passwords /var/jenkins_home/passwords.yml deploy 
    //     '''
    //   }
    // }

    stage('Test Openstack') {
      sshagent (credentials: ['rally']) {
        sh '''ssh -o StrictHostKeyChecking=no -l rally 10.42.66.209 << EOF
        rally task start /home/rally/source/samples/tasks/scenarios/keystone/authenticate-user-and-validate-token.json
        REPORT_NAME=report_$(date -d "today" +"%Y%m%d%H%M").html
        rally task report --out=$REPORT_NAME
        ~/.local/bin/aws s3 cp $REPORT_NAME s3://openstack-rally-report/reports/
        EOF'''
      }
    }
  }
}