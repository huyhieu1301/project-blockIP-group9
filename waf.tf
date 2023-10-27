resource "aws_wafv2_web_acl" "allow_ip_acl" {
  name        = "allow_ip_acl"
  description = "Allow specific IPs and block all others"
  scope       = "REGIONAL"

  default_action {
    block {}
  }

  rule {
    name     = "allow_specific_ips"
    priority = 0

    action {
      allow {}
    }

    statement {
      ip_set_reference_statement {
        arn = aws_wafv2_ip_set.allow_ip_set.arn
      }
    }
    
    visibility_config {
      cloudwatch_metrics_enabled = false
      metric_name                = "allowSpecificIPs"
      sampled_requests_enabled   = false
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = false
    metric_name                = "overall"
    sampled_requests_enabled   = false
  }
}

resource "aws_wafv2_web_acl_association" "associate_alb" {
  web_acl_arn = aws_wafv2_web_acl.allow_ip_acl.arn
  resource_arn = aws_lb.app_lb.arn
}
