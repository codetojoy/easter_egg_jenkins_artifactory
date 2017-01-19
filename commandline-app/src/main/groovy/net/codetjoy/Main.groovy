
package net.codetojoy

import net.codetojoy.component.*

class Main {
    static void main(String[] args) {
        def buildInfo = new BuildInfo().toString()
        println "BUILD INFO:"
        println buildInfo

        println "HTTP POST:"
        def web = new WebComponent()
        def url = WebComponent.TEST_URL
        def jsonBody = WebComponent.TEST_JSON

        def result  = web.doHTTPPost(url, jsonBody)

        println result

        println "Ready."
    }
}


