<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap"/>
		<title>Welcome to Grails</title>
	</head>

	<body>
		<div class="row-fluid">
			<aside id="application-status" class="span3">
				<div class="well sidebar-nav">
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
			</aside>

			<section id="main" class="span9">

				<div class="hero-unit">
					<p>Congratulations, you have successfully started your first Grails application! At the moment
					this is the default page, feel free to modify it to either redirect to a controller or display whatever
					content you may choose. Below is a list of controllers that are currently deployed in this application,
					click on each to execute its default action:</p>
					<div class="page-header">
						<h1>Welcome to Grails</h1>
					</div>

					<p><a href="http://grails.org/" class="btn primary large">Learn more &raquo;</a></p>
				</div>

				<div class="row-fluid">
					<div class="span12">
						<ul class="nav nav-list">
							<li class="nav-header">Available Controllers:</li>
							<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
								<li><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
							</g:each>
						</ul>
					</div>
				</div>
			</section>
		</div>
	</body>
</html>
