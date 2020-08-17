node {
  properties(
    [
      parameters(
          [string(defaultValue: 'stage', name: 'DEPLOY_ENV'),
            string(defaultValue: 'prod', name: 'DEPLOY_ENV')]
          )
    ]
    )
  stage('test1'){
    if ("${params.DEPLOY_ENV}" == "prod"){
      echo "This is prod environment"
    }
    else if ("${params.DEPLOY_ENV}" == "stage"){
      echo "This is stage environment"
    }
  } 
}
