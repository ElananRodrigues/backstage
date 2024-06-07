# --- ECS ASG ---
resource "aws_autoscaling_group" "ecs" {
  name_prefix               = "${var.name_prefix}-asg-"
  vpc_zone_identifier       = var.subnet_ids
  min_size                  = 1
  max_size                  = 1
  health_check_grace_period = 300
  desired_capacity          = var.desired_count

  health_check_type     = "EC2"
  protect_from_scale_in = false
  capacity_rebalance    = true

  launch_template {
    id      = aws_launch_template.ecs_ec2.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.name_prefix}-cluster"
    propagate_at_launch = true
  }

  tag {
    key                 = "AmazonECSManaged"
    value               = true
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
