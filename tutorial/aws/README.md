# Setup

[AWS で学ぶ Terraform 実践 ①〜AWS リソースを作成する（初級編）](https://qiita.com/shin7446/items/9ce36f1eb0846d95fa73)で学んだ際に作成したモジュール群

```
$ tvenv use 1.4.4

# 指定Provider向けのプラグインを取得して.terraformに格納
$ terraform init
```

# Tips

- デプロイするリソース（[AWS](https://registry.terraform.io/providers/hashicorp/aws/latest/docs), Azure, GCP, K8s など）を Provider コンポーネントで定義する
- `version.tf`で Terraform 自体と Provider のバージョンを指定しておくのがベター
- Resource コンポーネントでソースをデプロイする
- SSH キーは GUI と異なりインポートにしか対応していないので`ssh-keygen`などで事前作成が必要
- [Local Values](https://developer.hashicorp.com/terraform/language/values/locals)で効率的にリソース定義ができる
  - `locals`に定義して`local.xxx`で参照する
  - `${local.xxx}-hoge`の形式でリテラルが利用できる
- `Count`を利用して配列の値が参照できる

## SSH

```
# Generate SSH-key
$ ssh-keygen -t rsa -b 4096

# Edit public_key in key.tf
# Upload SSH-key and create instance
$ terraform init
$ terraform plan
$ terraform apply

# List EC2 instances and public IPs
$ aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId, PublicIpAddress]' --output table

# Login to EC2 instance
$ ssh -i ../id_rsa ec2-user@<INSTANCE-PUBLIC-IP>
```
