# 標準VPC作成テンプレート (VPC Network Template)
標準的VPCの作成テンプレート
***
## Introduction
- ### 概要
VPCの作成用テンプレートです。  
本テンプレートは複数のスタックをネストする形で作成されています。  

- Create-VPC.yaml  (基本的なVPC設定を定義)  
    - create-networkacl.yaml  (ネットワークACLを定義)
    - create-securitygroup.yaml  (セキュリティグループを定義)
    - create-subnet.yaml  (サブネットを定義)
    - create-vpcendpoint.yaml  (VPCエンドポイントを定義)

NestedStackのデプロイには [packageコマンド](https://docs.aws.amazon.com/cli/latest/reference/cloudformation/package.html) を使用します。
具体的な使用方法については [こちら](../cfn-package-networks.bat) を参考にしてください。

## Parameters　
|パラメータ名|概要|データ型|留意点|
|---|---|---|---|
|-VPC環境設定-|
|Environment Type|環境識別子|文字列|デフォルト値: eval|
|Network Name|VPCネットワーク名|文字列|文字制限 1~255文字　*1|
|-VPCネットワーク設定-|
|NetworkCidrBlock|IPv4CIDR|文字列|(0.0.0.0/0)の形式で入力|
|CreateSubnets|サブネット作成数|数値|デフォルト:2 <br> 1~5をプルダウンより選択|
|SubnetCidr1|サブネットCIDR|文字列|入力必須<br>(0.0.0.0/0)の形式で入力 *2|
|SubnetCidr1Az|サブネット1のAZ|AWS::EC2::AvailabilityZone::Name|デフォルト:ap-northeast-1a|
|SubnetCidr2 ~ 5|サブネットCIDR(2~5)|文字列|必要に応じて入力<br> (0.0.0.0/0)の形式で入力 *2 |
|SubnetCidr2 ~ 5Az|サブネット(2~5)のAZ|AWS::EC2::AvailabilityZone::Name|デフォルト:ap-northeast-1a<br>作成するサブネット数に応じて入力|
|-VPCサービス設定-|
|CreateVPCEndpoints|VPCエンドポイント作成要否|文字列|デフォルト値:True|
|CreateStandardNetworkAcl|ネットワークACL作成要否|文字列|デフォルト値:True|
|EnableIPv6Subnet|IPv6使用要否|文字列|デフォルト値:False|
|EnableVPCFlowlog|VPCフローログ使用要否|文字列|デフォルト値:True|
|VPCFlowlogRoleName|VPCフローログ用IAMロール|文字列|CloudWatch LogsにFlow Logsを追加するIAMロール|
|-VPCパブリックネットワーク設定-|
|CreateInternetGateway|インターネットゲートウェイ要否|文字列|デフォルト値: No Gateway|
|PublicNetworkCidrBlock|パブリックネットワークCIDR|文字列|必要に応じて入力 *3|
|PublicSubnetCidr1|パブリックサブネットCIDR|文字列|入力必須<br> (0.0.0.0/0)の形式で入力 *4|
|PublicSubnetCidr2~5|パブリクサブネットCIDR 2~5|文字列|必要に応じて入力<br>(0.0.0.0/0)の形式で入力 *4 |
|-企業ネットワーク-|
|CorporateNetworkCidr|企業ネットワーク|文字列|入力必須<br>企業内ネットワークのCIDR<br>(0.0.0.0/0)の形式で入力 *5|



*1 実際のVPC名は [EnvironmentType.NetworkName]の形になる  
*2 ネットワークCIDR内に収まること  
*3 VPCのセカンダリCIDRとして登録されるため、プライマリ(NetworkCidrBlock)と重複しないこと  
*4 パブリックネットワークCIDR内に収まること  
*5 セキュリティグループ作成などに利用  


## Outputs
|名前|概要|値|
|---|---|---|
|VpcId|VPCのID|vpc-*****************
|SubnetCount|サブネット作成数| n　(作成数に応じて出力)|
|SubnetIDs|サブネットのID<br>サブネットの作成数に応じて複数出力|subnet-*****************|
|NetworkCidr|プライマリVPCのCIDR|\*\*\*\.\*\*\*\.\*\*\*.\*\*\*/**|
|RouteTable|ルートテーブルのID<BR>NATゲートウェイ利用時に作成<BR>NATゲートウェイ利用のサブネット数に応じて複数出力|rtb-*****************|
|NetworkAcl|ネットワークACLのID|acl-*****************|
|PublicInternetGateway|インターネットゲートウェイID|igw-****************|
|NatGatewayIDs|NATゲートウェイのID<br>NATゲートウェイの作成数に応じて複数出力|NAT-*****************|
|PublicSubnetIDs|パブリックサブネットのID<BR>パブリックサブネットの作成数に応じて複数出力|subnet-*****************|
|PublicRouteTable|パブリックルートテーブルのID<BR>インターネットゲートウェイ作成時に出力|rtb-*****************|
|PublicNetworkAcl|パブリックネットワークACLのID|acl-*****************|
---
## Limitations


