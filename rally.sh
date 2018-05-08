rally task start /home/rally/source/samples/tasks/scenarios/keystone/authenticate-user-and-validate-token.json
REPORT_NAME=report_$(date -d "today" +"%Y%m%d%H%M").html
rally task report --out=$REPORT_NAME
/home/rally/.local/bin/aws s3 cp $REPORT_NAME s3://openstack-rally-report/reports/ --acl public-read