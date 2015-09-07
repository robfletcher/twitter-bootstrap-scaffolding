<%
	def attrs = [name: property, value: value, placeholder: 'yyyy-mm-dd', size: 10,class:'form-control']
	if (required) attrs.required = ''
	out << joda.dateField(attrs)
%>