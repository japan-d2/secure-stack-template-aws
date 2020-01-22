# 標準Route53リゾルバー インバウンドエンドポイント 作成テンプレート (Route 53 Inbound Endpoint Template）
標準的Route53リゾルバー インバウンドエンドポイントの作成テンプレート
***
## Introduction
- ### 概要
Route53リゾルバー インバウンドエンドポイント作成用テンプレートです。  
Route53リゾルバーを使うことで、オンプレミスなどのプライベート空間からVPC内の名前解決が可能となります。

- ### リソース展開図


## Parameters　
|パラメータ名|概要|データ型|留意点|
|---|---|---|---|
|NumberOfSubnets|利用するサブネット数|数値|デフォルト: 3|
|ResolverEndpointName|リゾルバーのエンドポイント名|文字列|
|Subnet1Id|利用するサブネット1|AWS::EC2::Subnet::Id||
|Subnet2Id|利用するサブネット2|AWS::EC2::Subnet::Id|*1|
|Subnet3Id|利用するサブネット3|AWS::EC2::Subnet::Id|*1|
|IpForSubnet1|利用するサブネット1のIPアドレス|文字列|0.0.0.0の形式で入力|
|IpForSubnet2|利用するサブネット2のIPアドレス|文字列|0.0.0.0の形式で入力|
|IpForSubnet3|利用するサブネット3のIPアドレス|文字列|0.0.0.0の形式で入力|
|SecurityGroupIds|利用するセキュリティグループのID|AWS::EC2::SecurityGroup::Id|リストより選択|

*1 利用するサブネット数を2-3にした場合、自動にサブネットIDを指定します。   



## Outputs

## Limitations


