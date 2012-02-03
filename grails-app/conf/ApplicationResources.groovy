modules = {
	grails {
		dependsOn 'bootstrap'
		resource url: 'css/grails.css'
	}
    application {
        resource url:'js/application.js'
    }
}