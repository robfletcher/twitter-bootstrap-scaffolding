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
		
		mavenRepo "http://snapshots.repository.codehaus.org"
		mavenRepo "http://repository.codehaus.org"
		mavenRepo "http://download.java.net/maven/2/"
		mavenRepo "http://repository.jboss.com/maven2/"
		mavenRepo "http://maven.springframework.org/milestone/"
		
    }

    dependencies {
		compile "org.jadira.usertype:usertype.jodatime:2.0.1"
    }

    plugins {
        compile ":hibernate:$grailsVersion"
		compile ":joda-time:1.4"
        compile ":jquery:1.8.3"
        compile ":resources:1.2"

		runtime ":twitter-bootstrap:2.3.1"
		runtime ":fields:1.3"
		runtime ":cache-headers:1.1.5"
		runtime ":cached-resources:1.0"
		runtime ":zipped-resources:1.0"

		build ":cloud-foundry:1.2.3"
        build ":tomcat:$grailsVersion"
    }
}
