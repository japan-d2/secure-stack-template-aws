# 標準Fargateサービス作成テンプレート
 - ## 1.標準Fargateビルドパイプライン作成テンプレート
 - ## 2.標準Fargateデプロイパイプライン作成テンプレート
 
---
---
---
## 1.標準Fargateビルドパイプライン作成テンプレート (Docker image build pipeline)
標準的なFargateビルドパイプライン作成用テンプレート

## Introduction
- ### 概要
コンテナイメージビルド環境提供用テンプレートです。  
(DockerコンテナイメージのCodeBuildを用いたビルドパイプラインの提供)  
  
CodeCommitに保存されたDockerfileに従ってコンテナイメージをビルドし、
指定したECRリポジトリに保管します。  

　
- ### リソース展開図

## Parameters　
|パラメータ名|概要|データ型|留意点|
|---|---|---|---|
|-CodePipeline 設定-|
|CodePipelineName|CodePipeline名|文字列|デフォルト値: codepipeline-to-build-docker-image|
|-CodeCommit 設定-|
|CodeCommitUserName|CodeCommitにアクセスするIAMユーザ名|文字列|GitlabなどからCodeCommitへのコードのミラーリングに利用|
|CodeCommitRepositoryNameForDockerfile|CodeCommitリポジトリ名|文字列|ビルドしたいコンテナイメージのDockerfileおよび各種リソースを格納したCodeCommitリポジトリの名前を指定|
|DockerfilePath|Dockerfileのパス|文字列|CodeCommitリポジトリ内のルートディレクトリからの相対パスで入力|
|DockerImageBuildContext|Dockerイメージビルドコンテキスト|文字列||
|-CodeBuild 設定-|
|CodeBuildProjectNameForDockerImageBuild|CodeBuildプロジェクト名|文字列|DockerイメージをビルドするためのCodeBuildプロジェクト名を入力|
|CodeBuildComputeTypeForDockerImageBuild|CodeBuildプロジェクトビルド時の割当リソース|文字列|CodeBuildプロジェクトでビルド時の割当リソースを選択<br>BUILD_GENERAL1_SMALL/MEDIUM/LARGEより選択|
|-CodeBuild構築,Dockerイメージ設定-|
|DockerImageRepositoryName|ECRリポジトリ名|文字列||
|DockerImageTag|タグ名|文字列|ビルドしたコンテナイメージをプッシュする際のタグ名|

## Outputs
  CodeCommitUserArn:  
  CodeBuildProjectServiceRoleForDockerImageBuildRoleName:  
  CodeBuildProjectServiceRoleForDockerImageBuildRoleArn:  
  CodeBuildProjectServiceRoleForDockerImageBuildRoleId:  
  CodePipelineServiceRoleName:  
  CodePipelineServiceRoleArn:  
  CodePipelineServiceRoleId:  
  CloudWatchEventRoleName:  
  CloudWatchEventRoleArn:  
  CloudWatchEventRoleId:  

## Limitations
#### デプロイ手順サンプル

GUIまたは、CLIからデプロイが可能です。
以下はCLIからのデプロイの場合です。
実際のデプロイの際にはパラメータファイル値の指定または、
オプションによるパラメーター値の指定が必要です。
(指定しない場合はデフォルトの値が利用されます。コード参照)

```console
$ aws cloudformation deploy \
    --stack-name docker-image-build-sample \
    --template-file `pwd`/template/build-docker-images.yaml \
    --capabilities CAPABILITY_NAMED_IAM  
```  
<br><br>

---
---

## 2.標準Fargateデプロイパイプライン作成テンプレート (CodePipeline For ECS Fargate to deploy)
標準的なFargateデプロイパイプライン作成用テンプレート

## Introduction
- ### 概要
ビルド済みコンテナイメージのFargateへのデプロイパイプラインテンプレートです。  
ECRのリポジトリにアップロードされたDockerコンテナイメージのFargateへの自動デプロイの仕組みの提供します。

　
- ### リソース展開図

## Parameters　
|パラメータ名|概要|データ型|留意点|
|---|---|---|---|
|-CodePipeline 設定-|
|CodePipelineName|CodePipeline名|文字列|デフォルト値: codepipeline-to-deploy-docker-image|
|-Docker image & repository  設定-|
|DockerImageRepositoryName|ECRリポジトリ名|文字列|ビルド済みのDockerコンテナイメージが格納されているECRリポジトリ名を指定|
|DockerImageTag|タグ名|文字列|デプロイ対象となるコンテナイメージタグ|
|-Deployment  設定-|
|DockerContainerName|コンテナ名|文字列|デプロイするコンテナの名前|
|FargateClusterName|Fargateクラスタ名|文字列||
|FargateServiceName|Fargateサービス名|文字列||


## Outputs
  CodePipelineServiceRoleName:
  CodePipelineServiceRoleArn:
  CodePipelineServiceRoleId:
  CodeBuildServiceRoleName:
  CodeBuildServiceRoleArn:
  CodeBuildServiceRoleRoleId:
  CloudWatchEventToInvokePipelineRoleName:
  CloudWatchEventToInvokePipelineRoleArn:
  CloudWatchEventToInvokePipelineRoleId:

## Limitations
#### デプロイ手順サンプル

GUIまたは、CLIからデプロイが可能です。
以下はCLIからのデプロイの場合です。
実際のデプロイの際にはパラメータファイル値の指定または、
オプションによるパラメーター値の指定が必要です。
(指定しない場合はデフォルトの値が利用されます。コード参照)

```console
$ aws cloudformation deploy \
    --stack-name docker-image-deploy-sample \
    --template-file `pwd`/template/deploy-docker-images.yaml \
    --capabilities CAPABILITY_NAMED_IAM
```
