<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title> 매덩여행 </title>
	<link rel="stylesheet" type="text/css" href="/Project/resources/index.css">

   <link rel="stylesheet" type="text/css"  media="only screen and (max-width: 1200px)" href="/Project/resources/tab.css">

   <link rel="stylesheet" type="text/css"  media="only screen and (max-width: 670px)" href="/Project/resources/phone.css">
    
	<link rel='shortcut icon' href='/Project/resources/icon/send.png'>
	<script type="text/javascript" src="webjars/jquery/3.3.1/dist/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			/********매덩스픽************************************************/ 
			$.ajax({
			 	type: "post",
			 	url : "spl"
			 }).done(function(data){
				 var d = JSON.parse(data);
				 console.log(d);
				 var list = d.list;
				 var html = "";
				 for(var i = 0; i < list.length; i++) {
					 html += '<li class="l_list"> <div class="l_img"> <div class="container_img"> <img src="';
				 	 html += list[i].fileURL;
				 	 html += '"class="pick_img"><div class="middle_img"><div class="text_img">';
				 	 html += list[i]. boardTitle;
				 	 html += '</div></div></div></div><div class="l_r"><h1>';
				 	 html += list[i]. boardTitle;
				 	 html += '</h1><p>'
				 	 html += list[i]. boardContents;
				 	 html += '</p></div></li>'
					 
				 }
				 console.log(html);
				 $("#pick_ul").append(html);
			 });
			/********버튼***********************************************/ 
			$.ajax({
			 	type: "post",
			 	url : "ssb"
			 }).done(function(data){
				 var d = JSON.parse(data);
				 console.log(d);
				 var list = d.list;
				 var html1 = "";
				 var html2 ="";
				 for(var i = 0; i < list.length; i++) {
					 if(list[i].buttonYn == 'Y'){
						 html1 += "<li class='b_img'";
						 html1 += "style='background-image: url(";
						 html1 += list[i].fileURL;
						 html1 += ")'><div><p>";
						 html1 += list[i].fileName;
						 html1 += "</p></div></li>";
				 	}else if(list[i].slideYn == 'Y'){
				 		 html2 += "<div id='slide_div' style='background-image: url(";
				 		 html2 += list[i].fileURL;
				 		 html2 += ")'></div>";
				 		$("#s").append(html2);
				 	};
				 };
				 console.log(html1);
				 console.log(html2);
				 $("#button_ul").append(html1);
			 });
			/********유툽***********************************************/ 
			$.ajax({
			 	type: "post",
			 	url : "syl"
			 }).done(function(data){
				 var d = JSON.parse(data);
				 console.log(d);
				 var list = d.list;
				 
				 var html1 = "";
				 html1 += '<iframe src="';
				 html1 += list[0].vUrl;
				 html1 += '" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>';
				 $("#v_div1").append(html1);
			
				 var html2 = "";
				 for (var i = 1; i< list.length; i++){
					 	 html2 += '<li class="v_m_l"><iframe src="';
						 html2 += list[i].vUrl;
						 html2 +='" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>';
						 html2 +='<div class="v_m_r"><h1>';
						 html2 +=list[i].vTitle;
						 html2 +=         '</h1><p>';
						 html2 +=  list[i].vContents;
						 html2 +=        '</p><ul>';
						 html2 +=     '<li id = "tooltip" class="v_heart v_icon" onclick="likeButton('+list[i].vNum+')"><span class="tooltiptext">좋아요</span></li><li>';
						 html2 +=      list[i].likeNum;
						 html2 +=      '</li><li id = "tooltip" class="v_thumb v_icon" onclick="bestButton('+list[i].vNum+')"><span class="tooltiptext">최고예요</span></li><li>';
						 html2 +=      list[i].bestNum
						 html2 +=     '</li><li class="v_share v_icon"></li>';
						 html2 +=     '<li class="v_li_r">공유</li></ul></div></li>';
				 }
				 
				 $("#v_m ul").append(html2);
			 });
		 });
		function bestButton(vNum){
			$.ajax({
			 	type: "post",
			 	url : "bestB",
			 	data: {"vNum" : vNum}
			 }).done(function(data){
				 var d = JSON.parse(data)
				  alert(d.msg);
				  if(d.status == 1){
					location.href = "index";
				  }
			 });
		}
		function likeButton(vNum){
			$.ajax({
			 	type: "post",
			 	url : "likeB",
			 	data: {"vNum" : vNum}
			 }).done(function(data){
				 var d = JSON.parse(data)
				  alert(d.msg);
				  if(d.status == 1){
					location.href = "index";
				  }
			 });
		}
		
	</script>
	<style id="style">
	</style>
</head>

<body>
    <header>
        <div id="main_header">
            <div class=logo></div>
                <h1 onclick="location.href='index'">매덩여행</h1>
        </div>
    </header>
    <!--메뉴창-->
    <div class="menu_block">  
         <img id="menu_icon" src="/Project/resources/icon/ic_reorder_black_24px.svg"><br>
    <div class="menubar">
        <ul >
            <li><a href="index">HOME</a></li>
            <li><a href="#">유럽</a>
                <ul>
                    <div></div>
                     <li><a href="London" >런던</a></li>
                     <li><a href="Barcelona" >바르셀로나</a></li>
                     <li><a href="#">독일</a></li>
                </ul>
            </li>
            <li><a href="#">아시아</a>
             <ul>
                    <div></div>
                     <li><a href="#">일본</a></li>
                     <li><a href="#">중국</a></li>
                </ul>
            </li>
            <li><a href="#">아메리카</a>
             <ul>
                    <div></div>
                     <li><a href="#">미국</a></li>
                     <li><a href="#">캐나다</a></li>
                     <li><a href="#">멕시코</a></li>
                </ul>
            </li>
            <li><a href="#">아프리카</a>
             <ul>
                    <div></div>
                     <li><a href="#">남아공</a></li>
                     <li><a href="#">케냐</a></li>
                </ul>
            </li>
            <li><a href="#">오세아니아</a>
             <ul>
                     <div></div>
                     <li><a href="#">호주</a></li>
                     <li><a href="#">뉴질랜드</a></li>
                </ul>
            </li>
            
            <c:if test="${sessionScope.user.status == 1}" >
            <li id="menu_site"><a href="#">관리자 모드</a>
             <ul>
                    <div></div>
                     <li><a href="logout">${sessionScope.user.userName} 님 로그아웃</a></li>
                     <li><a href="admin">관리자 페이지</a></li>
                </ul>
            </li>
		    </c:if> 
            
            <li id="menu_site"><a href="#" >제휴사이트</a>
             <ul>
                    <div></div>
                     <li><a href="https://www.tripadvisor.co.kr/">Trip Advisor</a></li>
                     <li><a href="https://www.myrealtrip.com/">MyRealTrip</a></li>
                     <li><a href="https://magazine.dingo.tv/dingotravelkorea">Dingo Travel</a></li>
                </ul>
            </li>
            
            
        </ul>
    </div>
    </div>
      
    <div id="blank"></div>
    <div id="contents">
    
    <!--슬라이드-->
    <section id="s" >
<!-- 	        <div id="slide_div"></div> -->
    </section>
    
    
    <!--버튼눌러서 화면 넘기기-->
    <section id="b">
        <div>
            <input type="radio" name="radio" id="b_1" checked>
            <input type="radio" name="radio" id="b_2">
            <input type="radio" name="radio" id="b_3">
            <input type="radio" name="radio" id="b_4">
            <ul id="button_ul">
<!--                 <li class="b_img"><div><p></p></div></li> -->
<!--                 <li class="b_img"><div><p></p></div></li> -->
<!--                 <li class="b_img"><div><p></p></div></li> -->
<!--                 <li class="b_img"><div><p></p></div></li> -->
            </ul>
             <c:if test="${sessionScope.user.status == 1}" >
				<a href="list?u=ssb" style="text-align: right; font-size: 20px">슬라이드 수정</a>
			</c:if>
        </div>
    </section>
 
    
    <!--유투브 리스트-->
  
    <section id="v">
        <div id="v_div1">  
           <h1>매덩's youtube
            <c:if test="${sessionScope.user.status == 1}" >
				<a href="list?u=syl" style="text-align: right; font-size: 20px">수정</a>
			</c:if>
           
           </h1> <hr>
<!--             <iframe src="https://www.youtube.com/embed/vjj3opBmJ9w" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>  -->
        </div>
        
        <!--영상 리스트 -->
        <div id="v_div2" >
            
            <div id="v_icon">
                <div id="icon2">
                <img src="/Project/resources/icon/playlist_add.svg" id="i_p">
               </div>
            </div>
                      
             <div id="v_m">
                <ul>
<!--                     <li class="v_m_l"> -->
<!--                        <iframe src="https://www.youtube.com/embed/slnquW49Zwk" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe> -->
<!--                         <div class="v_m_r"> -->
<!--                             <h1>괌</h1> -->
<!--                             <p>괌에서 꼭 해야할 10가지</p> -->
<!--                             <ul> -->
<!--                                 <li id = "tooltip" class="v_heart v_icon"><span class="tooltiptext">최고예요</span></li> -->
<!--                                 <li>3,737</li> -->
<!--                                 <li id = "tooltip" class="v_thumb v_icon"><span class="tooltiptext">좋아요</span></li> -->
<!--                                 <li>40</li> -->
<!--                                 <li class="v_share v_icon"></li> -->
<!--                                 <li class="v_li_r">공유</li> -->
<!--                             </ul> -->
<!--                         </div> -->
<!--                     </li> -->
                    
<!--                     <li class="v_m_l"> -->
<!--                         <iframe src="https://www.youtube.com/embed/cl42CcXQB7E" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe> -->
<!--                         <div class="v_m_r"> -->
<!--                             <h1>이탈리아 남부</h1> -->
<!--                             <p>남부에서 꼭 해야할 10가지</p> -->
<!--                             <ul> -->
<!--                                 <li id = "tooltip" class="v_heart v_icon"><span class="tooltiptext">최고예요</span></li> -->
<!--                                 <li>4,500</li> -->
<!--                                 <li id = "tooltip" class="v_thumb v_icon"><span class="tooltiptext">좋아요</span></li> -->
<!--                                 <li>25</li> -->
<!--                                 <li class="v_share v_icon"></li> -->
<!--                                 <li class="v_li_r">공유</li> -->
<!--                             </ul> -->
<!--                         </div> -->
<!--                     </li> -->
<!--                     <li class="v_m_l"> -->
<!--                         <iframe src="https://www.youtube.com/embed/htrWV4GYNDI" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe> -->
<!--                         <div class="v_m_r"> -->
<!--                             <h1>그리스</h1> -->
<!--                             <p>그리스에서 해야할 10가지</p> -->
<!--                             <ul> -->
<!--                                <li id = "tooltip" class="v_heart v_icon"><span class="tooltiptext">최고예요</span></li> -->
<!--                                 <li>1,552</li> -->
<!--                                 <li id = "tooltip" class="v_thumb v_icon"><span class="tooltiptext">좋아요</span></li> -->
<!--                                 <li>30</li> -->
<!--                                 <li class="v_share v_icon"></li> -->
<!--                                 <li class="v_li_r">공유</li> -->
<!--                             </ul> -->
<!--                         </div> -->
<!--                     </li> -->
                    
<!--                     <li class="v_m_l"> -->
<!--                         <iframe src="https://www.youtube.com/embed/y1-qAvF0_Xc" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe> -->
<!--                         <div class="v_m_r"> -->
<!--                             <h1>바르셀로나</h1> -->
<!--                             <p>바르셀로나에서 해야할 15가지</p> -->
<!--                             <ul> -->
<!--                                <li id = "tooltip" class="v_heart v_icon"><span class="tooltiptext">최고예요</span></li> -->
<!--                                 <li>6,705</li> -->
<!--                                 <li id = "tooltip" class="v_thumb v_icon"><span class="tooltiptext">좋아요</span></li> -->
<!--                                 <li>240</li> -->
<!--                                 <li class="v_share v_icon"></li> -->
<!--                                 <li class="v_li_r">공유</li> -->
<!--                             </ul> -->
<!--                         </div> -->
<!--                     </li> -->
                    
                </ul>
            </div>
            </div>
    </section>
    
    
   <!--여행지 리스트-->
    <section id="l">
        <div id="l_div1">
            <h1>매덩's Picks 
            
            <c:if test="${sessionScope.user.status == 1}" >
				<a href="list?u=spl" style="text-align: right; font-size: 20px">수정</a>
			</c:if>
			
            </h1><hr>
        </div>
     
     <ul id="pick_ul">
    
<!--        <li class="l_list"> -->
<!--            <div class="l_img"> -->
<!--             <div class="container_img"> -->
<!--             <img src="" class="pick_img"> -->
<!--                 <div class="middle_img"> -->
<!--                     <div class="text_img"></div> -->
<!--                 </div> -->
<!--             </div> -->
<!--            </div>     -->
<!--            <div class="l_r"> -->
<!--               <h1 id="pick_title_1"></h1> -->
<!--               <p>아이슬란드에서는 9월부터 4월까지 매일 밤 오로라 관측 가능. -->
              
<!--             Tip : 미리 투어를 신청하자 -->

<!--               </p> -->
<!--            </div> -->
<!--         </li> -->
<!--            <li class="l_list">        -->
<!--                <div class="l_img"> -->
<!--                   <div class="container_img"> -->
<!--                    <img src="" class="pick_img"> -->
<!--                    <div class="middle_img"> -->
<!--                     <div class="text_img"></div> -->
<!--                 </div> -->
<!--                 </div> -->
<!--                 </div> -->
<!--                 <div class="l_r"> -->
<!--                   <h1></h1> -->
<!--                   <p>1889년 프랑스혁명 100돌 기념 '파리 만국박람회' 때 세워진  격자형 철탑 -->
                     
<!--                       Tip : 전망대 티켓은 미리 구입하자!             -->
<!--                   </p> -->
<!--                </div> -->
<!--            </li> -->
           

     
<!--         <li class="l_list">       -->
<!--             <div class="l_img"> -->
<!--                   <div class="container_img"> -->
<!--                <img src="" -->
<!--                class="pick_img"> -->
<!--                    <div class="middle_img"> -->
<!--                     <div class="text_img"></div> -->
<!--                 </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--             <div class="l_r"> -->
<!--               <h1></h1> -->
<!--               <p>푸른 동굴은 이탈리아 카프리 섬 해안에 있는 유명한 해식 동굴 -->
                             
<!--                Tip : 파도가 높으면 입장이 불가하여, 미리 날씨 확인하자 -->
<!--               </p> -->
<!--            </div> -->
<!--        </li> -->
    </ul>

    </section>  
    </div> 
    
    
    <!--탑버튼-->
    
    <div id="top_button">
        <a href="#"><img src="/Project/resources/icon/top_icon.png" width="70px"></a>
    </div>
    
     <!--푸터-->
    <footer>
        <div id= "comment" >
            <h4>
                전 세계 우리의 여행 사이트. 풍부한 정보.즐거운 여행   
            
             <div>
              
                <div id="face" class="co_icon"onclick="location.href='https://ko-kr.facebook.com/dingo.travel.kr/'" ></div>
                <div id="insta"   class="co_icon" onclick="location.href='https://www.instagram.com/dingo_travel/'"  ></div>
                <div id="twitt" class="co_icon"onclick="location.href='https://twitter.com/myrealtrip'"></div>
                <div id="whats" class="co_icon"></div>
                 <a style="float: left" href="admin">관리자모드</a>
            </div>
            </h4>
            
            <h5>copyrighter by 갱 and 쟌 and 굥은</h5>
        </div>
    </footer>

</body>
</html>
