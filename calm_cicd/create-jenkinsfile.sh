$ cd ~/hello-kubernetes/
$ DOCKER_ID=<your-dockerhub-cred-id>
$ KUBE_ID=<your-kubernetes-kubeconfig-id>
$ DOCKER_USER=<your-dockerhub-username>
$ cat << EOF > Jenkinsfile
node("docker") {
    docker.withRegistry("", "${DOCKER_ID}") {

        git url: "${GIT_REPO_URL}"
        env.GIT_COMMIT = sh(script: "git rev-parse HEAD", returnStdout: true).trim()

        stage "Build"
        def helloK8s = docker.build "${DOCKER_USER}/hello-kubernetes"

        stage "Publish"
        helloK8s.push 'latest'
        helloK8s.push "\${env.GIT_COMMIT}"

        stage "Deploy"
        kubernetesDeploy configs: 'hello-kubernetes-dep.yaml', kubeConfig: [path: ''], kubeconfigId: "${KUBE_ID}", secretName: '', ssh: [sshCredentialsId: '*', sshServer: ''], textCredentials: [certificateAuthorityData: '', clientCertificateData: '', clientKeyData: '', serverUrl: 'https://']

    }
}
EOF
$ cat Jenkinsfile
