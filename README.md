# solution
Michael &amp; Sketch assignment solution repository
### Exercise 1

In this challenge, you’ll be requested to create a simple build pipeline to build the { [https://github.com/google/guava](https://github.com/google/guava) | Guava repository } (fork it). You can also choose any open-source repo that is easy to build with a minimal set of tools.

You’ll have to prepare a Jenkins master with one Jenkins job. 

This job must be set to build the proposed repo when PRs are created with a release/* branch as a base. {Main} branch must be locked to merge and this job will be required to pass in order to merge.

Once built, the artifacts generated must be archived to easily download them from the builds page.

The solution must be delivered in a .zip file containing a repository with the solution ready to be executed, it must contain a README file with all the documentation, dependencies, design comments, screenshots...

Feel free to use any tool you like or you feel is correct to solve this challenge (ex: Docker/Compose, Job DSL, JCasC, Jenkins Job Builder...)

#### Solution
