#!groovy

stage "initial checkout"

node {
    git url: "https://github.com/codetojoy/easter_egg_jenkins_artifactory.git"
}

def readEnvVarFromScript = { file, key ->
    def result = ""
    file.eachLine { line ->
        def matcher = (line =~ "${key}=(.*)")
        if (matcher.matches()) {
            result = matcher[0][1].trim()
        }
    }
    return result
}

def x = readEnvVarFromScript("./test.sh", "FOO")

stage "build"
node {
    sh "echo 'TRACER ${x}'"
    withEnv([
        "TRUNK_MAJOR_VERSION=0",
        "TRUNK_MINOR_VERSION=9",
        "TRUNK_INCREMENTAL_VERSION=4",
        "TRUNK_QUALIFIER=SNAPSHOT",
        "TRUNK_BUILD_NUMBER=${env.BUILD_NUMBER}"
        ]) {

        def gradleHome = tool "G31"
        def tasks = "clean build publishCodetojoyPublicationToRemoteArtifactoryRepository"

        sh "${gradleHome}/bin/gradle ${tasks} -p utils"
        sh "${gradleHome}/bin/gradle ${tasks} -p component"

        tasks = "clean war publishCodetojoyEasyWebPublicationToRemoteArtifactoryRepository"
        sh "${gradleHome}/bin/gradle ${tasks} -p web"
    }
}

stage "initialize"
node {
    sh "chmod 777 ${env.WORKSPACE}/resources/stage.sh"
    sh "chmod 777 ${env.WORKSPACE}/resources/deploy.sh"
}

// -------------------------- DEV (auto-deploy)
stage "auto-deploy for DEV"
node {
    env.WORKSPACE = pwd() // See https://issues.jenkins-ci.org/browse/JENKINS-33511
    def ENV = "DEV"
    def SRC_DIR = "${env.WORKSPACE}/web/build/libs" 
    def DEST_DIR = "${env.WORKSPACE}/../../userContent/share"

    sh "${env.WORKSPACE}/resources/stage.sh $ENV ${env.BUILD_NUMBER} $SRC_DIR $DEST_DIR"
    sh "${env.WORKSPACE}/resources/deploy.sh $ENV ${env.BUILD_NUMBER}"
}

// -------------------------- QA
stage "deploy to QA"
timeout(time:2, unit:'DAYS') {
    input message:'Approve deployment to QA?'
}

node {
    env.WORKSPACE = pwd()
    def ENV = "QA"
    def SRC_DIR = "${env.WORKSPACE}/web/build/libs" 
    def DEST_DIR = "${env.WORKSPACE}/../../userContent/share"

    sh "${env.WORKSPACE}/resources/stage.sh $ENV ${env.BUILD_NUMBER} $SRC_DIR $DEST_DIR"
    sh "${env.WORKSPACE}/resources/deploy.sh $ENV ${env.BUILD_NUMBER}"
}

// -------------------------- UAT 
stage "deploy to UAT"
timeout(time:2, unit:'DAYS') {
    input message:'Approve deployment to UAT?'
}

node {
    env.WORKSPACE = pwd()
    def ENV = "UAT"
    def SRC_DIR = "${env.WORKSPACE}/web/build/libs" 
    def DEST_DIR = "${env.WORKSPACE}/../../userContent/share"

    sh "${env.WORKSPACE}/resources/stage.sh $ENV ${env.BUILD_NUMBER} $SRC_DIR $DEST_DIR"
    sh "${env.WORKSPACE}/resources/deploy.sh $ENV ${env.BUILD_NUMBER}"
}



