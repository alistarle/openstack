import java.text.SimpleDateFormat

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
      steps {
          script {
            sshagent (credentials: ['rally']) {
              dateFormat = new SimpleDateFormat("yyyyMMddHHmm")
              date = new Date()

              REPORT_NAME="report_"+dateFormat.format(date)+".html"
              print(REPORT_NAME)
              sh "'''ssh -o StrictHostKeyChecking=no -l rally -p 5000 10.42.66.209 /bin/bash
              rally task start /home/rally/source/samples/tasks/scenarios/keystone/authenticate-user-and-validate-token.json
              rally task report --out=${REPORT_NAME}
              /home/rally/.local/bin/aws s3 cp "'${REPORT_NAME}'" s3://openstack-rally-report/reports/
              '''"
            }
        }
      }
    }
  }
}