# 標準ECSサービス作成テンプレート
 - ## 1.標準ECSクラスタ作成テンプレート
 - ## 2.標準ECSサービス作成テンプレート
 - ## 3.標準ECSタスク作成テンプレート
---
---
---
## 1.標準ECSクラスタ作成テンプレート (ECS Cluster Provisioning Template)
標準的なECSクラスタの作成用テンプレート

## Introduction
- ### 概要
ECSクラスタの作成用テンプレートです。 
　
- ### リソース展開図

## Parameters　
|パラメータ名|概要|データ型|留意点|
|---|---|---|---|
|Environment Type|環境識別子|文字列|デフォルト値: eval <br>プルダウンより選択|
|EcsClusterName|ECSクラスタ名|文字列||

## Outputs
-
## Limitations
- 

---
## 2.標準ECSサービス作成テンプレート (ECS Service Provisioning Template)
標準的なECSサービスの作成用テンプレート

## Introduction
- ### 概要
ECSサービスの作成用テンプレートです。 
　
- ### リソース展開図

## Parameters　
|パラメータ名|概要|データ型|留意点|
|---|---|---|---|
|-サービス設定-|
|EcsClusterName|ECSクラスタ名|文字列|サービスを実行するECSクラスタのARN|
|DesiredCount|タスク数|数値|タスクの数(起動するコンテナ台数)|
|LaunchType|起動タイプ|文字列|EC2かFARGATEより選択|
|EcsServiceName|ECSサービス名|文字列|ECSのサービス名を指定|
|EcsTaskDefinition|ECSタスク定義|文字列|タスク定義のファミリーとリビジョン(Familiy:revision)もしくはARN名|
|-ロードバランサ設定-| 
|ContainerName|コンテナ名|文字列|ロードバランサに紐付けるコンテナ名|
|ContainerPort|コンテナポート|数値|ロードバランサに紐付けるコンテナのポート番号|
|TargetGroup|ターゲットグループ|文字列|ELBターゲットグループの完全なARN|
|-ネットワーク設定-|
|AssignPublicIp|パブリックIP割当要否|文字列|デフォルト: Dissable<br>パブリック通信をする場合はENABLEDにする |
|EcsSecurityGroupId|ECSセキュリティグループ|文字列|ECSタスクまたはサービスに関連付けるセキュリティグループをプルダウンより選択|
|EcsSubnetId1|ECSサブネット1|文字列|ECSタスクまたはサービスに関連付けるサブネットをプルダウンより選択|
|EcsSubnetId2|ECSサブネット2|文字列|ECSタスクまたはサービスに関連付けるサブネットをプルダウンより選択|

## Outputs
-
## Limitations
- 

---
## 3.標準ECSタスク作成テンプレート (ECS Task Definition Provisioning Template)
標準的なECSタスクの作成用テンプレート

## Introduction
- ### 概要
ECSタスクの作成用テンプレートです。 
　
- ### リソース展開図

## Parameters　
|パラメータ名|概要|データ型|留意点|
|---|---|---|---|
|-タスク設定-|
|TaskCpuUnit|CPUユニット数|文字列|デフォルト:256 <br>タスクで使用されるCPUユニット数をプルダウンより選択|
|TaskName|タスク名|文字列||
|TaskMemory|メモリ量|文字列|デフォルト:512<br>タスクで利用するメモリの量(MiB)|
|DockerNetworkingMode|Dockerネットワークモード|文字列|タスク内のコンテナで使用するDockerネットワークモードをプルダウンから選択|
|-コンテナ設定-|
|ImageName|イメージ名|文字列|コンテナ起動に使用される画像repository-uri / image:tag）|
|LogDriver|ログドライバ|文字列|コンテナで利用するログドライバをプルダウンより選択|
|LogGroupName|ロググール名|文字列|コンテナで使用するCloudWatchLogsグループ名|
|LogStreamPrefix|ログストリームプレフィックス|文字列|コンテナで使用するCloudwachLogsストリームプレフィックス
|PortMappingProtocol|ポートマッピングプロトコル|文字列|ポートマッピングに使用されるプロトコルをプルダウンより選択|
|Port|ポート番号|数値|ホストポートにバインドされているコンテナのポート番号|
|||||


## Outputs
- TaskDefinitionArn:タスク名
- 
## Limitations
- 
