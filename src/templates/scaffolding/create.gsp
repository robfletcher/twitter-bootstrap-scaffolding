<%=packageName%>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">

			<div class="col-sm-3 col-md-3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">\${entityName}</li>
						<li>
							<g:link class="list" action="list">
								<span class="glyphicon glyphicon-list"></span>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
						<li class="active">
							<g:link class="create" action="create">
								<span class="glyphicon glyphicon-plus icon-white"></span>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>

			<div class="col-sm-9 col-md-9">

				<div class="page-header">
					<h1><g:message code="default.create.label" args="[entityName]" /></h1>
				</div>

				<g:if test="\${flash.message}">
				<bootstrap:alert class="alert-info">\${flash.message}</bootstrap:alert>
				</g:if>

				<g:hasErrors bean="\${${propertyName}}">
				<bootstrap:alert class="alert-error">
				<ul>
					<g:eachError bean="\${${propertyName}}" var="error">
					<li <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>><g:message error="\${error}"/></li>
					</g:eachError>
				</ul>
				</bootstrap:alert>
				</g:hasErrors>

				<fieldset>
					<g:form class="form-horizontal" action="create" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
						<fieldset>
							<f:all bean="${propertyName}"/>

							<div class="form-actions">
								<button type="submit" class="btn btn-default btn-primary">
									<span class="glyphicon glyphicon-ok icon-white"></span>
									<g:message code="default.button.create.label" default="Create" />
								</button>
							</div>
						</fieldset>
					</g:form>
				</fieldset>

			</div>

		</div>
	</body>
</html>
