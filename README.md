# Usage

## Run locally

1. Install node.js
1. Run `yarn && yarn lix download && yarn haxe server-local.hxml`
1. Run `node bin/server/local.js`
1. Navigate to `localhost:8080` with your browser


## Run on AWS (Lambda + API Gateway)

1. Install node.js
1. run `yarn && yarn lix download && yarn haxe server-aws.hxml`
1. Upload the generated aws.js to AWS Lambda
1. Create a AWS API Gateway with:
    - Method: ANY
    - Resourcep path; /{proxy+}
    - Integration type: lambda function, using the Lambda created in previous step
    - Use Lambda Proxy integration: checked
1. Navigate to the API Gateway's URL
