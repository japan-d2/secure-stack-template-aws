# 標準EC2インスタンス作成バケットテンプレート (Standard EC2 Create Template)
標準的なEC2インスタンスの作成用テンプレート
***
## Introduction
- ### 概要
セキュアなEC2インスタンス作成用テンプレートです。  

　
- ### リソース展開図
TBD　

## Parameters　
|パラメータ名|概要|データ型|留意点|
|---|---|---|---|
| - 一般設定 -  |
|ImageId|対象AMIのID|文字列|
|InstanceType|EC2インスタンスタイプ|文字列|デフォルト値: t2.micro| 
|KeyName|利用するキーペア|AWS::EC2::KeyPair::KeyName|既存で作成されているキーペアからプルダウンで選択
|InstanceName|EC2インスタンス名|文字列|
|ProjectId|プロジェクトID|文字列|メールアドレスの入力を想定　*1
| - ネットワーク設定 - |
|IsAssociatePublicIpAddress|パブリックIPアドレス(IPv4)要否|True/False|デフォルト値: False *2
|SecurityGroupIds|セキュリティグループ|AWS::EC2::SecurityGroup::Id|既存で作成されているセキュリティグループからプルダウンで選択|
|SubnetId:|サブネット|AWS::EC2::Subnet::Id|既存で作成されているサブネットからプルダウンで選択|
| - ストレージ設定 - |
|DeviceName|ストレージのデバイス名|文字列|デフォルト値: /dev/xvda|
|VolumeSize|ボリュームサイズ|数値|単位:GiB デフォルト: 30 範囲: 8~30|
|VolumeType|ボリュームタイプ|文字列|デフォルト値: gp2|

*1 右記のタグが作成される。タグ名:Project タグ値:ProjectIDにて入力したメールアドレス  
*2 Elastic IP Address (EIP) ではなく、Public IPアドレスのため、永続付与ではない

 ---
## Outputs
 - 

---
## Limitations
- 

