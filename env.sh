#!/bin/bash

if (( $# != 2 )); then
    echo "Usage: source env.sh aws_profile_name deploy_name "
else
    export AWS_PROFILE=$1
    export AWS_ACCESS_KEY_ID=`aws configure get aws_access_key_id --profile $AWS_PROFILE`
    export AWS_SECRET_ACCESS_KEY=`aws configure get aws_secret_access_key --profile $AWS_PROFILE`
    export AWS_REGION=`aws configure get region --profile $AWS_PROFILE`
    export DEPLOY_NAME=$2

fi
