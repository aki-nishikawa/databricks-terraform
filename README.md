# terraform Poc

Databricks 環境を [terraform](https://www.terraform.io/) で IaC 化できるらしいので検証する．

## Set up

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
   tfenv install {上のコマンドでインストールしたバージョン}
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
