resource "aws_cloudwatch_dashboard" "mtd_cost_dashboard" {
  dashboard_name = "${var.environment}-cost-dashboard"
  dashboard_body = jsonencode({
    widgets = [
      {
        type       = "metric",
        x          = 0,
        y          = 0,
        width      = 24,
        height     = 6,
        properties = {
          metrics = [
            ["AWS/Billing", "EstimatedCharges", "Currency", "USD"]
          ],
          period = 86400,
          stat   = "Maximum",
          region = "us-east-1",
          title  = "Estimated Charges (USD)"
        }
      }
    ]
  })
}
