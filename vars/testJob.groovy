def call(jobname, jobparams, quiet_period, currentBuild) {
    stage("execute ${jobname}") {
        try {
            build job: jobname, quietPeriod: quiet_period, parameters: jobparams
        } catch (e) {
            echo "FAILED: ${jobname}"
            currentBuild.result = "FAILURE"
        }
    }
}