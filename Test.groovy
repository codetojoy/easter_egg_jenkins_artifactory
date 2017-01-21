
def readEnvVarFromScript = { file, key ->
    def result = "unknown"
    file.eachLine { line ->
        def matcher = (line =~ "${key}=(.*)")
        if (matcher.matches()) {
            result = matcher[0][1].trim()
        }
    }
    return result
}

