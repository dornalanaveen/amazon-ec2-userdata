#!/bin/bash -v

# Logger
exec > >(tee /var/log/user-data.log || logger -t user-data -s 2> /dev/console) 2>&1

# Parameter Settings
BootstrapScriptURL="https://raw.githubusercontent.com/usui-tk/AWS-CloudInit_BootstrapScript/master/VPC(IPv4)/2nd-Bootstrap_CentOS-v7-HVM.sh"

#-------------------------------------------------------------------------------
# Custom Package Installation
#-------------------------------------------------------------------------------

# yum repository metadata Clean up
yum clean all

# Default Package Update
yum install -y curl

#-------------------------------------------------------------------------------
# Bootstrap Script Executite
#-------------------------------------------------------------------------------

cd /tmp

curl -o Bootstrap.sh $BootstrapScriptURL --retry 5

chmod 700 Bootstrap.sh

bash -x Bootstrap.sh
