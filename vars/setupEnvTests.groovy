def call(env_name){

    if (env_name == "lxd" ) {
        echo "LXD environment"
        env.LXD_TEST_REPOSITORY = "https://github.com/vrk-kpa/X-Road-tests"
        env.LXD_TEST_REPOSITORY_HTTPS = "https://github.com/ria-ee/X-Road-tests.git"
        env.LXD_TEST_REPOSITORY_VRK = "https://github.com/vrk-kpa/X-Road-tests.git"
        env.LXD_TEST_BRANCH = "*/develop"
        env.ENV_TYPE = "lxd"
        env.CREDENTIAL_KEY = "fff61d1b-4c09-43ca-b385-dbf4edec5d37"
        env.CREDENTIAL_KEY_HTTPS = "httpsgit"
        env.DISPLAY_NUMBER = "0"
        env.TEST_REPOSITORY_SUBFOLDER = "tests"
        env.SENSITIVE_DATA_DIR = "sensitive/ui-integration-tests/sensitive"
        env.SENSITIVE_REPOSITORY_SUBFOLDER = "sensitive"
        env.SENSITIVE_TESTDATA_DIR = "../sensitive"
        env.SENSITIVE_BRANCH = "*/develop"
        env.TEST_PROJECT_DIR = "tests/common/xrd-ui-tests-qautomate"
        env.AGENT = "master"
    }
    else if (env_name == "prod" ) {
        echo "PROD environment"
        env.PROD_TEST_REPOSITORY = "git@github.com:vrk-kpa/X-Road-tests.git"
        env.PROD_TEST_BRANCH = "*/develop"
        env.ENV_TYPE = "prod"
        env.CREDENTIAL_KEY = "fff61d1b-4c09-43ca-b385-dbf4edec5d37"
        env.DISPLAY_NUMBER = "3"
        env.TEST_REPOSITORY_SUBFOLDER = "tests"
        env.SENSITIVE_DATA_DIR = "sensitive/ui-integration-tests/sensitive"
        env.SENSITIVE_REPOSITORY_SUBFOLDER = "sensitive"
        env.SENSITIVE_TESTDATA_DIR = "../sensitive"
        env.SENSITIVE_BRANCH = "*/master"
        env.TEST_PROJECT_DIR = "tests/common/xrd-ui-tests-qautomate"
        env.AGENT = "ui-test-node"
    }
    else if (env_name == "stage" ) {
        echo "STAGE environment"
        env.STAGE_TEST_REPOSITORY = "git@github.com:vrk-kpa/X-Road-tests.git"
        env.STAGE_TEST_BRANCH = "*/develop"
        env.ENV_TYPE = "stage"
        env.CREDENTIAL_KEY = "fff61d1b-4c09-43ca-b385-dbf4edec5d37"
        env.DISPLAY_NUMBER = "3"
        env.TEST_REPOSITORY_SUBFOLDER = "tests"
        env.SENSITIVE_DATA_DIR = "sensitive/ui-integration-tests/sensitive"
        env.SENSITIVE_REPOSITORY_SUBFOLDER = "sensitive"
        env.SENSITIVE_TESTDATA_DIR = "../sensitive"
        env.SENSITIVE_BRANCH = "*/master"
        env.TEST_PROJECT_DIR = "tests/common/xrd-ui-tests-qautomate"
        env.AGENT = "ui-test-node2"
    }
    else {
        echo "No environment"
    }
}
