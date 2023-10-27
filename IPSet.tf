resource "aws_wafv2_ip_set" "allow_ip_set" {
  name               = "allow_ip_set"
  scope              = "REGIONAL"
  ip_address_version = "IPV4"
  addresses          = ["42.112.144.88/32", "173.245.211.51/32", "27.67.26.73/32"]  # Add or remove IPs here
}
