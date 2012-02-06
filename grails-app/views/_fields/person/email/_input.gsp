<div class="input-prepend">
	<span class="add-on"><i class="icon-envelope"></i></span>
<%
	def attrs = [type: 'email', name: property, value: value]
	if (required) attrs.required = ''
	out << g.field(attrs)
%>
</div>