<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <meta charset="utf-8">
    <link href="https://fonts.googleapis.com/css?family=Stylish&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Stylish&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cute+Font&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com`/css?family=Gamja+Flower&display=swap" rel="stylesheet">
    <title>인천투어</title>
	<link href="AddAcount.css" rel="stylesheet" type="text/css">
  </head>
  <body>
    <div class = "wrapper">
   <header>
   <jsp:include page="Top.jsp" flush="false"/>
    </header>
	<contents>		
<div class="newAccount">
<form method = "post" action = "AddAcountProc.jsp">

<table class="table">
    <tbody>
      <tr>
        <td>아이디 :</td>
        <td><input type = "text" name = "ID"></td>
      </tr>
      <tr>
        <td>비밀번호 :</td>
        <td><input type = "password" name = "PS"></td>
      </tr>
      <tr>
        <td>이름 :</td>
        <td><input type = "text" name = "NA"></td>
      </tr>
       <tr>
   	   <td>성별 :</td>
       <td>남자 <input type = "radio" name = "SEX" value = "M"> 
		   여자<input type = "radio" name = "SEX" value = "F"></td>
      </tr>
      <tr>
   	   <td>전화번호 :</td>
       <td><select name = "TEL1">
			<option value = "010"> 010 </option>
			<option value = "011"> 011 </option>
			<option value = "012"> 012 </option>
			<option value = "013"> 013 </option>
			<option value = "014"> 014 </option>
			<option value = "015"> 015 </option>
			<option value = "016"> 016 </option>
			<option value = "017"> 017 </option>
			<option value = "018"> 018 </option>
			<option value = "019"> 019 </option>
		</select> - 
		<input type = "text" name = "TEL2" MAX = 4 size = 3> - 
		<input type = "text" name = "TEL3" size = 3></td>
      </tr>
      <tr>
   	   <td>이메일 :</td>
       <td><input type="text" name="EMAIL1"> @ 
		<select name="EMAIL2"> 
		<option value="naver.com" selected>네이버</option> 
		<option value="hanmail.net">한메일</option> 
		<option value="hotmail.com">핫메일</option> 
		<option value="nate.com">네이트</option> 
		<option value="yahoo.co.kr">야후 코리아</option> 
		<option value="empas.com">엠파스</option> 
		<option value="dreamwiz.com">드림위즈</option>
		<option value="gmail.com">지메일</option> 
		<option value="paran.com">파란</option> 
		</select>
      </tr>
      <tr>
   	   <td>필수동의 약관</td>
       <td><div class="form-group">
  		<textarea class="form-control" rows="5" id="comment" style="resize: none;">인천투어 홈페이지
('http://itour.incheon.go.kr'이하 '인천투어')는 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록
다음과 같은 「개인정보 처리방침」을 두고 있습니다.

인천투어는 개인정보처리방침을 개정하는 경우 인천투어 홈페이지를 통하여 공지합니다. 본 방침은
2017년 2월 15일부터
시행됩니다.

제1조(개인정보의 처리 목적)

'인천투어'는 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전 동의를 구할 예정입니다.

① 문화관광해설사 운영관리시스템 서비스를 위하여 문화관광해설사 회원 관리 및 운영과 문화관광해설사 이용예약 신청 업무를 위한 본인 식별·인증, 서비스 부정이용 방지 등을 목적으로
개인정보를 처리합니다.
② 인천투어 홈페이지를 통한 인천관광안내지도 온라인 신청 접수와 우편발송 및 신청자에게 대하여 신청결과를 SMS 통보하기 위하여 신청자의 개인 정보를 처리합니다.

제2조(개인정보의 처리 및 보유 기간)

'인천투어'는 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보를 처리하고 이용기간 동안 암호화하여 DB로 보유합니다.

제3조(개인정보의 제3자 제공)

'인천투어'는 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.

제4조(정보주체의 권리,의무 및 그 행사방법)

이용자는 개인정보주체로서 다음과 같은 권리를 행사할 수 있습니다.

① 정보주체는 '인천투어'에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.
- 개인정보 열람요구
- 오류 등이 있을 경우 정정 요구
- 삭제요구
- 처리정지 요구
② 제1항에 따른 권리 행사는 '인천투어'에 대해 개인정보 보호법 시행규칙 별지 제8호 서식에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여
하실 수 있으며 '인천투어'는 이에 대해 지체 없이 조치하겠습니다.
③ 정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에 '인천투어'는 정정 또는 삭제를 완료할 때까지 당해 개인정보를
이용하거나 제공하지 않습니다.
④ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙
별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.
제5조(처리하는 개인정보의 항목)

'인천투어'는 다음의 개인정보 항목을 처리하고 있습니다.
- 관광안내지도 신청 : 이름, 주소, 전화번호
- 문화관광해설사 온라인예약 : 이름, 성별, 전화번호, 이메일
- 문화관광해설사 회원정보 : 아이디, 이름, 주소, 이메일, 전화번호, 은행명, 계좌번호, 사진정보

제6조(개인정보의 파기)

'인천투어'는 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.
1. 파기절차
이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 암호화하여 보관되며, 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.
2. 파기기한
이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로 부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정 되는 날로부터 5일 이내에 그 개인정보를 파기합니다.
3. 파기방법
전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다. 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.

제7조(개인정보의 안전성 확보 조치)

'인천투어'는 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.
1. 개인정보 취급 직원의 최소화 및 교육
개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.
2. 정기적인 자체 감사 실시
개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.
3. 내부관리계획의 수립 및 시행
개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.
4. 개인정보의 암호화
이용자의 개인정보는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.
5. 해킹 등에 대비한 기술적 대책
해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신,점검을 시행하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.
6. 개인정보에 대한 접근 제한
개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여, 변경, 말소를 통하여 개인정보에 대한 접근통제 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.
7. 접속기록의 보관 및 위변조 방지
개인정보처리시스템에 접속한 기록을 최소 6개월 이상 보관·관리하고 있으며, 접속 기록이 위변조 및 도난, 분실되지 않도록 보안기능을 사용하고 있습니다.
8. 문서보안을 위한 잠금장치 사용
개인정보가 포함된 서류, 보조저장매체 등을 잠금장치가 있는 안전한 장소에 보관하고 있습니다.
9. 비인가자에 대한 출입 통제
개인정보를 보관하고 있는 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다.

제8조(개인정보보호책임자 및 담당자)

① '인천투어'는 개인정보를 보호하고 개인정보화 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보보호 책임자를 지정하고 있습니다.
◎ '인천투어' 개인정보보호 책임자
* 직 책 : 문화관광국장
* 성 명 : 조인권
* 연락처 : 032-440-2075
◎ '인천투어' 개인정보 보호담당자
* 부서명 : 관광진흥과
* 담당자 : 배찬수
* 연락처 : 032-440-4053
* 이메일 : coldwater@korea.kr
②정보주체는 '인천투어'의 서비스를 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 보호 담당자에게
문의하실 수 있습니다. '인천투어'는 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.

제9조(권익침해 구제방법)

개인정보주체는 개인정보침해로 인한 구제를 받기 위하여 개인정보분쟁조정위원회, 한국인터넷진흥원 개인정보침해신고센터 등에 분쟁해결이나 상담 등을 신청할 수 있습니다. 이 밖에 기타 개인정보침해의 신고 및 상담에 대하여는 아래의 기관에 문의하시기를 바랍니다.
1. 개인정보 분쟁조정위원회 : 02-405-5150 (www.kopico.or.kr)
2. 개인정보 침해신고센터 : (국번없이) 118 (privacy.kisa.or.kr)
3. 대검찰청 사이버범죄수사단 : 02-3480-3571(cybercid.spo.go.kr)
4. 경찰청 사이버테러대응센터 : 1566-0112(www.netan.go.kr)

제10조(개인정보 처리방침 변경)

① 이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 홈페이지를 통하여 고지할 것입니다.
② 이전의 개인정보 처리방침은 아래에서 확인하실 수 있습니다.
- 2016. 1. 08 : 개인정보 보호책임자 및 개인정보처리방침 변경 (이전방침 보기)
- 2012. 2. 29 : 개인정보 보호책임자 및 보호담당자 변경
- 2011. 9. 30 : 개인정보보호정책 -> 개인정보처리방침 변경</textarea></div>
  		<label class="radio-inline"><input type="radio" name="NCTermsAgree" value="Y" checked> 예, 동의합니다. &nbsp; </label>
		<label class="radio-inline"><input type="radio" name="NCTermsAgree" value = "N">아니요, 동의하지 않습니다.</label></td>
      </tr>
      <tr>
   	   <td>선택동의 약관</td>
       <td><div class="form-group">
  		<textarea class="form-control" rows="5" id="comment" style="resize: none;">수락 시 이벤트 정보를 수신하실 수 있습니다.</textarea></div>
  		<label class="checkbox-inline"><input type="checkbox" name = "OPTermsAgree" value="Y">예, 동의합니다. &nbsp;</label></td>
      </tr>
    </tbody>
  </table>
<button type="submit" class="btn btn-default btn-sm" value = "완료">완료</button>&nbsp;&nbsp;&nbsp;
<a href="Index.jsp"><button type="button" class="btn btn-default btn-sm" >이전페이지로</button></a>

</form>
</div>
</contents>


<footer>
     <jsp:include page="Bottom.jsp" flush="false"/>
    </footer>
    </div>
  </body>
</html>