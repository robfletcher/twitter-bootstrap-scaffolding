<%
	def attrs = [name: property, value: value]
	if (required) attrs.required = ''
	out << joda.dateField(attrs)
%>