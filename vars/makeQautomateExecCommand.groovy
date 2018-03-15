def call(test_or_profile) {
    if(test_or_profile.contains(".txt")) {
        exe_command = "-e profile/" + test_or_profile
        return exe_command
    } else {
        exe_command = "-c " + test_or_profile
        return exe_command
    }
}