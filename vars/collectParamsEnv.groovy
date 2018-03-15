def call(param_name){
    if(!(params[param_name] == null)) {
       echo("Parameters exists:")
       echo(params[param_name])
       return params[param_name]
    } else if(!(env[param_name] == null)) {
        echo("Environment exists")
        echo(env[param_name])
        return env[param_name]
    } else {
        echo("Environment not exists")
        return null
    }
}