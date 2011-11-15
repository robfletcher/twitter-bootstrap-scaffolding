<%=packageName%>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<h1><g:message code="default.create.label" args="[entityName]" /></h1>
		<div class="row">
			<div class="span16">

				<g:if test="\${flash.message}">
				<bootstrap:alert class="block-message info">\${flash.message}</bootstrap:alert>
				</g:if>

				<g:hasErrors bean="\${${propertyName}}">
				<bootstrap:alert class="block-message error">
				<ul>
					<g:eachError bean="\${${propertyName}}" var="error">
					<li <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>><g:message error="\${error}"/></li>
					</g:eachError>
				</ul>
				</bootstrap:alert>
				</g:hasErrors>

				<g:form action="save" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
					<fieldset>
						<g:render template="form"/>
						<div class="actions">
							<g:submitButton name="create" class="btn primary" value="\${message(code: 'default.button.create.label', default: 'Create')}" />
						</div>
					</fieldset>
				</g:form>

			</div>
		</div>
	</body>
</html>
