# 標準AWSバックアップポリシー作成テンプレート (AWS Backup Policy Template)

標準的な、AWS BackupによるEBSバックアップ用テンプレート
***

## Introduction

- ### 概要

EBSバックアップ作成用テンプレートです。  
サービスはAWS Backupを使用しています。

- ### リソース展開図

## Parameters

|パラメータ名|概要|データ型|留意点|
|---|---|---|---|
|Environment|環境識別子|文字列|デフォルト値: eval プルダウンで選択
|BackupHour|バックアップ開始時刻|数値|デフォルト値: 5, UTCで入力 *1
|DeleteAfterDays|バックアップの保管世代数|数値|デフォルト値: 10
|BackupTagKey|バックアップ対象のタグキー|文字列|デフォルト値: DLM
|BackupTagValue|バックアップ対象のタグ値|文字列|デフォルト値: true
|BackupPlanName|バックアッププラン名|文字列|デフォルト値: EbsDailyBackupPlan
|BackupVaultTagValue|バックアップボールトタグの指定|文字列|デフォルト値: Daily

*1 バックアップ開始後、ジョブが正常に開始されず60分経過するとキャンセル実行となる

## Outputs

 - OutputsTags : ターゲットのタグ及びタグ値
 - BuckupPlanName : バックアッププラン名
  
## Limitations

 - 本テンプレートは、IAMロールの作成を行います。
