#create Key pair
resource "aws_key_pair" "deployer" {
  key_name   = "Naincypem"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
}

#Create Launch config
resource "aws_launch_configuration" "webserver-launch-config" {
  name_prefix   = "webserver-launch-config"
  image_id      =  var.ami
  instance_type = "t2.micro"
  key_name	= aws_key_pair.deployer.key_name
  security_groups = ["${aws_security_group.webserver_sg.id}"]
  
  root_block_device {
            volume_type = "gp2"
            volume_size = 10
            encrypted   = true
        }

    ebs_block_device {
            device_name = "/dev/sdf"
            volume_type = "gp2"
            volume_size = 5
            encrypted   = true
        }
       

  lifecycle {
    create_before_destroy = true
  }
  user_data = filebase64("${path.module}/init_webserver.sh")
}


# Create Auto Scaling Group
resource "aws_autoscaling_group" "Project-ASG-tf" {
  name		     = "Project-ASG-tf"
  desired_capacity   = 2
  max_size           = 2
  min_size           = 1
  force_delete       = true
  depends_on 	     = ["aws_lb.ALB-tf"]
  target_group_arns  =  ["${aws_lb_target_group.TG-tf.arn}"]
  health_check_type  = "EC2"
  launch_configuration = aws_launch_configuration.webserver-launch-config.name
  vpc_zone_identifier = ["${aws_subnet.prv_sub1.id}","${aws_subnet.prv_sub2.id}"]
  
 tag {
    key                 = "Name"
    value               = "Project-ASG-tf"
    propagate_at_launch = true
    }
} 