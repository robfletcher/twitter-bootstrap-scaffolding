<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap"/>
		<title>Grails Twitter Bootstrap Scaffolding</title>
	</head>

	<body>

	<div class="row">
		<aside id="application-status" class="col-sm-3 col-md-3">
			<div class="well sidebar-nav">
				<h5>Application Status</h5>
				<ul>
					<li>App version: <g:meta name="app.version"></g:meta></li>
					<li>Grails version: <g:meta name="app.grails.version"></g:meta></li>
					<li>Groovy version: ${groovy.lang.GroovySystem.getVersion()}</li>
					<li>JVM version: ${System.getProperty('java.version')}</li>
					<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
					<li>Domains: ${grailsApplication.domainClasses.size()}</li>
					<li>Services: ${grailsApplication.serviceClasses.size()}</li>
					<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
				</ul>
				<h5>Installed Plugins</h5>
				<ul>
					<g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
						<li>${plugin.name} - ${plugin.version}</li>
					</g:each>
				</ul>
			</div>
		</aside>

		<section id="main" class="col-sm-9 col-md-9">

			<div class="jumbotron">
				<h1>Welcome to Grails</h1>

				<p>Grails scaffolding with a <a href="http://twitter.github.com/bootstrap" rel="external"><em>Twitter
				Bootstrap</em></a> look &amp; feel?</p>

				<p>This is a demo of how to reskin Grails dynamic scaffolding pages. I've
				used The <a href="http://freeside.co/grails-fields">Fields plugin</a> for customizing
				form rendering and the <a href="https://github.com/groovydev/twitter-bootstrap-grails-plugin">Twitter
				Bootstrap Resources plugin</a> to provide the CSS resources. Beyond that it's a
				bare Grails app using dynamically scaffolded controllers and views.</p>
			</div>

			<div class="row">

				<div class="col-sm-4 col-md-4">
					<h2>Try It</h2>
					<p>This demo app includes a couple of controllers to show off its features.</p>
					<ul class="nav nav-list">
						<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
							<li><g:link controller="${c.logicalPropertyName}">${c.naturalName}</g:link></li>
						</g:each>
					</ul>
				</div>

				<div class="col-sm-4 col-md-4">
					<h2>Install It</h2>
					<p>To install this look &amp; feel into your Grails app you will need to:</p>
					<p>Add the following plugins to your <em>BuildConfig.groovy</em>:</p>
					<pre>runtime ':twitter-bootstrap:${applicationContext.getBean('pluginManager').getGrailsPlugin('twitter-bootstrap').version}'
runtime ':fields:${applicationContext.getBean('pluginManager').getGrailsPlugin('fields').version}'</pre>
					<p>Copy the following files to your project:</p>
					<pre>src/templates/scaffolding/*
web-app/css/scaffolding.css
grails-app/conf/ScaffoldingResources.groovy
grails-app/taglib/**/*
grails-app/views/index.gsp
grails-app/views/layouts/bootstrap.gsp
grails-app/views/_fields/default/_field.gsp</pre>
				</div>

				<div class="col-sm-4 col-md-4">
					<h2>Fork It</h2>
					<p>You can download, fork &amp; raise issues on this project on <a href="https://github.com/robfletcher/twitter-bootstrap-scaffolding">GitHub</a>.</p>
				</div>

			</div>

		</section>
	</div>

	<!--
	    <a href="http://github.com/robfletcher/twitter-bootstrap-scaffolding"><img style="position: absolute; top: 0; left: 0; border: 0;" src="https://camo.githubusercontent.com/c6625ac1f3ee0a12250227cf83ce904423abf351/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f6c6566745f677261795f3664366436642e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_left_gray_6d6d6d.png"></a>
	-->
		<a href="https://camo.githubusercontent.com/c6625ac1f3ee0a12250227cf83ce904423abf351/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f6c6566745f677261795f3664366436642e706e67" alt="Fork me on GitHub"></a>
	</body>
</html>
