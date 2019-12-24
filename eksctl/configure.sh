#!/bin/bash

OUTPUT_FILENAME=config-initial.yml
CLUSTER_NAME=my-cool-cluster
AWS_REGION=us-east-1
CLUSTER_VERSION=1.14
NODEGROUP_NAME_MASTERS=cloudbees-core-masters-1102d
NODEGROUP_NAME_REGULAR=cloudbees-core-regular-1102d
NODEGROUP_NAME_SPOT=cloudbees-core-spot-1102d
AMI_ID=ami-0cfce90d1d571102d
SSH_ALLOW=false
SSH_PUBLICKEYNAME=ignoreme
VPC_ID=vpc-0a32234acc66aeee9
CIDR=10.0.0.0/16
AZ_1_ID=us-east-1a
AZ_2_ID=us-east-1b
AZ_3_ID=us-east-1c
AZ_1_SUBNET=subnet-04760fbf85e4ee4ba
AZ_2_SUBNET=subnet-0b6b8af1dba2ab390
AZ_3_SUBNET=subnet-0247444cbfd5977dd

cp config.template $OUTPUT_FILENAME
sed -i'' -e "s/TOKEN_CLUSTER_NAME/$CLUSTER_NAME/g" $OUTPUT_FILENAME
sed -i'' -e "s/TOKEN_AWS_REGION/$AWS_REGION/g" $OUTPUT_FILENAME
sed -i'' -e "s/TOKEN_CLUSTER_VERSION/$CLUSTER_VERSION/g" $OUTPUT_FILENAME
sed -i'' -e "s/TOKEN_NODEGROUP_NAME_MASTERS/$NODEGROUP_NAME_MASTERS/g" $OUTPUT_FILENAME
sed -i'' -e "s/TOKEN_NODEGROUP_NAME_REGULAR/$NODEGROUP_NAME_REGULAR/g" $OUTPUT_FILENAME
sed -i'' -e "s/TOKEN_NODEGROUP_NAME_SPOT/$NODEGROUP_NAME_SPOT/g" $OUTPUT_FILENAME
sed -i'' -e "s/TOKEN_AMI_ID/$AMI_ID/g" $OUTPUT_FILENAME
sed -i'' -e "s/TOKEN_SSH_ALLOW/$SSH_ALLOW/g" $OUTPUT_FILENAME
sed -i'' -e "s/TOKEN_SSH_PUBLICKEYNAME/$SSH_PUBLICKEYNAME/g" $OUTPUT_FILENAME
sed -i'' -e "s/TOKEN_VPC_ID/$VPC_ID/g" $OUTPUT_FILENAME
sed -i'' -e "s~TOKEN_CIDR~$CIDR~g" $OUTPUT_FILENAME
sed -i'' -e "s/TOKEN_AZ_1_ID/$AZ_1_ID/g" $OUTPUT_FILENAME
sed -i'' -e "s/TOKEN_AZ_2_ID/$AZ_2_ID/g" $OUTPUT_FILENAME
sed -i'' -e "s/TOKEN_AZ_3_ID/$AZ_3_ID/g" $OUTPUT_FILENAME
sed -i'' -e "s/TOKEN_AZ_1_SUBNET/$AZ_1_SUBNET/g" $OUTPUT_FILENAME
sed -i'' -e "s/TOKEN_AZ_2_SUBNET/$AZ_2_SUBNET/g" $OUTPUT_FILENAME
sed -i'' -e "s/TOKEN_AZ_3_SUBNET/$AZ_3_SUBNET/g" $OUTPUT_FILENAME
sed -i'' -e "/TOKEN_BOOTSTRAP_CONTENTS/r bootstrap.sh" $OUTPUT_FILENAME
sed -i'' -e "s/TOKEN_BOOTSTRAP_CONTENTS//g" $OUTPUT_FILENAME

rm -f $OUTPUT_FILENAME-e

