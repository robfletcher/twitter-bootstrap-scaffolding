<%
	def attrs = [name: property, value: value, placeholder: 'yyyy-mm-dd', class: 'span2']
	if (required) attrs.required = ''
	out << joda.dateField(attrs)
%>