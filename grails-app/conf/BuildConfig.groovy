grails.servlet.version = "2.5"
grails.project.work.dir = "target"
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.source.level = 1.6
grails.project.target.level = 1.6

grails.project.dependency.resolution = {
    inherits "global"
    log "warn"
    checksums true

    repositories {

        inherits true
		
        grailsPlugins()
        grailsHome()
        grailsCentral()
        mavenLocal()
        mavenCentral()

        grailsRepo "https://grails.org/plugins"
        mavenRepo "http://repo.grails.org/grails/repo"

		//mavenRepo "http://snapshots.repository.codehaus.org"
		//mavenRepo "http://repository.codehaus.org"
		mavenRepo "http://download.java.net/maven/2/"
		mavenRepo "http://repository.jboss.com/maven2/"
		mavenRepo "http://maven.springframework.org/milestone/"

        mavenRepo "http://repo.grails.org/grails/libs-releases/"
        //mavenRepo "http://m2repo.spockframework.org/ext/"
        //mavenRepo "http://m2repo.spockframework.org/snapshots/"
    }

    dependencies {
		compile "org.jadira.usertype:usertype.core:3.2.0.GA"
    }

    plugins {
        compile ":hibernate4:4.3.6.1"
		compile ":joda-time:1.5"
        compile ":jquery:1.11.1"
        compile ":asset-pipeline:1.9.9"
        compile ":scaffolding:2.1.0"

        compile ":less-asset-pipeline:2.3.0"

        runtime ":twitter-bootstrap:3.3.5"
        //runtime ":twitter-bootstrap:2.3.2.2"
		runtime ":fields:1.3"

        build ":tomcat:7.0.55"
    }
}
