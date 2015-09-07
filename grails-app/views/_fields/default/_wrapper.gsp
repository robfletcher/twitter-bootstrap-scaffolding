<%@ page defaultCodec="html" %>
<div class="${invalid ? 'error' : ''} form-group">
	<label class="control-label col-sm-2" for="${property}">${label}</label>
	<div class="col-sm-10">

		<f:input bean="${bean}" property="${property}" class="form-control"/>
		<g:if test="${invalid}"><span class="help-block">${errors.join('<br>')}</span></g:if>
	</div>
</div>