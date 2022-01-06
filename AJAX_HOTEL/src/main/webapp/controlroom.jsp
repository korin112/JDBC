<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실관리</title>
</head>
<h1 style="color:white; text-align:center;" >객실관리</h1>
<hr><br>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap"
	rel="stylesheet">
<style>
table {
	border-collapse: collapse;
	align:center;
}
body{
	background-image:url(https://wallpapercave.com/wp/wp3516813.jpg);
}
th,tr,td {
	border: 2px solid white;
	color:white;
	font-size:20px;
}
*{
	font-family: 'Gowun Batang', serif;
}

</style>
<body>
<table align=right width=30%>
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
			<td align=left><input type=button value='전송' id=btnGo style="display:block; width:100%; text-align:center; font-size:1em; padding:2px; background:black; color:white;" ></td>
		</tr>
	</table>
	<table id=tblRoom align=left width=60%>
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
