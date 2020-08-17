node {
  stage('test1'){
    if ("${params.DEPLOY_ENV}" == "prod"){
      echo "This is prod environment"
    }
    else if ("${params.DEPLOY_ENV}" == "stage"){
      echo "This is stage environment"
    }
  } 
}
