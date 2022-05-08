
def buildTag = "latest" 
def buildImage = "maven:${buildTag}"
def buildCmd = "mvn clean package -pl '!guava-gwt' -DargLine='-Xmx1024m' -DskipTests=true"


node('built-in'){
    stage("Checkout SCM") {
        checkout scm
    }
    stage("Build") {
        sh(script:"docker pull ${buildImage}", label: "Pull build image", returnStdout: false)
        sh(script:"docker run --memory '2048m' --rm -v $WORKSPACE:/usr/src/guava -w /usr/src/guava ${buildImage} ${buildCmd}", label: "Run maven", returnStdout: false)

    }
    stage("Archive Artifacts") {
        archiveArtifacts artifacts: '**/target/*.jar',
                         allowEmptyArchive: true,
                         fingerprint: true,
                         onlyIfSuccessful: true
    }
}