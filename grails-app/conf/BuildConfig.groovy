grails.servlet.version = "2.5"
grails.project.work.dir = "target"
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.source.level = 1.6
grails.project.target.level = 1.6

grails.project.dependency.resolution = {
	
    inherits "global"
    log "error"
    checksums true

    repositories {
        inherits true
        grailsPlugins()
        grailsHome()
        grailsCentral()
        mavenLocal()
        mavenCentral()
    }

    dependencies {
		compile "org.jadira.usertype:usertype.jodatime:1.9"
    }

    plugins {
        compile ":hibernate:$grailsVersion"
		compile ":joda-time:1.3.1"
        compile ":jquery:1.7.1"
        compile ":resources:1.1.6"

		runtime ":twitter-bootstrap:2.0.2.25"
		runtime ":fields:1.1"
		runtime ":cache-headers:1.1.5"
		runtime ":cached-resources:1.0"
		runtime ":zipped-resources:1.0"

		build ":cloud-foundry:1.2.1"
        build ":tomcat:$grailsVersion"
    }
}
