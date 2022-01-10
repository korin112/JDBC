<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
    <title>카페관리</title>
</head>
<h1 align=center>Cafe</h1>
<hr>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap"
	rel="stylesheet">
<style>
table.bound {   
    border-collapse: collapse;
    border:2px solid gray;
    height: 400px;
    
    text-align:left;
    margin-left:auto; margin-right:auto;
    
}
td.bound {
    border:2px solid gray;
}    
#selMenu,#selOrder,#selSales,#selMenu1{
    width:260px;
}
*{
	font-family: 'Gowun Batang', serif;
	font-weight:bolder;
}
body{
	background-image:url(https://i.pinimg.com/550x/b5/62/7a/b5627a133f95c30b19bfbea15828bec9.jpg);
	margin:0 auto;
	width:800px;
}
footer{
	width: 120px; 
	margin: 0 auto;
}
</style>
<body>
<table>
<tr>
    <td valign=top>
        <table class='bound'>
        <caption><b>메뉴목록<b></caption>
        <tr>
            <td colspan="2" align="right">
                <button id=btnMenu>메뉴관리</button>
            </td>
        </tr>
        
        <tr>
            <td colspan="2">
                <select id=selMenu size=13></select>
            </td>
        </tr>
        
        <tr>
            <td>메뉴코드</td>
            <td><input type="text" id=menucode readonly></td>
        </tr>
        <tr>
            <td>메뉴명</td>
            <td><input type="text" id=menuname readonly></td>
        </tr>
        <tr>
            <td>수량</td>
            <td><input type="number" id=count min=1></td>
        </tr>
        <tr>
            <td>금액</td>
            <td><input type="text" id=price readonly></td>
        </tr>
        <tr>
            <td><button id=btnReset>비우기</button></td>
            <td align="right"><button id=btnAdd>메뉴추가</button></td>
        </tr>
        </table>
    </td>
    <td valign=top>
        <table class='bound'>
        <caption><b>주문목록<b></caption>
        <tr>
            <td colspan="2">
                <select id=selOrder size=16></select>
            </td>
        </tr>
        <tr>
            <td>총액</td>
            <td><input type="text" id=total size=15></td>
        </tr>
        <tr>
            <td>고객번호</td>
            <td><input type="phone" id=mobile size=15></td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td><button id=btnCancel>주문취소</button></td>
            <td align="right"><button id=btnDone>주문완료</button></td>
        </tr>
        </table>
    </td>
    <td valign=top>
        <table class='bound'>
        <caption><b>판매내역<b></caption>
        <tr>
            <td colspan="2" align="right">
                <button id=btnsum>Summary</button>
            </td>
        </tr>
        <tr>
            <td>
            <select id=selSales size=16></select>
            </td>
        </tr>
        </table>
    </td>
</tr>
</table>
<div id=dlgMenu style="display:none;" title='메뉴관리'>
    <table>
        <tr>
            <td>
                <select id=selMenu1 size=10></select>
            </td>
            <td>
                <table>
                 <tr>
                    <td>메뉴코드</td><td><input type=number id=_menucode style="width:200px;"></td>
                </tr>
                <tr>
                    <td>메뉴명</td><td><input type=text id=_menuname style="width:200px;"></td>
                </tr>
                <tr>
                    <td>단가(가격)</td><td><input type=number id=_price min=500 step=500 style="width:50px;">원</td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><button id=btnPlus>전송</button>
                    <button id=reset>삭제</button>    
                    </td>
                </tr>
                </table>
            </td>
        </tr>    
        </table>
</div>

<div id=dlgMenu1 style="display:none;" title='총 판매량'>
    <table>
        <tr>
            <td>메뉴코드/메뉴명/수량/가격
               <select id=sumMenu1 size=10> </select>
            </td> &nbsp&nbsp&nbsp&nbsp&nbsp     

            <td>
            	고객번호/총액<select id=sumMenu2 size=10></select>
            </td>
    </tr>
        </table>
</div>
</body>
<hr>
<footer>Copyleft: Yoo SH</footer>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script>   
ar1='';
$(document)
.ready(function(){
   loadMenu();
   return false;
})
.on('click','#selMenu',function(){
    str=$('#selMenu option:selected').text();
    ar=str.split(' ');
    $('#menucode').val(ar[0]);
    $('#menuname').val(ar[1]);
    $('#price').val(ar[2]);
    $('#count').val(1);
})
.on('change','#count',function(){
    str=$('#count').val();
    $('#price').val(ar[2]*str);
})
//$('btnReset').trigger('click'); -> 한 줄로 밑에 코드를 실행 가능
.on('click','#btnReset',function(){
    $('#menucode,#menuname,#count,#price').val('');
})
.on('click','#btnAdd',function(){
    str='<option>'+$('#menucode').val()+' '+$('#menuname').val()+' '+$('#count').val()+' '+ $('#price').val()+'</option>';
    $('#selOrder').append(str); 
    a=$('#price').val()
    a=parseInt(a);
    ar1+=a;
    ar1=parseInt(ar1);
    $('#total').val(ar1);
    $('#menucode,#menuname,#count,#price').val('');
})
.on('click','#reset',function(){
	$('#_menucode,#_menuname,#_price').val('');
})
.on('click','#btnCancel',function(){
    $('#total,#mobile').val('');
    $('#selOrder').text('');
    ar1=0;
})
.on('click','#btnDone',function(){
    $('#selOrder option').each(function(){
    	if($('#mobile').val() == ''){
    		$('#mobile').val('Guest');
       	}
    	str='<option>'+$('#mobile').val()+' '+$(this).text()+'</option>';
    	$('#selSales').append(str);
    	stt=$('#mobile').val()+' '+$(this).text();
    	stt1=stt.split(' ');
    		$.get('insertSales',{mobile:stt1[0],code:stt1[1],name:stt1[2],qty:stt1[3],price:stt1[4]},function(txt){},'text');    		    		
		})
    ar1=0;
	$('#selOrder').text(" ");
	$('#mobile,#total,#menucode,#menuname,#count,#price').val('');
})

.on('click','#btnMenu',function(){
    $('#dlgMenu').dialog({
        width:600,
        open:function(){
            $('#selMenu1').empty();
            $.get('selectMenu',{},function(txt){
				let rec=txt.split(';');
				for(i=0; i<rec.length; i++){
			let field=rec[i].split(',');
			let html='<option value='+field[0]+'>'+field[0]+' '+field[1]+' '+field[2]+'</option>';
			$('#selMenu1').append(html);
				}
									},'text');
            },        		
        close:function(){       // 변경된 메뉴리스트를 원래 메뉴목록에 표시
            $('#selMenu').empty();
            $.get('selectMenu',{},function(txt){let rec=txt.split(';');
												for(i=0; i<rec.length; i++){
													let field=rec[i].split(',');
													let html='<option value='+field[0]+'>'+field[0]+' '+field[1]+' '+field[2]+'</option>';
													$('#selMenu').append(html);
												}},'text');
            }
    })
})
.on('click','#selMenu1',function(){  //메뉴명과 가격이 표시된다. _menuname / _price
    let str=$('#selMenu1 option:selected').text();
    ar=str.split(' ');
    $('#_menucode').val(ar[0]);
    $('#_menuname').val(ar[1]);
    $('#_price').val(ar[2]);
})

.on('click','#btnPlus',function(){  //추가(생성) 및 수정            아메리카노의 인덱스번호를 바꿔야됨\
    a=$('#_price').val()
    a=parseInt(a)
    let operation='';
	if($('#_menucode').val()=='' && //insert
		$('#_menuname').val()!='' &&
			$('#_price').val()!='' ){
			operation="insertMenu";
		} if($('#_menucode').val()!='' &&
				$('#_menuname').val()=='' &&
				$('#_price').val()==''){
			operation="deleteMenu";
		} if($('#_menucode').val()!='' &&
				$('#_menuname').val()!='' &&
				$('#_price').val()!= ''){
			operation="updateMenu";
		}
	$.get(operation,{code:$('#_menucode').val(),
		name:$('#_menuname').val(),
		price:$('#_price').val()
		},
	function(txt){
//			alert('servlet finished');						
		$('#_menucode,#_menuname,#_price').val("");
		loadselMenu();
	},'text');
    })
    
.on('click','#btnsum',function(){
	loadsum1();
	})

function loadMenu(){
	$('#selMenu').empty();
	$.get('selectMenu',{},function(txt){
				let rec=txt.split(';');
				for(i=0; i<rec.length; i++){
			let field=rec[i].split(',');
			let html='<option value='+field[0]+'>'+field[0]+' '+field[1]+' '+field[2]+'</option>';
			$('#selMenu').append(html);
		}
	},'text');
	return false;
};

function loadselMenu(){
	$('#selMenu1').empty();
	$.get('selectMenu',{},function(txt){
				let rec=txt.split(';');
				for(i=0; i<rec.length; i++){
			let field=rec[i].split(',');
			let html='<option value='+field[0]+'>'+field[0]+' '+field[1]+' '+field[2]+'</option>';
			$('#selMenu1').append(html);
		}
	},'text');
	return false;
};

function loadsum1(){
	$('#dlgMenu1').dialog({
        width:600,
        open:function(){
            $('#sumMenu1').empty();
            $.get('selectSales',{},function(txt){
				let rec=txt.split(';');
				for(i=0; i<rec.length; i++){
			let field=rec[i].split(',');
			let html='<option value='+field[0]+'>'+field[0]+' '+field[1]+' '+field[2]+' '+field[3]+'</option>';
			$('#sumMenu1').append(html);
				}
									},'text');
            $('#sumMenu2').empty();
            $.get('selectSales1',{},function(txt){
				let rec=txt.split(';');
				for(i=0; i<rec.length; i++){
			let field=rec[i].split(',');
			let html='<option value='+field[0]+'>'+field[0]+' '+field[1]+'</option>';
			$('#sumMenu2').append(html);
				}
									},'text');}}
	)
};

</script>
</html>