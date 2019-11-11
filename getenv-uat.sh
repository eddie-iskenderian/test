JSON=`aws sts get-session-token --serial-number arn:aws:iam::040536061213:mfa/eddie-admin --token-code $1 --profile uat`
echo JSON
echo $JSON

export AWS_ACCESS_KEY_ID=`echo $JSON | jq '.Credentials.AccessKeyId'`
echo AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID

export AWS_SECRET_ACCESS_KEY=`echo $JSON | jq '.Credentials.SecretAccessKey'`
echo AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY

export AWS_SESSION_TOKEN=`echo $JSON | jq '.Credentials.SessionToken'`
echo AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN

echo
echo export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN 
