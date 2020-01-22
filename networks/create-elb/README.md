# 標準ELB作成テンプレート (Elastic Load Balancer Provisioning Template)
標準的なELB作成用テンプレート

## Introduction
- ### 概要
ELBの作成用テンプレートです。 
　
- ### リソース展開図

## Parameters　
|パラメータ名|概要|データ型|留意点|
|---|---|---|---|
|-ロードバランサ設定-|
|ElbName|ロードバランサ名|文字列|最大32文字迄。英数字またはハイフンのみ利用可能 *!|
|ElbScheme|ELBスキーム|文字列|デフォルト: internet-facing<br> ELBによるルーティングの方向を選択|
|ElbSecurityGroupId|ELBセキュリティグループ|AWS::EC2::SecurityGroup::Id|ELBのセキュリティグループプルダウンより選択|
|ElbSubnetId1|ELBサブネット|AWS::EC2::Subnet::Id|ELBの配置されるサブネットを指定|
|ElbSubnetId2|ELBサブネット|AWS::EC2::Subnet::Id|ELBの配置されるサブネットを指定|
|ElbType|ELBタイプ|文字列|デフォルト:application<BR>ELBのタイプをプルダウンより選択|
|-ターゲットグループ設定-|
|VpcId|VPC識別子|AWS::EC2::VPC::Id|設定するVPCをプルダウンより選択|
|TargetGroupName|ターゲットグループ名|文字列|最大32文字迄。英数字またはハイフンのみ利用可能 *2
|TargetPort|ターゲットポート|数値|デフォルト: 443<BR>ターゲットがトラフィックを受信するポート *3|
|TargetProtocol|ターゲットプロトコル|文字列|デフォルト:HTTPS<BR>トラフィックをターゲットにルーティングする際使用するプロトコル|
|TargetType|ターゲットタイプ|文字列|デフォルト: instance<BR>ターゲットの種類をプルダウンから選択|

*1 ハイフンで開始または終了、｢internal-｣の開始は不可。リージョンごとに一意である必要がある。  
*2 ハイフンで開始または終了は不可。リージョンごとに一意である必要がある。  
*3 1-65535内のポート  

## Outputs
- LoadBalancerArn
- TargetGroupArn

## Limitations
- 
