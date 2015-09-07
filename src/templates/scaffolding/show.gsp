<% import grails.persistence.Event %>
<%=packageName%>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
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
						<li>
							<g:link class="create" action="create">
								<span class="glyphicon glyphicon-plus"></span>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="col-sm-9 col-md-9">

				<div class="page-header">
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="\${flash.message}">
				<bootstrap:alert class="alert-info">\${flash.message}</bootstrap:alert>
				</g:if>

				<dl>
				<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
					allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
					props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) }
					Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
					props.each { p -> %>
					<g:if test="\${${propertyName}?.${p.name}}">
						<dt><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></dt>
						<%  if (p.isEnum()) { %>
							<dd><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></dd>
						<%  } else if (p.oneToMany || p.manyToMany) { %>
							<g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
							<dd><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></dd>
							</g:each>
						<%  } else if (p.manyToOne || p.oneToOne) { %>
							<dd><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link></dd>
						<%  } else if (p.type == Boolean || p.type == boolean) { %>
							<dd><g:formatBoolean boolean="\${${propertyName}?.${p.name}}" /></dd>
						<%  } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
							<dd><g:formatDate date="\${${propertyName}?.${p.name}}" /></dd>
						<%  } else if(!p.type.isArray()) { %>
							<dd><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></dd>
						<%  } %>
					</g:if>
				<%  } %>
				</dl>

				<g:form>
					<g:hiddenField name="id" value="\${${propertyName}?.id}" />
					<div class="form-actions">
						<g:link class="btn btn-default" action="edit" id="\${${propertyName}?.id}">
							<span class="glyphicon glyphicon-pencil icon-white"></span>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-default btn-danger" type="submit" name="_action_delete">
							<span class="glyphicon glyphicon-trash icon-white"></span>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>

			</div>

		</div>
	</body>
</html>
