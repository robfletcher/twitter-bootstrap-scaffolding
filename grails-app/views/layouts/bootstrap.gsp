<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="description" content="">
		<meta name="author" content="">

		<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

		<r:require modules="bootstrap"/>

		<!-- Le fav and touch icons -->
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="72x72" href="${resource(dir: 'images', file: 'apple-touch-icon-72x72.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-114x114.png')}">

		<g:layoutHead/>
		<r:layoutResources/>
		<style type="text/css">
		body {
			padding-top: 60px;
		}
		</style>
	</head>

	<body>

		<div class="topbar">
			<div class="topbar-inner">
				<div class="container-fluid">
					<a class="brand" href="#"><g:meta name="app.name"/></a>
					<ul class="nav">
						<li class="active"><a href="#">Home</a></li>
						<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
							<li><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
						</g:each>
					</ul>

					<p class="pull-right">Logged in as <a href="#">username</a></p>
				</div>
			</div>
		</div>

		<div class="container-fluid">
			<g:layoutBody/>
		</div>

		<r:layoutResources/>

	</body>
</html>