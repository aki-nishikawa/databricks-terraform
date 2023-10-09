# Databricks Terraform POC

Databricks 環境を terraform で IaC 化できるらしいので検証する．
試しにクラスタの作成をしてみる．

## セットアップ

Mac OS を前提にセットアップ方法を記述する

### terraform

IaC のために使用するソフトウェア．

公式を見ながらインストールするよりも [tfenv](https://github.com/tfutils/tfenv) を使用してインストールする方が楽．

1. `tfenv` のインストール
   ```bash
   brew install tfenv
   ```
1. terraform のインストール
   ```
   tfenv install latest
   tfenv use {上のコマンドでインストールしたバージョン}
   ```

### AWS CLI

AWS をローカルマシンから操作するための CLI ツール

1. [公式サイト](https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/getting-started-install.html) を参考にインストールする
1. 認証情報を設定する
   1. コンソールから認証情報を取得する
   1. `keio-aic-databricks` という名前で profile の設定をする
      ```bash
      aws configure --profile keio-aic-databricks
      ```
   1. 先ほど取得した認証情報の入力が求められる
      ```
      AWS Access Key ID [None]: {AWSAccessKeyId}
      AWS Secret Access Key [None]: {AWSSecretKey}
      Default region name [None]: ap-northeast-1
      Default output format [None]: json
      ```
1. デフォルトの profile を設定する
   ```bash
   export AWS_PROFILE=keio-aic-databricks
   ```

### Databricks CLI

Databricks をローカルマシンから操作するための CLI ツール．

現状あまり[ドキュメント](https://docs.databricks.com/en/dev-tools/index-cli.html)が整備されていないように見受けられる．

1. [公式](https://docs.databricks.com/ja/dev-tools/cli/databricks-cli.html) を見てインストールする
1. [ドキュメント](https://docs.google.com/document/d/1wlHaxz1mEhRBz6FOAtY12qkJc_YeKAnHbCVyYE-nxas/edit#heading=h.mmqgip53656r) を参考に workspace を作成する
1. config を設定する
   ```
   databricks configure --token --profile terraform-poc
   ```
   1. `Databricks Host` には作成した workspace の URL (https://xxx.cloud.databricks.com) を指定する
   1. `Personal Access Token` には workspace の User Setting -> Developer -> Access tokens で生成したトークンを入力する
1. 動作確認
   ```
   databricks current-user me
   ```
