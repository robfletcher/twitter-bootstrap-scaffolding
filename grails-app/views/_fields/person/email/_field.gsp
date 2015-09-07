<%@ page defaultCodec="html" %>
<div class="${invalid ? 'error' : ''} form-group has-feedback has-feedback-left">
	<label class="control-label col-sm-2" for="${property}">${label}</label>
	%{--http://stackoverflow.com/questions/18838964/add-bootstrap-glyphicon-to-input-box--}%
	<div class="col-sm-10 inner-addon left-addon">
		<i class="glyphicon glyphicon-envelope"></i>
		<input type="email" name="${property}" value="${value}" id="${property}" class="form-control">
		%{--<f:input bean="${bean}" property="${property}" class="form-control"/>--}%
		<g:if test="${invalid}"><span class="help-block">${errors.join('<br>')}</span></g:if>
	</div>
</div>