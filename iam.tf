data "aws_iam_policy" "s3_ro_managed_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

data "aws_iam_policy_document" "ec2_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect = "Allow"
    principals {
      type = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "s3_read_only_role" {
  name = "s3_readonly_test_role"  
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "s3_ec2_attachment" {
  role = aws_iam_role.s3_read_only_role.id
  policy_arn = data.aws_iam_policy.s3_ro_managed_policy.arn
}