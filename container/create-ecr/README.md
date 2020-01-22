# 標準ECRリポジトリ作成テンプレート (ECR Provisioning Template)
標準的なECRリポジトリの作成用テンプレート
***
## Introduction
- ### 概要
ECRリポジトリの作成用テンプレートです。  
　
- ### リソース展開図

## Parameters　
|パラメータ名|概要|データ型|留意点|
|---|---|---|---|
|ECR Repository Name|リポジトリ名|文字列||
|SourceVpcEndpointID|接続元のVPCエンドポイント名|文字列|vpceから入力をする|
|IamRoleArn|ECSタスクを実行するIAMロールARN|文字列|
　　


 ---
## Outputs
 - RepositoryArn : ECRリポジトリARN名

---
## Limitations
- 

