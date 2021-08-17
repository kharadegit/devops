provider "aws" {
	region = "ap-south-1"
        access_key = "AKIAWESF7XJLHL4VVXDC"
        secret_key = "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"

}

module "vpc_flow_logs" {
	source = "./cloudwatch"
	vpcflowlog-name = "VPCFlowLog"
	vpc-id = "vpc-xxxxx"
}

module "splunk-iam" {
	source = "./helpers/splunk"
	iam_user_name = "splunk"
}

module "config_service" {
	source = "./config"
	config-name = "aws-config-terraform"
	config-snapshot-freq = "Six_Hours"
	s3-bucket-name = "config-service"
	splunk-config-sqs-queue = "splunk-config-sqs-queue"
}

module "cloudtrail" {
	source = "./cloudtrail"
	s3-bucket-name-cloutrail = "cloudtrail-logs"
	s3-bucket-prefix-cloutrail = "ct"
	splunk-cloudtrail-sqs-queue = "splunk-cloudtrail-sqs-queue"
	trail-name = "splunk_trail"
}
