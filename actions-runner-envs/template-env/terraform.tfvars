instance_type="t3.micro"
minimum_running_time_in_minutes=10
runners_maximum_count=${RUNNER_MAX_REPLICAS}
runners_minimum_count=${RUNNER_MIN_REPLICAS}
runners_environment="${RUNNER_ENVIRONMENT}"
runners_ami_owner="${RUNNER_AMI_OWNER}"
runners_ami_filter="${RUNNER_AMI_FILTER}"
runners_group="${RUNNER_GROUP}"
