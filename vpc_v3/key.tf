resource "aws_key_pair" "Bastion_key" {
  key_name   = replace(local.name, "rtype", "_Bastion_key")
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDbzx9rp3gzJTjJ/rne2eyq6Ps7ea0y5ikWby4jSsouIN1fcDBr4afE+VxD6jkmEgaw9jiaAq0PKAMbOx6k+S31SmIesegC5B0Bwr/fLSTSJO46/Z0waIQLEj8ZbRa1FmNdOSc9SryaZbox7M0YUertNUxbhnP3qeJ/Q2+rBM0K0Eix6ZnW+a+CsWJfZaVlLxjlx8nAi5Zy0dT1xcC5bnVJXrzbMUDxa+PBZCpX4uie2nYOQ77lvR1mDb386p4ud46GdkJFesMDJSF/G677OUPpwMAsreP1e5pxIOmadhCYVHGN8YcyKxsXzJICvdY0NOz79xxZREgOKyxO74oWNXnL ec2-user@ip-172-31-91-73.ec2.internal"
}