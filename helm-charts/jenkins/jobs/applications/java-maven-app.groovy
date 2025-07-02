multibranchPipelineJob('microservices/java-maven-app') {
    displayName('Java Maven Application')
    description('Java Maven app with automated deployment to Kubernetes')

    branchSources {
        git {
            id('java-maven-app-source')
            remote('https://github.com/apostoliseq/java-maven-app.git')
            credentialsId('')
        }
    }
    orphanedItemStrategy {
        discardOldItems {
            numToKeep(5)
        }
    }
    triggers {
        periodicFolderTrigger {
            interval('30m')
        }
    }
}