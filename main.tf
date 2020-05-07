data "aws_iam_policy_document" "PolicyDocument" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    effect  = length(var.arns) > 0 || var.arn != null ? "Allow" : "Deny"
    actions = var.actions
    resources = [
      var.queue_arn,
    ]

    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"

      values = length(var.arns) > 0 ? var.arns : var.arn != null ? [var.arn] : [""]
    }
  }
}

resource "aws_sqs_queue_policy" "Policy" {
  count     = var.create ? 1 : 0
  policy    = var.policy != null ? var.policy : data.aws_iam_policy_document.PolicyDocument.json
  queue_url = var.queue_url
}
