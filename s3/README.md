# 標準S3バケットテンプレート (Standard S3 Bucket Template)
標準的なS3バケットの作成用テンプレート
***
## Introduction
- ### 概要
セキュアなS3バケットの作成用テンプレートです。  
Secure by Defalutを基本として、パブリックアクセスの禁止や、デフォルト暗号化KMSキーなどが機能として組み込まれています。
　
- ### リソース展開図
　後ほど作成
***
## Parameters　
|パラメータ名|概要|データ型|留意点|
|---|---|---|---|
|Environment|環境識別子|文字列(プルダウン)|デフォルト値: eval|
|BucketName|S3バケット名|文字列|S3バケット名の命名要件に準ずる|
|UseStandardBucketPolicy|デフォルトのバケットポリシー利用要否|文字列|デフォルト値: TRUE　*1
|EnableVersioning|S3バージョニング機能有効要否|文字列|デフォルト値: TRUE
|AuthorizedVpcEndpointId|特定のVPCエンドポイントからのアクセスに制限|文字列|必要時に既存のVPCエンドポイントIDを入力　*2
|NoncurrentVersionExpirationInDays|古いバージョンのオブジェクト保持期間(Days)|数値|前提:S3バージョニング機能を有効にしていること
|KmsKeyArn|特定の暗号化用KMSキー指定|文字列|未入力時は新規KMSキーが作成される
|LoggingDestinationBucketName|アクセスログ保存バケットの指定|文字列|必要時に既存のS3バケット名を入力

*1 デフォルトのバケットポリシーをアタッチしない場合は、他のテンプレートにてバケットポリシーをアタッチする。  
 　また、デフォルトのバケットポリシーでは、アカウント内、かつ暗号化されたオブジェクトのみ保存可能。  
 *2 VPCエンドポイントを指定した場合、VPCエンドポイント経由のObject Read/Writeのみ許可  
 
 ---
## Outputs
 - BucketName : 作成されたバケット名

---
## Limitations
- Publick Acces Blockが自動的に設定される。

