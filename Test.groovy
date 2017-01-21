
def readEnvVarFromScript(file, key) {
    return "HI THERE"
}

/*
def readEnvVarFromScript(file, key) {
    def result = "unknown"
    new File(file).eachLine { line ->
        println line
        def matcher = (line =~ "export ${key}=(.*)")
        if (matcher.matches()) {
            result = matcher[0][1].trim()
        }
    }
    return result
}
*/

// println readEnvVarFromScript("test.sh", "FOO")
