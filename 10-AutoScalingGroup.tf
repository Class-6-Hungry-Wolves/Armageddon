# # Hong Kong Auto Scaling Group
# resource "aws_autoscaling_group" "Hong-Kong-ASG" {
#   name_prefix           = "Hong-Kong-ASG"
#   min_size              = 3
#   max_size              = 15
#   desired_capacity      = 6
#   vpc_zone_identifier   = [
#     aws_subnet.private-ap-east-1a,
#     aws_subnet.private-ap-east-1b
#   ]
#   health_check_type          = "ELB"
#   health_check_grace_period  = 300
#   force_delete               = true
#   target_group_arns          = [aws_lb_target_group.Hong-Kong-TG-80.arn]

#   launch_template {
#     id      = aws_launch_template.Hong-Kong-LT.id
#     version = "$Latest"
#   }

#   enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

#   # Instance protection for launching
#   initial_lifecycle_hook {
#     name                  = "instance-protection-launch"
#     lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
#     default_result        = "CONTINUE"
#     heartbeat_timeout     = 60
#     notification_metadata = "{\"key\":\"value\"}"
#   }

#   # Instance protection for terminating
#   initial_lifecycle_hook {
#     name                  = "scale-in-protection"
#     lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
#     default_result        = "CONTINUE"
#     heartbeat_timeout     = 300
#   }

#   tag {
#     key                 = "Name"
#     value               = "Hong-Kong-instance"
#     propagate_at_launch = true
#   }

#   tag {
#     key                 = "Environment"
#     value               = "Production"
#     propagate_at_launch = true
#   }
# }


# # Auto Scaling Policy
# resource "aws_autoscaling_policy" "Hong-Kong-Scaling-Policy" {
#   name                   = "Hong-Kong-cpu-target"
#   autoscaling_group_name = aws_autoscaling_group.Hong-Kong-ASG.name

#   policy_type = "TargetTrackingScaling"
#   estimated_instance_warmup = 120

#   target_tracking_configuration {
#     predefined_metric_specification {
#       predefined_metric_type = "ASGAverageCPUUtilization"
#     }
#     target_value = 75.0
#   }
# }

# # Enabling instance scale-in protection
# resource "aws_autoscaling_attachment" "Hong-Kong-ASG-Attachment" {
#   autoscaling_group_name = aws_autoscaling_group.Hong-Kong-ASG.name
#   alb_target_group_arn = aws_lb_target_group.Hong-Kong-TG-80.arn
# }

# # Sao Paulo Auto Scaling Group
# resource "aws_autoscaling_group" "Sao-Paulo-ASG" {
#   name_prefix           = "Sao-Paulo-ASG"
#   min_size              = 3
#   max_size              = 15
#   desired_capacity      = 6
#   vpc_zone_identifier   = [
#     aws_subnet.private-sa-east-1a,
#     aws_subnet.private-sa-east-1b
#   ]
#   health_check_type          = "ELB"
#   health_check_grace_period  = 300
#   force_delete               = true
#   target_group_arns          = [aws_lb_target_group.Sao-Paulo-TG-80.arn]

#   launch_template {
#     id      = aws_launch_template.Sao-Paulo-LT.id
#     version = "$Latest"
#   }

#   enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

#   # Instance protection for launching
#   initial_lifecycle_hook {
#     name                  = "instance-protection-launch"
#     lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
#     default_result        = "CONTINUE"
#     heartbeat_timeout     = 60
#     notification_metadata = "{\"key\":\"value\"}"
#   }

#   # Instance protection for terminating
#   initial_lifecycle_hook {
#     name                  = "scale-in-protection"
#     lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
#     default_result        = "CONTINUE"
#     heartbeat_timeout     = 300
#   }

#   tag {
#     key                 = "Name"
#     value               = "Sao-Paulo-instance"
#     propagate_at_launch = true
#   }

#   tag {
#     key                 = "Environment"
#     value               = "Production"
#     propagate_at_launch = true
#   }
# }


# # Auto Scaling Policy
# resource "aws_autoscaling_policy" "Sao-Paulo-Scaling-Policy" {
#   name                   = "Sao-Paulo-cpu-target"
#   autoscaling_group_name = aws_autoscaling_group.Sao-Paulo-ASG.name

#   policy_type = "TargetTrackingScaling"
#   estimated_instance_warmup = 120

#   target_tracking_configuration {
#     predefined_metric_specification {
#       predefined_metric_type = "ASGAverageCPUUtilization"
#     }
#     target_value = 75.0
#   }
# }

# # Enabling instance scale-in protection
# resource "aws_autoscaling_attachment" "Sao-Paulo-ASG-Attachment" {
#   autoscaling_group_name = aws_autoscaling_group.Sao-Paulo-ASG.name
#   alb_target_group_arn = aws_lb_target_group.Sao-Paulo-TG-80.arn
# }

# # New York Auto Scaling Group
# resource "aws_autoscaling_group" "New-York-ASG" {
#   name_prefix           = "New-York-ASG"
#   min_size              = 3
#   max_size              = 15
#   desired_capacity      = 6
#   vpc_zone_identifier   = [
#     aws_subnet.private-us-east-1a,
#     aws_subnet.private-us-east-1b
#   ]
#   health_check_type          = "ELB"
#   health_check_grace_period  = 300
#   force_delete               = true
#   target_group_arns          = [aws_lb_target_group.New-York-TG-80.arn]

#   launch_template {
#     id      = aws_launch_template.New-York-LT.id
#     version = "$Latest"
#   }

#   enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

#   # Instance protection for launching
#   initial_lifecycle_hook {
#     name                  = "instance-protection-launch"
#     lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
#     default_result        = "CONTINUE"
#     heartbeat_timeout     = 60
#     notification_metadata = "{\"key\":\"value\"}"
#   }

#   # Instance protection for terminating
#   initial_lifecycle_hook {
#     name                  = "scale-in-protection"
#     lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
#     default_result        = "CONTINUE"
#     heartbeat_timeout     = 300
#   }

#   tag {
#     key                 = "Name"
#     value               = "New-York-instance"
#     propagate_at_launch = true
#   }

#   tag {
#     key                 = "Environment"
#     value               = "Production"
#     propagate_at_launch = true
#   }
# }


# # Auto Scaling Policy
# resource "aws_autoscaling_policy" "New-York-Scaling-Policy" {
#   name                   = "New-York-cpu-target"
#   autoscaling_group_name = aws_autoscaling_group.New-York-ASG.name

#   policy_type = "TargetTrackingScaling"
#   estimated_instance_warmup = 120

#   target_tracking_configuration {
#     predefined_metric_specification {
#       predefined_metric_type = "ASGAverageCPUUtilization"
#     }
#     target_value = 75.0
#   }
# }

# # Enabling instance scale-in protection
# resource "aws_autoscaling_attachment" "New-York-ASG-Attachment" {
#   autoscaling_group_name = aws_autoscaling_group.New-York-ASG.name
#   alb_target_group_arn = aws_lb_target_group.New-York-TG-80.arn
# }

# # California Auto Scaling Group
# resource "aws_autoscaling_group" "California-ASG" {
#   name_prefix           = "California-ASG"
#   min_size              = 3
#   max_size              = 15
#   desired_capacity      = 6
#   vpc_zone_identifier   = [
#     aws_subnet.private-us-west-1a,
#     aws_subnet.private-us-west-1b
#   ]
#   health_check_type          = "ELB"
#   health_check_grace_period  = 300
#   force_delete               = true
#   target_group_arns          = [aws_lb_target_group.California-TG-80.arn]

#   launch_template {
#     id      = aws_launch_template.California-LT.id
#     version = "$Latest"
#   }

#   enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

#   # Instance protection for launching
#   initial_lifecycle_hook {
#     name                  = "instance-protection-launch"
#     lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
#     default_result        = "CONTINUE"
#     heartbeat_timeout     = 60
#     notification_metadata = "{\"key\":\"value\"}"
#   }

#   # Instance protection for terminating
#   initial_lifecycle_hook {
#     name                  = "scale-in-protection"
#     lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
#     default_result        = "CONTINUE"
#     heartbeat_timeout     = 300
#   }

#   tag {
#     key                 = "Name"
#     value               = "California-instance"
#     propagate_at_launch = true
#   }

#   tag {
#     key                 = "Environment"
#     value               = "Production"
#     propagate_at_launch = true
#   }
# }


# # Auto Scaling Policy
# resource "aws_autoscaling_policy" "California-Scaling-Policy" {
#   name                   = "California-cpu-target"
#   autoscaling_group_name = aws_autoscaling_group.California-ASG.name

#   policy_type = "TargetTrackingScaling"
#   estimated_instance_warmup = 120

#   target_tracking_configuration {
#     predefined_metric_specification {
#       predefined_metric_type = "ASGAverageCPUUtilization"
#     }
#     target_value = 75.0
#   }
# }

# # Enabling instance scale-in protection
# resource "aws_autoscaling_attachment" "California-ASG-Attachment" {
#   autoscaling_group_name = aws_autoscaling_group.California-ASG.name
#   alb_target_group_arn = aws_lb_target_group.California-TG-80.arn
# }

# # London Auto Scaling Group
# resource "aws_autoscaling_group" "London-ASG" {
#   name_prefix           = "London-ASG"
#   min_size              = 3
#   max_size              = 15
#   desired_capacity      = 6
#   vpc_zone_identifier   = [
#     aws_subnet.private-eu-west-2a,
#     aws_subnet.private-eu-west-2b
#   ]
#   health_check_type          = "ELB"
#   health_check_grace_period  = 300
#   force_delete               = true
#   target_group_arns          = [aws_lb_target_group.London-TG-80.arn]

#   launch_template {
#     id      = aws_launch_template.London-LT.id
#     version = "$Latest"
#   }

#   enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

#   # Instance protection for launching
#   initial_lifecycle_hook {
#     name                  = "instance-protection-launch"
#     lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
#     default_result        = "CONTINUE"
#     heartbeat_timeout     = 60
#     notification_metadata = "{\"key\":\"value\"}"
#   }

#   # Instance protection for terminating
#   initial_lifecycle_hook {
#     name                  = "scale-in-protection"
#     lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
#     default_result        = "CONTINUE"
#     heartbeat_timeout     = 300
#   }

#   tag {
#     key                 = "Name"
#     value               = "London-instance"
#     propagate_at_launch = true
#   }

#   tag {
#     key                 = "Environment"
#     value               = "Production"
#     propagate_at_launch = true
#   }
# }


# # Auto Scaling Policy
# resource "aws_autoscaling_policy" "London-Scaling-Policy" {
#   name                   = "London-cpu-target"
#   autoscaling_group_name = aws_autoscaling_group.London-ASG.name

#   policy_type = "TargetTrackingScaling"
#   estimated_instance_warmup = 120

#   target_tracking_configuration {
#     predefined_metric_specification {
#       predefined_metric_type = "ASGAverageCPUUtilization"
#     }
#     target_value = 75.0
#   }
# }

# # Enabling instance scale-in protection
# resource "aws_autoscaling_attachment" "London-ASG-Attachment" {
#   autoscaling_group_name = aws_autoscaling_group.London-ASG.name
#   alb_target_group_arn = aws_lb_target_group.London-TG-80.arn
# }

# # Australia Auto Scaling Group
# resource "aws_autoscaling_group" "Australia-ASG" {
#   name_prefix           = "Australia-ASG"
#   min_size              = 3
#   max_size              = 15
#   desired_capacity      = 6
#   vpc_zone_identifier   = [
#     aws_subnet.private-ap-southeast-2a,
#     aws_subnet.private-ap-southeast-2b
#   ]
#   health_check_type          = "ELB"
#   health_check_grace_period  = 300
#   force_delete               = true
#   target_group_arns          = [aws_lb_target_group.Australia-TG-80.arn]

#   launch_template {
#     id      = aws_launch_template.Australia-LT.id
#     version = "$Latest"
#   }

#   enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

#   # Instance protection for launching
#   initial_lifecycle_hook {
#     name                  = "instance-protection-launch"
#     lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
#     default_result        = "CONTINUE"
#     heartbeat_timeout     = 60
#     notification_metadata = "{\"key\":\"value\"}"
#   }

#   # Instance protection for terminating
#   initial_lifecycle_hook {
#     name                  = "scale-in-protection"
#     lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
#     default_result        = "CONTINUE"
#     heartbeat_timeout     = 300
#   }

#   tag {
#     key                 = "Name"
#     value               = "Australia-instance"
#     propagate_at_launch = true
#   }

#   tag {
#     key                 = "Environment"
#     value               = "Production"
#     propagate_at_launch = true
#   }
# }


# # Auto Scaling Policy
# resource "aws_autoscaling_policy" "Australia-Scaling-Policy" {
#   name                   = "Australia-cpu-target"
#   autoscaling_group_name = aws_autoscaling_group.Australia-ASG.name

#   policy_type = "TargetTrackingScaling"
#   estimated_instance_warmup = 120

#   target_tracking_configuration {
#     predefined_metric_specification {
#       predefined_metric_type = "ASGAverageCPUUtilization"
#     }
#     target_value = 75.0
#   }
# }

# # Enabling instance scale-in protection
# resource "aws_autoscaling_attachment" "Australia-ASG-Attachment" {
#   autoscaling_group_name = aws_autoscaling_group.Australia-ASG.name
#   alb_target_group_arn = aws_lb_target_group.Australia-TG-80.arn
# }

# # Tokyo Auto Scaling Group
# resource "aws_autoscaling_group" "Tokyo-ASG" {
#   name_prefix           = "Tokyo-ASG"
#   min_size              = 3
#   max_size              = 15
#   desired_capacity      = 6
#   vpc_zone_identifier   = [
#     aws_subnet.private-ap-northeast-1a,
#     aws_subnet.private-ap-northeast-1c
#   ]
#   health_check_type          = "ELB"
#   health_check_grace_period  = 300
#   force_delete               = true
#   target_group_arns          = [aws_lb_target_group.Tokyo-TG-80.arn]

#   launch_template {
#     id      = aws_launch_template.Tokyo-LT.id
#     version = "$Latest"
#   }

#   enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

#   # Instance protection for launching
#   initial_lifecycle_hook {
#     name                  = "instance-protection-launch"
#     lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
#     default_result        = "CONTINUE"
#     heartbeat_timeout     = 60
#     notification_metadata = "{\"key\":\"value\"}"
#   }

#   # Instance protection for terminating
#   initial_lifecycle_hook {
#     name                  = "scale-in-protection"
#     lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
#     default_result        = "CONTINUE"
#     heartbeat_timeout     = 300
#   }

#   tag {
#     key                 = "Name"
#     value               = "Tokyo-instance"
#     propagate_at_launch = true
#   }

#   tag {
#     key                 = "Environment"
#     value               = "Production"
#     propagate_at_launch = true
#   }
# }


# # Auto Scaling Policy
# resource "aws_autoscaling_policy" "Tokyo-Scaling-Policy" {
#   name                   = "Tokyo-cpu-target"
#   autoscaling_group_name = aws_autoscaling_group.Tokyo-ASG.name

#   policy_type = "TargetTrackingScaling"
#   estimated_instance_warmup = 120

#   target_tracking_configuration {
#     predefined_metric_specification {
#       predefined_metric_type = "ASGAverageCPUUtilization"
#     }
#     target_value = 75.0
#   }
# }

# # Enabling instance scale-in protection
# resource "aws_autoscaling_attachment" "Tokyo-ASG-Attachment" {
#   autoscaling_group_name = aws_autoscaling_group.Tokyo-ASG.name
#   alb_target_group_arn = aws_lb_target_group.Tokyo-TG-80.arn
# }