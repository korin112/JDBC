<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
    <title>카페관리</title>
</head>
<style>
table.bound {   
    border-collapse: collapse;
    border:2px solid gray;
    height: 400px;
    width: 260px;
}
td.bound {
    border:2px solid gray;
}    
#selMenu,#selOrder,#selSales,#selMenu1{
    width:240px;
}
</style>
<body>
<table>
<tr>
    <td valign=top>
        <table class='bound'>
        <caption>메뉴목록</caption>
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
        <caption>주문목록</caption>
        <tr>
            <td colspan="2">
                <select id=selOrder size=15></select>
            </td>
        </tr>
        <tr>
            <td>총액</td>
            <td><input type="text" id=total></td>
        </tr>
        <tr>
            <td>고객번호</td>
            <td><input type="phone" id=mobile size=13></td>
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
        <caption>판매내역</caption>
        <tr>
            <td>
            <select id=selSales size=20></select>
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
                    <td>메뉴명</td><td><input type=text id=_menuname style="width:200px;"></td>
                </tr>
                <tr>
                    <td>단가(가격)</td><td><input type=number id=_price min=500 step=500 style="width:50px;">원</td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><button id=btnPlus>추가</button>&nbsp;
                        <button id=btnUpdate>수정</button>
                        <button id=btnMinus>삭제</button>
                    </td>
                </tr>
                </table>
            </td>
        </tr>    
        </table>
    
</div>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script>   


$(document)
.ready(function(){
   loadMenu();
   return false;
})
.on('click','#selMenu',function(){
    str=$('#selMenu option:selected').text();
    ar=str.split(' ');
    $('#menuname').val(ar[0]);
    $('#price').val(ar[1]+'원');
    $('#count').val(1)+'원';
})
.on('change','#count',function(){
    str=$('#count').val();
    $('#price').val(ar[1]*str+'원');
})
//$('btnReset').trigger('click'); -> 한 줄로 밑에 코드를 실행 가능
.on('click','#btnReset',function(){
    $('#menuname,#count,#price').val('');
})
.on('click','#btnAdd',function(){
    str='<option>'+$('#menuname').val()+'     '+$('#count').val()+'개'+'     '+ $('#price').val()+'</option>';
    $('#selOrder').append(str); 
    a=$('#price').val()
    a=parseInt(a)
    ar1+=a
    $('#total').val(ar1+'원')
})
.on('click','#btnCancel',function(){
    $('#total,#mobile').val('');
    $('#selOrder').text('');
    ar1=0;
})
// .on('click','#btnDone',function(){
//     str1='<option>'+'고객번호 : '+$('#mobile').val()+'     '+'구매금액 : '+$('#total').val()+'</option>';  
//     $('#selSales').append(str1);
//     $('#selOrder').text('');
//     $('#menuname,#count,#price,#total,#mobile').val('');
//     ar1=0;
// })
// .on('click','#btnMenu',function(){
//     $('#dlgMenu').dialog({
//         width:560,
//         open:function(){
//             $('#selMenu1').empty();
//             $.each(arMenu,function(ndx,obj){
//             strMenu=`<option value="${obj['name']}">${obj['name']} ${obj['price'] }</option>`;
//             $('#selMenu1').append(strMenu);
//             })
//         },
//         close:function(){       // 변경된 메뉴리스트를 원래 메뉴목록에 표시
//             $('#selMenu').empty();
//             $.each(arMenu,function(ndx,obj){
//             strMenu=`<option value="${obj['name']}">${obj['name']} ${obj['price'] }</option>`;
//             $('#selMenu').append(strMenu);
//             })
//         }
        
//     });
// })
// .on('click','#selMenu1',function(){  //메뉴명과 가격이 표시된다. _menuname / _price
//     let str=$('#selMenu1 option:selected').text();
//     ar=str.split(' ');
//     console.log(ar)
//     $('#_menuname').val(ar[0]);
//     $('#_price').val(ar[1]);
// })
// .on('click','#btnPlus',function(){  //추가(생성) 및 수정            아메리카노의 인덱스번호를 바꿔야됨\
//     a=$('#_price').val()
//     a=parseInt(a)
//     let obj={};
//     obj['name']=$('#_menuname').val();
//     obj['price']=$('#_price').val();
//     arMenu.push(obj);
//     $('#selMenu1').empty();
//     $.each(arMenu,function(ndx,obj){
//     strMenu=`<option value="${obj['name']}">${obj['name']} ${obj['price'] }</option>`;
//     $('#selMenu1').append(strMenu);
//     })
// })

// .on('click','#btnMinus',function(){ // 삭제 (null)
//     let ndx=$('#selMenu1 option:selected').index();
//     arMenu.splice(ndx,1)
//     $('#selMenu1').empty();
//      $.each(arMenu,function(ndx,obj){
//     strMenu=`<option value="${obj['name']}">${obj['name']} ${obj['price'] }</option>`;
//     $('#selMenu1').append(strMenu);
//     })
// })
// .on('click','#btnUpdate',function(){        //수정및변경
//     a=$('#_price').val()
//     a=parseInt(a)
//     let ndx=$('#selMenu1 option:selected').index();
//     arMenu[ndx]['name']=$('#_menuname').val();
//     arMenu[ndx]['price']=a;
//     $('#selMenu1').empty();
//     $.each(arMenu,function(ndx,obj){
//     strMenu=`<option value="${obj['name']}">${obj['name']} ${obj['price'] }</option>`;
//     $('#selMenu1').append(strMenu);
//     })
// });

function loadMenu(){
	$('#selMenu').empty();
	$.get('selectMenu',{},function(txt){
				let rec=txt.split(';');
				for(i=0; i<rec.length; i++){
			let field=rec[i].split(',');
			let html='<option value='+field[0]+'>'+field[0]+' '+field[1]+'</option>';
			$('#selMenu').append(html);
			
		}
	},'text');
	
	return false;
}



</script>
</html>