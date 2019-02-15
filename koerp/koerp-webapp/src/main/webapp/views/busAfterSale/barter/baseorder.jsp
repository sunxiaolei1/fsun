<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>

<div id="bcOrdersDialog" class="alert" >
	<table class="nb-formTable" style="width:100%;">
        <tr>
            <th width="12%">原订单备注:</th>
			<td>
				<input name="remark" value="${header.remark}" data-options="multiline:true" 
					class="easyui-textbox" style="width:500px;height:260px;" editable="false"/>
			</td>						
        </tr>
	</table>
</div>