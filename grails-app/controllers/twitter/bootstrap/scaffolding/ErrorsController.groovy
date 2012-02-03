package twitter.bootstrap.scaffolding

class ErrorsController {

	def index() {
		throw new RuntimeException("Deliberate error!")
	}
	
}
