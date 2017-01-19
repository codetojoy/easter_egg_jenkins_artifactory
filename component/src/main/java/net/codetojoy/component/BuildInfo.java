
package net.codetojoy.component;

public class BuildInfo {
    private static final String artifact = "web-component";
    private static final String version = "0.9.2-SNAPSHOT";
    private static final String buildTimestamp = "2017-01-19 13:21:36";

    public String toString() {
        StringBuilder buffer = new StringBuilder();

        String utilsBuildInfo = new net.codetojoy.utils.BuildInfo().toString();
        buffer.append(utilsBuildInfo);
        buffer.append("artifact: " + artifact);
        buffer.append("version: " + version);
        buffer.append(" build timestamp: " + buildTimestamp);
        buffer.append("\n\n");

        return buffer.toString();
    }
}
