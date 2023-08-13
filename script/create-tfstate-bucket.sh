# terraform でリソースの状態を保存する tfstate ファイルを s3 上に保存する．
# tfstate を保存するための s3 bucket は terraform で管理されないので手動で作成する．

export AWS_PROFILE=keio-aic-databricks

# create s3 bucket
aws s3api create-bucket \
	--bucket keio-aic-databricks-terraform-poc-tfstate-bucket \
	--create-bucket-configuration LocationConstraint=ap-northeast-1
if [ $? != 0 ]; then
    echo "An error occured when creating s3 bucket"
    exit 1
fi

# enable bucket versioning
aws s3api put-bucket-versioning \
	--bucket keio-aic-databricks-terraform-poc-tfstate-bucket \
	--versioning-configuration Status=Enabled
echo "Successfully finished"