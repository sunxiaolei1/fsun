<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<div id="sysCodesDialog" class="alert">
	<form id="fm" style="padding:10px 20px 0 20px;">
		<input name="codeId" id="codeId" type="hidden" />
		<table class="table">
			<tr>	
				<th>数据类别</th>
				<td>
					<input type="text" id="codeType" name="codeType" class="easyui-textbox" required />
				</td>
			</tr>
			<tr>	
				<th>编码</th>
				<td>	
					<input type="text" id="codeCode" name="codeCode" class="easyui-textbox" required />
				</td>
			</tr>
			<tr>	
				<th>名称</th>
				<td>	
					<input type="text" id="codeName" name="codeName" class="easyui-textbox" required />
				</td>
			</tr>
			<tr>	
				<th>排序号</th>
				<td>	
					<input type="text" id="sortCode" name="sortCode" class="easyui-textbox" validType="integer" />
				</td>
			</tr>			
			<tr>	
				<th>自定义2</th>
				<td>	
					<input type="text" id="userDefine2" name="userDefine2" class="easyui-textbox" />
				</td>
			</tr>
			<tr>	
				<th>自定义3</th>
				<td>	
					<input type="text" id="userDefine3" name="userDefine3" class="easyui-textbox" />
				</td>
			</tr>
			<tr>	
				<th>备注</th>
				<td>	
					<input type="text" id="userDefine1" name="userDefine1" class="easyui-textbox" />
				</td>
			</tr>
		</table> 
	</form>
</div>
