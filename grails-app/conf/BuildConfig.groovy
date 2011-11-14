grails.servlet.version = "2.5" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.source.level = 1.6
grails.project.target.level = 1.6
//grails.project.war.file = "target/${appName}-${appVersion}.war"

grails.project.dependency.resolution = {
    inherits "global"
    log "error"
    checksums true

    repositories {
        inherits true
        grailsPlugins()
        grailsHome()
        grailsCentral()
        mavenCentral()

        // uncomment these to enable remote dependency resolution from public Maven repositories
        //mavenCentral()
        //mavenLocal()
        //mavenRepo "http://snapshots.repository.codehaus.org"
        //mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
    }

    dependencies {
		compile "org.jadira.usertype:usertype.jodatime:1.9"
    }

    plugins {
        compile ":hibernate:$grailsVersion"
		compile ":joda-time:1.3"
        compile ":jquery:1.6.1.1"
        compile ":resources:1.1.1"

		runtime ":twitter-bootstrap:latest.release"

        build ":tomcat:$grailsVersion"
    }
}
