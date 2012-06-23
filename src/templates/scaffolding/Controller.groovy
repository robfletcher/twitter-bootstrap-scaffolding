<%=packageName ? "package ${packageName.replace('domain', 'controller')}\n\n" : ''%>
import <%=packageName ? "${packageName.replace('controller', 'domain')}.${className}\n" : '${className}'%>
import org.springframework.dao.DataIntegrityViolationException
import groovy.lang.Closure

class ${className}Controller {
	private static final String LIST 	= "/${propertyName}/list"
	private static final String SHOW 	= "/${propertyName}/show"
	private static final String CREATE	= "/${propertyName}/create"
	private static final String EDIT 	= "/${propertyName}/edit"
	
	static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

	def index() {
		redirect action: 'list', params: params
	}

	def list() {
		if (!params.max)	params.max = 10
		render view:LIST, model: [${propertyName}List: ${className}.list(params), ${propertyName}Total: ${className}.count()]
	}

	def create() {
		switch (request.method) {
		case 'GET':
			render view:CREATE, model:[${propertyName}: new ${className}(params)]
			break
		case 'POST':
			def ${propertyName} = new ${className}(params)
			if (!${propertyName}.save(flush: true)) {
				render view: CREATE, model: [${propertyName}: ${propertyName}]
				return
			}

			flash.message = message(code: 'default.created.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), ${propertyName}.id])
			redirect action: 'show', id: ${propertyName}.id
			break
		}
	}

	def show() {
		withDomain { ${className} ${propertyName} ->
			render view:SHOW, model: [${propertyName}: ${propertyName}]
		}
	}

	def edit() {
		withDomain { ${className} ${propertyName} ->
			switch (request.method) {
			case 'GET':
				render view:EDIT, model: [${propertyName}: ${propertyName}]
				break
			case 'POST':
				if (params.version) {
					def version = params.version.toLong()
					if (${propertyName}.version > version) {<% def lowerCaseName = grails.util.GrailsNameUtils.getPropertyName(className) %>
						${propertyName}.errors.rejectValue('version', 'default.optimistic.locking.failure',
								  [message(code: '${domainClass.propertyName}.label', default: '${className}')] as Object[],
								  "Another user has updated this ${className} while you were editing")
						render view: EDIT, model: [${propertyName}: ${propertyName}]
						return
					}
				}
	
				${propertyName}.properties = params
	
				if (!${propertyName}.save(flush: true)) {
					render view: EDIT, model: [${propertyName}: ${propertyName}]
					return
				}
	
				flash.message = message(code: 'default.updated.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), ${propertyName}.id])
				redirect action: 'show', id: ${propertyName}.id
				break
			}
		}
	}

	def delete() {
		withDomain { ${className} ${propertyName} ->
			try {
				${propertyName}.delete(flush: true)
				flash.message = message(code: 'default.deleted.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])
				redirect action: 'list'
			}
			catch (DataIntegrityViolationException e) {
				flash.message = message(code: 'default.not.deleted.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])
				redirect action: 'show', id: params.id
			}
		}
	}
	
    private def withDomain(Closure success) {
	   ${className} instance = ${className}.get(params.id as Long)
	   if (instance) {
		   success.call(instance)
	   }
	   else {
		   flash.message = message(code: 'default.not.found.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])
		   redirect action: 'list'
	   }
   }
}