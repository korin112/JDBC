<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실관리</title>
</head>
<style>
table {
	border-collapse: collapse;
}

th, td {
	border: 1px solid blue;
}
</style>
<body>
<table>
		<!-- 입력부분 -->
		<tr>
			<td>객실번호:<input type=number id=code></td>
		</tr>
		<tr>
			<td>객실명:<input type=text id=name></td>
		</tr>
		<tr>
			<td>객실종류:<input type=number id=type></td>
		</tr>
		<tr>
			<td>숙박가능인원:<input type=number id=howmany></td>
		</tr>
		<tr>
			<td>숙박비:<input type=number id=howmuch></td>
		</tr>
		<tr>
			<td align=center><input type=button value='전송' id=btnGo></td>
		</tr>
	</table><br>
	<table id=tblRoom>
		<!-- 객실목록 -->
		<thead>
			<tr>
				<th>객실번호</th>
				<th>객실명</th>
				<th>객실종류</th>
				<th>숙박가능인원</th>
				<th>숙박비</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.ready(function(){
	loadRoom();
	return false;
})
.on('click','#btnGo',function(){
	let operation='';
	if($('#code').val()==''){ //insert
		if($('#name').val()!='' &&
			$('#type').val()!='' &&
			$('#howmany').val()!='' &&
			$('#howmuch').val()!='' ){
			operation="insert";
		} else{
			alert('입력값이 모두 채워지지 않았습니다.');
			return false;
		  }
	} else{ 
		if($('#name').val()!='' &&	//update
		$('#type').val()!='' &&
		$('#howmany').val()!='' &&
		$('#howmuch').val()!=''){
			operation="update";
		} else{ //delete
			operation="delete";
		  }
	  } 
	//AJAX CALL
	$.get(operation,{code:$('#code').val(),
					name:$('#name').val(),
					type:$('#type').val(),
					howmany:$('#howmany').val(),
					howmuch:$('#howmuch').val()
				    },
				function(txt){
// 					alert('servlet finished');						
					$('#name,#type,#howmany,#howmuch,#code').val("");
					loadRoom();
				},'text');
	return false;
});
function loadRoom(){
	$('#tblRoom tbody').empty();
	$.get('select',{},function(txt){
		if(txt=='') return false;
		let rec=txt.split(';');
		for(i=0; i<rec.length; i++){
			let field=rec[i].split(',');
			let html='<tr><td>'+field[0]+'</td><td>'+field[1]+'</td><td>'+field[2]
					+'</td><td>'+field[3]+'</td><td>'+field[4]+'</td></tr>';
			$('#tblRoom tbody').append(html);
		}
	},'text');
}
</script>
</html>
