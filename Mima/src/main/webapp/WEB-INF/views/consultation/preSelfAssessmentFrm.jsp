<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- s:1003 진료 전 자가점검 페이지 -->    

<div class="boxed_wrapper">

    <!-- preloader -->
    <div class="preloader"></div>
    <!-- preloader -->

    <!--page-title-two-->
    <section class="page-title-two">
        <div class="title-box centred bg-color-2">
            <div class="auto-container">
                <div class="title">
                    <h1>진료전 자가검진표</h1>
                </div>
            </div>
        </div>
        <div class="lower-content">
            <div class="auto-container">
                <ul class="bread-crumb clearfix">
                    <li><a href="localhost/app">Home</a></li>
                    <li>자가검진표</li>
                </ul>
            </div>
        </div>
    </section>
    <!--page-title-two end-->


    <!-- s:1003 자가진단표 http://www.sungae.or.kr/health/sub_02_09.html -->
    <section class="appointment-section bg-color-3" >
        <div class="auto-container">
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 left-column"  style="margin-bottom: 30px;">
                    <div class="appointment-information">
                        <div class="title-box">
                            <h3>스트레스 증상의 자가 점검표</h3>
                        </div>
                        <div class="inner-box">
                            <form id="form1" name="form1" method="post" onsubmit="sendit(document.regiform)">
                            <h3>각 문항에 예/아니오로 답해 주세요.</h3>
                        <table class="table" summary="스트레스 증상의 자가 점검표">
                            <tbody>
                                <tr>
                                    <th style="font-size:15px;" width="60">번호</th>
                                    <th height="39">질문</th>
                                    <th "="" style=" font-size:15px; text-align: center;" width="100">예 </th>
                                    <th "="" style=" font-size:15px; text-align: center;" width="100">아니오</th>
                                </tr>
                                <tr>
                                    <td height="28" align="center">1</td>
                                    <td class="td_left">머리가 개운하지 않다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_1" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_1" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">2</td>
                                    <td class="td_left">눈이 피로하다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_2" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_2" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">3</td>
                                    <td class="td_left">때때로 코가 막힐 때가 있다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_3" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_3" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">4</td>
                                    <td class="td_left">어지럼증을 느낄 때가 있다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_4" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_4" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">5</td>
                                    <td class="td_left">때때로 기둥을 붙잡고 서 있고 싶을 때가 있다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_5" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_5" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">6</td>
                                    <td class="td_left">귀에서 소리가 들릴 때가 있다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_6" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_6" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">7</td>
                                    <td class="td_left">때로는 입안에 염증이 생길 때가 있다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_7" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_7" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">8</td>
                                    <td class="td_left">목이 아플 때가 있다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_8" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_8" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">9</td>
                                    <td class="td_left">혓바닥이 하얗게 되어 있을 때가 있다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_9" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_9" value="0">
                        
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">10</td>
                                    <td class="td_left">좋아하던 음식을 별로 먹지 않게 되었다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_10" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_10" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">11</td>
                                    <td class="td_left">식후에 위가 무거워지는 느낌이 있다.<br>
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_11" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_11" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">12</td>
                                    <td class="td_left">배가 팽팽하거나 아프거나 한다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_12" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_12" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">13</td>
                                    <td class="td_left">어깨가 아프다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_13" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_13" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">14</td>
                                    <td class="td_left">등골이나 배가 아픈 적이 있다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_14" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_14" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">15</td>
                                    <td class="td_left">좀처럼 피로가 없어지지 않는다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_15" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_15" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">16</td>
                                    <td class="td_left">근래에 몸무게가 줄었다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_16" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_16" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">17</td>
                                    <td class="td_left">쉽게 피로를 느낀다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_17" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_17" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">18</td>
                                    <td class="td_left">아침에 기분 좋게 일어날 수 없는 날이 있다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_18" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_18" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">19</td>
                                    <td class="td_left">일할 의욕이 생기지 않는다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_19" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_19" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">20</td>
                                    <td class="td_left">잠을 쉽게 들지 못한다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_20" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_20" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">21</td>
                                    <td class="td_left">꿈을 많이 꾸거나 선잠을 잔다.<br>
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_21" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_21" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">22</td>
                                    <td class="td_left">새벽 한시나 두시경에 잠이 깨어버린다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_22" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_22" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">23</td>
                                    <td class="td_left">갑자기 숨쉬기가 힘들어질 때가 있다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_23" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_23" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">24</td>
                                    <td class="td_left">때때로 가슴이 두근거릴 때가 있다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_24" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_24" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">25</td>
                                    <td class="td_left">가슴이 아파오는 수가 있다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_25" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_25" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">26</td>
                                    <td class="td_left">자주 감기에 걸린다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_26" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_26" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">27</td>
                                    <td class="td_left">사소한 일로 화가 난다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_27" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_27" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">28</td>
                                    <td class="td_left">손발이 찰 때가 있다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_28" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_28" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">29</td>
                                    <td class="td_left">손바닥이나 겨드랑이에 땀이 날 때가 있다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_29" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_29" value="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="28" align="center">30</td>
                                    <td class="td_left">사람을 만나는 것이 두려울 때가 있다.</td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_30" value="1">
                                    </td>
                                    <td align="center">
                                        <input type="radio" class="border_none" name="q_30" value="0">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="btn-box">
                            <button type="button" id="calcResult" class="theme-btn-one" data-toggle="modal" data-target="#exampleModal">결과확인하기<i class="icon-Arrow-Right"></i></button>
                        </div>
                        </form>
                        </div>

                    </div>
                </div>
	
                
                <div class="col-lg-12 col-md-12 col-sm-12 left-column">
                    <div class="appointment-information">
                        <div class="title-box">
                            <h3>진료를 위한 추가적인 정보입력</h3>
                        </div>
                        <div class="inner-box">   
                        <div class="information-form">
                            <form action="book-appointment.html" method="post">
                                <div class="row clearfix">
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                       
                                        <br><label>이 전문의와 첫 진료인가요?</label>
                                        <input type="text" id="isThisFirstSession" name="isThisFirstSession" placeholder="네/아니오로 답해주세요." required="">
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label>다른 곳에서 동일한 이유로 진료를 받은적이 있나요?</label>
                                        있다면 언제, 어느 병원/의사인지 알려주세요.
                                        <input type="text" name="pastSession" id="pastSession" placeholder="네/아니오로 답해주세요." required="">
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                        <label>이번에 진료를 예약하게된 계기가 무엇인가요? 자세히 알려주시면 진료에 도움이 될거예요.</label>
                                        <input type="text" id="reason" name="reason" placeholder="가능하면 구체적으로 알려주세요." required="">
                                    </div>
                                
                                    <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                        <label>과거에 진단받은 병명이 있나요?</label>
                                        <input type="text" id="pastDiagnosis" name="pastDiagnosis" required="">
                                    </div>
                                    <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                        <label>현재 복용하고 있는 약이 있나요?</label>
                                        <input type="text" name="currentMeds" id="currentMeds" required="">
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                        <label>미마님에 대해 알려주세요. 미마님을 알 수 있는 정보는 더 정확한 진료에 도움이 됩니다.</label>
                                        <textarea name="currentStatus" id="currentStatus" placeholder="최근의 기분, 현재 상황, 어떤 점이 힘든지 등 무엇이든 좋아요."></textarea>
                                    </div>
                                </div>
                                <div class="btn-box">
                                    <button id="form2SubmitBtn" class="theme-btn-one">제출하기<i class="icon-Arrow-Right"></i></button>
                                </div>
                            </form>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- appointment-section end -->
    
    
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">스트레스 상태 자가검사 결과</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        많은 항목을 꼼꼼히 읽어보고 답변해 주셔서 감사합니다.<br>
        미마님의 현재 상태는...<br>
        <span id="resultSpan"></span>입니다. 결과를 저장해 주시고 아래의 항목도 입력해 주세요.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="selfTestBtn" data-dismiss="modal">Save changes</button>
      </div>
    </div>
  </div>
</div>
    
    
</div>
<script> 

function sendit(){
 
    var j = 0;
    for(var i = 0; i < document.form1.q_1.length; i++) {
        if(document.form1.q_1[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("1번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_2.length; i++) {
        if(document.form1.q_2[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("2번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_3.length; i++) {
        if(document.form1.q_3[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("3번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_4.length; i++) {
        if(document.form1.q_4[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("4번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_5.length; i++) {
        if(document.form1.q_5[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("5번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_6.length; i++) {
        if(document.form1.q_6[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("6번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_7.length; i++) {
        if(document.form1.q_7[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("7번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_8.length; i++) {
        if(document.form1.q_8[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("8번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_9.length; i++) {
        if(document.form1.q_9[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("9번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_10.length; i++) {
        if(document.form1.q_10[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("10번 답변을 선택해주세요");
        return false;
    }
 
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_11.length; i++) {
        if(document.form1.q_11[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("11번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_12.length; i++) {
        if(document.form1.q_12[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("12번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_13.length; i++) {
        if(document.form1.q_13[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("13번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_14.length; i++) {
        if(document.form1.q_14[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("14번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_15.length; i++) {
        if(document.form1.q_15[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("15번 답변을 선택해주세요");
        return false;
    }
 

 
    var j = 0;
    for(var i = 0; i < document.form1.q_16.length; i++) {
        if(document.form1.q_16[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("16번 답변을 선택해주세요");
        return false;
    }
 
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_17.length; i++) {
        if(document.form1.q_17[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("17번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_18.length; i++) {
        if(document.form1.q_18[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("18번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_19.length; i++) {
        if(document.form1.q_19[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("19번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_20.length; i++) {
        if(document.form1.q_20[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("20번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_21.length; i++) {
        if(document.form1.q_21[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("21번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_22.length; i++) {
        if(document.form1.q_22[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("22번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_23.length; i++) {
        if(document.form1.q_23[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("23번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_24.length; i++) {
        if(document.form1.q_24[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("24번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_25.length; i++) {
        if(document.form1.q_25[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("25번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_26.length; i++) {
        if(document.form1.q_26[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("26번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_27.length; i++) {
        if(document.form1.q_27[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("27번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_28.length; i++) {
        if(document.form1.q_28[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("28번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_29.length; i++) {
        if(document.form1.q_29[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("29번 답변을 선택해주세요");
        return false;
    }
 
 
    var j = 0;
    for(var i = 0; i < document.form1.q_30.length; i++) {
        if(document.form1.q_30[i].checked == true) {
            j += 1;
        }
    }
    if(j == 0) {
        alert("30번 답변을 선택해주세요");
        return false;
    }
}
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";


/* 페이지온로드 */
$(function(){
	//버튼 누르면 자가스트레스 표 결과보기 -> 모달로>??? 
	let result = "";
	$('#calcResult').on('click', function(){
		//이거 답변안한거 잇음 하라고 알람듸우는거
		//sendit();
		var sum = 0;
		let inputs = [];
		
		inputs = $('#form1').find('input');
		
		for(let i=0; i < inputs.length;i++){
			if(inputs[i].checked == true){
				sum++;		
			}
		}
		if(sum >= 11){
			result="중증 스트레스 상태로 몸과 마음에 대한 종합검진을 받을 필요가 있다"
		}else if(sum>=5){
			result="가벼운 스트레스 상태"
		}else{
			result="정상"
		}
		console.log(result);
		$('#resultSpan').text(result);
		
	})		
			
			
	//멤버번호 하드코딩한거 나중에 고치기		
	//그리고 그 모달 결과값을 테이블에 저장하기
	$('#selfTestBtn').on('click', function(){
		alert("저장되었습니다. 나머지 항목을 입력하고 저장해 주세요");
		$.ajax({
			url : '../consultation/preSelfAx',
			method : "POST",
			dataType : "json",
			data : JSON.stringify({
				preSelfAx : result,
				memberNo: 2
			}),
			 beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
			contentType : 'application/json',
			success : function(data) {
				console.log(data);
			}// success end
		})
	})//그리고 그 모달 결과값을 테이블에 저장하기 끝
	
	// 두번째 폼 제출버튼 이벤트 -> 404 accessError
	$("#form2SubmitBtn").on('click', function(){
		alert("소중한 시간 감사해요 미마님. 진료 때 봽겠습니다.");
		$.ajax({
			url : '../consultation/preSelfInfo',
			method : "POST",
			dataType : "json",
			data : JSON.stringify({
				memberNo: 2,
				pastHx: "$('#pastSession').val()",
				sessionReason:"$('#reason').val()",
				preDiagnosis:"$('#pastDiagnosis').val()",
				currentMeds:"$('#currentMeds').val()",
				moreInfo : "$('#currentStatus').val()"
			}),
			 beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
			contentType : 'application/json',
			success : function(data) {
				console.log(data);
			}// success end
		})
		
	})
	
	
	
})//end of 페이지 온로드


</script>
