package twitter.bootstrap.scaffolding

class AlertsTagLib {

	static namespace = "bootstrap"

	def alert = { attrs, body ->
		out << '<div class="alert-message ' << attrs.class.tokenize().join(" ") << '">'
		out << '<a class="close" href="#">&times;</a>'
		out << '<p>' << body() << '</p>'
		out << '</div>'
	}

}
