<div class="input-prepend form-control">
	<span class="add-on"><span class="glyphicon glyphicon-envelope"></span></span>
<%
	def attrs = [type: 'email', name: property, value: value]
	if (required) attrs.required = ''
	out << g.field(attrs)
%>
</div>