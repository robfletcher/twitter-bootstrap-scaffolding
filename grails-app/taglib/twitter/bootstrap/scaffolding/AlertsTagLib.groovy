package twitter.bootstrap.scaffolding

class AlertsTagLib {

	static namespace = "bootstrap"

	def alert = { attrs, body ->
		out << '<div class="alert alert-block ' << attrs.class.tokenize().join(" ") << '" data-alert="alert">'
		out << '<a class="close">&times;</a>'
		out << '<p>' << body() << '</p>'
		out << '</div>'
	}

}
