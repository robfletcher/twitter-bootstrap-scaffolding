<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap"/>
		<title>Welcome to Grails</title>
	</head>

	<body>
		<div class="sidebar">
			<div class="well">
				<h5>Application Status</h5>
				<ul>
					<li>App version: <g:meta name="app.version"/></li>
					<li>Grails version: <g:meta name="app.grails.version"/></li>
					<li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
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
		</div>

		<div class="content">
			<!-- Main hero unit for a primary marketing message or call to action -->
			<div class="hero-unit">
				<h1>Welcome to Grails</h1>

				<p>Congratulations, you have successfully started your first Grails application! At the moment
				this is the default page, feel free to modify it to either redirect to a controller or display whatever
				content you may choose. Below is a list of controllers that are currently deployed in this application,
				click on each to execute its default action:</p>

				<p><a href="http://grails.org/" class="btn primary large">Learn more &raquo;</a></p>
			</div>
			<!-- Example row of columns -->
			<div class="row">
				<div class="span16">
					<h2>Available Controllers:</h2>
					<ul>
						<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
							<li><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
						</g:each>
					</ul>
				</div>
			</div>
			<footer>
				<p>&copy; Company 2011</p>
			</footer>
		</div>
	</body>
</html>
