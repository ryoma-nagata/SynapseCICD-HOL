# AzureDevOpsによるテンプレートデプロイハンズオン

## 概要

AzureDevOpsでSynapse AnalyticsのCICDを体験する簡単なハンズオンです。

## 前提条件

- Azure サブスクリプション
- リソースグループの所有者
- Visual Studio CommunityおよびSQL Server開発ツール(SSDT)
    - [インストール方法](https://docs.microsoft.com/ja-jp/sql/ssdt/download-sql-server-data-tools-ssdt?view=sql-server-ver15#ssdt-for-visual-studio-2019)

### 注意

SQL Poolの作成が発生します。
不要な課金を抑えるために使い終わったら環境を削除するか、停止してください。

[Azure portal を使用して専用 SQL プールのコンピューティングを一時停止および再開する](https://docs.microsoft.com/ja-jp/azure/synapse-analytics/sql-data-warehouse/pause-and-resume-compute-portal)

## 次の手順

[IaCパイプラインのセットアップ](docs/1_Setup_IaC_pipeline.md)