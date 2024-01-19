data "aws_region" "this" {}

resource "aws_iam_user" "this" {
  name = var.username
}

resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}

resource "aws_iam_role" "this" {
  name               = var.username
  assume_role_policy = data.aws_iam_policy_document.this.json
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess",
  ]
}

data "aws_iam_policy_document" "this" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = [aws_iam_user.this.arn]
    }
  }
}
