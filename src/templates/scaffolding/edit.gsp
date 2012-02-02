<%=packageName%>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
		<div class="row-fluid">
			<div class="span12">

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

				<g:form class="form-horizontal" method="post" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
					<g:hiddenField name="id" value="\${${propertyName}?.id}" />
					<g:hiddenField name="version" value="\${${propertyName}?.version}" />
					<fieldset>
						<f:all bean="${propertyName}"/>
						<div class="form-actions">
							<button type="submit" class="btn btn-primary" name="_action_update"><g:message code="default.button.update.label" default="Update" /></button>
							<button type="submit" class="btn btn-danger" name="_action_delete" formnovalidate><g:message code="default.button.delete.label" default="Delete" /></button>
						</div>
					</fieldset>
				</g:form>

			</div>
		</div>
	</body>
</html>
