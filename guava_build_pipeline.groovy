multibranchPipelineJob('guava-build') {
    branchSources {   
        branchSource {
            source {
                github {
                    id('5ff1385e-e8a1-40d8-b55c-a84c1ec0c857')
                    repoOwner('mgtascu')
                    repository('guava')
                    repositoryUrl('https://github.com/mgtascu/guava.git')
                    apiUri('https://api.github.com')
                    credentialsId('09cd3cb8-6b3f-4b5c-bb4f-75bfce1359a9')
                    configuredByUrl(false)
                    traits {
                        authorInChangelogTrait()
                        gitHubIgnoreDraftPullRequestFilter()
                        gitHubPullRequestDiscovery {
                            strategyId(2)
                        }
                        headWildcardFilterWithPR {
                            includes('release/*')
                            excludes('')
                            tagIncludes('')
                            tagExcludes('*')
                        }
                    }
                }
            }
            
        }
    }
    factory {
        workflowBranchProjectFactory {
            scriptPath('Jenkinsfile')
        }
    }
    orphanedItemStrategy {
        discardOldItems {
            numToKeep(5)
        }
    }
}
