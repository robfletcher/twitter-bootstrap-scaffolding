<% import grails.persistence.Event %>
<%=packageName%>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="row">

    <div class="col-sm-3 col-md-3">
        <div class="well">
            <ul class="nav nav-list">
                <li class="nav-header">\${entityName}</li>
                <li class="active">
                    <g:link class="list" action="list">
                        <span class="glyphicon glyphicon-list"></span>
                        <g:message code="default.list.label" args="[entityName]"></g:message>
                    </g:link>
                </li>
                <li>
                    <g:link class="create" action="create">
                        <span class="glyphicon glyphicon-plus"></span>
                        <g:message code="default.create.label" args="[entityName]"></g:message>
                    </g:link>
                </li>
            </ul>
        </div>
    </div>

    <div class="col-sm-9 col-md-9">

        <div class="page-header">
            <h1><g:message code="default.list.label" args="[entityName]"></g:message></h1>
        </div>

        <g:if test="\${flash.message}">
            <bootstrap:alert class="alert-info">\${flash.message}</bootstrap:alert>
        </g:if>

        <table class="table table-striped">
            <thead>
            <tr>
                <% excludedProps = Event.allEvents.toList() << 'id' << 'version'
                allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
                props = domainClass.properties.findAll {
                    allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type)
                }
                Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
                props.eachWithIndex { p, i ->
                    if (i < 6) {
                        if (p.isAssociation()) { %>
                <th class="header"><g:message code="${domainClass.propertyName}.${p.name}.label"
                                              default="${p.naturalName}"/></th>
                <% } else { %>
                <g:sortableColumn property="${p.name}"
                                  title="\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${
                                          p.naturalName}')}"/>
                <% }
                }
                } %>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="\${${propertyName}List}" var="${propertyName}">
                <tr>
                    <% props.eachWithIndex { p, i ->
                        if (i < 6) {
                            if (p.type == Boolean || p.type == boolean) { %>
                    <td><g:formatBoolean boolean="\${${propertyName}.${p.name}}"/></td>
                    <%
                        } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
                    <td><g:formatDate date="\${${propertyName}.${p.name}}"/></td>
                    <% } else { %>
                    <td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
                    <% }
                    }
                    } %>
                    <td class="link">
                        <g:link action="show" id="\${${propertyName}.id}"
                                class="btn btn-default btn-sm">Show &raquo;</g:link>

                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="pagination">
            <bootstrap:paginate total="\${${propertyName}Total}"></bootstrap:paginate>
        </div>
    </div>

</div>`
</body>
</html>
