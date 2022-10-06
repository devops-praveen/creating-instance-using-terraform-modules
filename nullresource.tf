resource "null_resource" "copy-ec2-keys" {
    depends_on = [module.ec2-bastion]
   connection {
     type = "ssh"
     host = "${aws_eip.ec2-eip.public_ip}"
     user = "ec2-user"
     password = ""
     
   }
   
}