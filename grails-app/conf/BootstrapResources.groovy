modules = {
    bootstrap {
		dependsOn 'jquery'
        resource url: 'js/bootstrap.min.js', excludes: 'minify'
        resource url: 'css/bootstrap.min.css', excludes: 'minify'
        resource url: 'css/bootstrap.responsive.min.css', excludes: 'minify'
    }
}