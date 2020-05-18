# terraform-aws-basic
Terraform으로 AWS에 기본적인 구성을 하는 코드.

## 실행순서
1. Terraform init
```
$ terraform init
$ terraform version
```

2. Get Module
```
$ terraform get
```

3. ssh-key gen

```
$ ssh-keygen -y -f aws-key.pem >> aws-key.pub
```
OR

```
$ terraform import aws_key_pair.terraform-key aws-key
```

4. Plan
```
$ terraform plan
```

5. Apply
```
$ terraform apply
```

Contact Me : comnics@gmail.com
