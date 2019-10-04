<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>1501163 송탁근</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>" />
	<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery.cookie.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/dropzone.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/map.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/stringBuffer.js"/>"></script>
	<%-- <script type="text/javascript" src="<c:url value="/resources/js/main.js"/>"></script> --%>
</head>
<body>
<div class="WebWrap">
        <div class="Login">
            <div class="Navi">
            	<div class="NaviPadding">
            		<h2>자유게시판</h2>
            		<p>아이디
            		<input type="text" class="loginTxtID" size="10">
            		비밀번호
            		<input type="password" class="loginTxtPw"size="10"></p>
            		<div class="btnBox">
            		<button class="loginBtnLogin">로그인</button>
            		<button class="loginBtnJoin">회원가입</button>
            		</div>
            	</div>
            </div>
            <div class="HeightPadding"></div>
            <div class="Items"></div>
            <div class="Paging"></div>
            
            
        </div>
        <div class="Join">
            <h2>자유게시판</h2>
            <br>
            <h3>회원가입</h3>
            <p>아이디</p>
            <input type="text" class="joinTxtID" maxlength="50">
            <p>비밀번호</p>
            <input type="password" class="joinTxtPw" maxlength="50">
            <p>비밀번호 재입력</p>
            <input type="password" class="joinTxtPwc" maxlength="50">
            <br>
            <br>
            <button class="joinBtnJoin">가입하기</button>
            <button class="joinBtnCancel">가입취소</button>
        </div>
        <div class="Main">
            <div class="Navi">
                <div class="NaviPadding">
                    <h2>자유게시판</h2>
                    <p>안녕하세요, <b>사용자</b>님.</p>
                    <button class="mainBtnWrite BtnBlue">글쓰기</button>
                    <button class="mainBtnLogout BtnRed">로그아웃</button>
                </div>
            </div>
            <div class="HeightPadding"></div>
            <div class="Items">
                <div class="Item">
                    <div class="ItemText">
                        <h4>글 제목</h4>
                        <h6>작성시간 : 2014-11-19 (1:25)</h6>
                        <p>하위 하위 글 내용이 길면 어떻게 표시될까 궁금해서 적어봅니다.</p>
                        <div class="ItemButtons">
                            <button class="mainBtnDel BtnRed">삭제하기</button>
                        </div>
                    </div>
                    <div class="Comment">
                            
                            <div class="Comments">
                                
                            </div>
                        </div>
                </div>
            </div>
            <div class="Paging"></div>
            <div class="Content">
            	<div class="post_title">글 제목 들어갈 부분</div>
           		<div class="post_date">작성일과 수정일</div>
           		<div class="post_cont">글 내용</div>
           		<div class="file_cont">파일 내용</div>
           		<div class="Comments">
           			<div class="CommentItem">
						<h4>사용자1</h4>
						<p>댓글입니다.</p>
						<button class="BtnRed">학제</button>
					</div>
					<div class="CommentItem">
					<h4>사용자2</h4>
					<p>댓글입니다.</p>
					<button class="BtnRed">학제</button>
					</div>
					<input type="text" class="itemTxtComment" placeholder="댓글입력..">
					<button class="BtnBlue">댓글 달기</button>
				</div>
            </div>
        </div>
        <div class="Write">
            <div class="Navi">
                <div class="NaviPadding">
                <h2>자유게시판</h2>
                <p>안녕하세요, <b>사용자</b>님.</p>
                <button class="mainBtnWrite BtnBlue">글쓰기</button>
                <button class="mainBtnWrite BtnRed">로그아웃</button>
                </div>
            </div>
            <div class="HeightPadding"></div>
            <div class="WriteItem">
            	<p>제목</p>
            	<input type="text" class="writeTextSubject" placeholder="제목을 입력하세요" maxlength="50">
            	<p>내용</p>
            	<textarea class="writeTextContent" placeholder="내용을 입력하세요"></textarea>
            	<div class="outerDropZone">
            		<br/>
            		<div id="dZUpload" class="dropzone"></div>
            	</div>
            	<div class="ItemButtons">
                	<button class="writeBtnWrite BtnBlue">작성하기</button>
                	<button class="writeBtnCancel BtnRed">작성취소</button>
            	</div>
            </div>
        </div>
    </div>
    <script>
    function list(page) {
    	$('.Items').empty();
    	$('.Paging').empty();
        $.ajax({
            type:"post",
            url:'/stk/load?curPage='+page,
            /* data : JSON.stringify({curPage : page, keyword : ''}), */
            contentType: "application/json; charset=UTF-8",
            success:function(data) {
            	console.log(data);
            	//var data=JSON.parse(strdata);
                //alert(data.result);
                if(data.result=="success"){
                    var cnt = data.postlist.length;
                    for(var i=0; i<cnt;i++) {
                        var id=data.postlist[i].POST_ID;
                        var subject=data.postlist[i].POST_TITLE;
                        var content=data.postlist[i].POST_CONT;
                        var writer=data.postlist[i].POST_USERID;
                        var writedate=data.postlist[i].POST_REGDATE;
                        var moddate = data.postlist[i].POST_MODDATE;
                        var item=$('<div></div>').attr('data-id',id).addClass('Item');
                        var itemText=$('<div></div').addClass('ItemText').attr('writer',writer).appendTo(item);
                        $('<h4></h4>').text(subject).appendTo(itemText);
                        $('<h6></h6>').text('작성시간 : ' + writedate).appendTo(itemText);
                        item.appendTo($('.Items'));
                        //loadComment(id);
                    }
                    var pagingParent = $('.Paging');
                    var toFirst = $('<a></a>').addClass('page-link').attr('href',"javascript:list('1')").html('<span>&lt;&lt;</span>');
                    toFirst.appendTo(pagingParent);
                    
                    for(var i=0; i<data.postPager.blockEnd;i++) {
                    	var toPage = $('<a></a>').addClass('page-link').attr('href',"javascript:list('"+(i+1)+"')").html('<span>'+(i+1)+'</span>');
                    	toPage.appendTo(pagingParent);
                    	console.log('====');
                    }
                    var toLast = $('<a></a>').addClass('page-link').attr('href',"javascript:list('"+data.postPager.nextPage+"')").html('<span>&gt;&gt;</span>');
                    toLast.appendTo(pagingParent);
                }else {
                    alert("오류발생");
                    $('.Main').hide();
                    $('.Login').show();
                }
            },
            error:function(err) {
               console.log(err);
                alert('ajax 오류발생');
                $('.Main').hide();
                $('.Login').show();
            }
        });
    }
    $(function() {
        //처음화면은 로그인화면
        var isLogin =$.cookie('curuser');
        
        console.log(isLogin);
        
        var loadPostsNot = function() {
            $('.Items').empty();
            $('.Paging').empty();
            $.ajax({
                type:"post",
                url:'/stk/load',
                contentType: "application/json; charset=UTF-8",
                success:function(data) {
                	console.log(data);
                	//var data=JSON.parse(strdata);
                    //alert(data.result);
                    if(data.result=="success"){
                        var cnt = data.postlist.length;
                        for(var i=0; i<cnt;i++) {
                            var id=data.postlist[i].POST_ID;
                            var subject=data.postlist[i].POST_TITLE;
                            var content=data.postlist[i].POST_CONT;
                            var writer=data.postlist[i].POST_USERID;
                            var writedate=data.postlist[i].POST_REGDATE;
                            var moddate = data.postlist[i].POST_MODDATE;
                            var item=$('<div></div>').attr('data-id',id).addClass('Item');
                            var itemText=$('<div></div').addClass('ItemText').attr('writer',writer).appendTo(item);
                            $('<h4></h4>').text(subject).appendTo(itemText);
                            $('<h6></h6>').text('작성시간 : ' + writedate).appendTo(itemText);
                            item.appendTo($('.Items'));
                            //loadComment(id);
                        }
                        var pagingParent = $('.Paging');
                        var toFirst = $('<a></a>').addClass('page-link').attr('href',"javascript:list('1')").html('<span>&lt;&lt;</span>');
                        toFirst.appendTo(pagingParent);
                        
                        for(var i=0; i<data.postPager.blockEnd;i++) {
                        	var toPage = $('<a></a>').addClass('page-link').attr('href',"javascript:list('"+(i+1)+"')").html('<span>'+(i+1)+'</span>');
                        	toPage.appendTo(pagingParent);
                        }
                        var toLast = $('<a></a>').addClass('page-link').attr('href',"javascript:list('"+data.postPager.nextPage+"')").html('<span>&gt;&gt;</span>');
                        toLast.appendTo(pagingParent);
                    }else {
                        alert("오류발생");
                        $('.Main').hide();
                        $('.Login').show();
                    }
                },
                error:function(err) {
                   console.log(err);
                    alert('ajax 오류발생');
                    $('.Main').hide();
                    $('.Login').show();
                }
            });
        };
        //쿠키정보 확인
        if(isLogin==''||isLogin==null) {
        	$('.Login').show();
			$('.Login  .Items').on('click','.Item',function() {
				alert("로그인하셔야 글을 확인하실 수 있습니다.");
			});
			loadPostsNot();
		}else {
			console.log("---------");
			console.log(isLogin);
			$.ajax({
                type:"post",
                url:"/stk/logined",
                data:JSON.stringify({ member_id:isLogin}),
                contentType: "application/json; charset=UTF-8",
                success:function(strdata) {
                	console.log(strdata);
                	var data = JSON.parse(strdata);
                    if(data.result=="success") {
                        $('.Login').hide();
                        $('.Main').show();
                        $('.NaviPadding > p').html('안녕하세요, <b>' +$.cookie('curuser') +'</b>님');
                        currentUser =$.cookie('curuser');
                        console.log('로그인 성공');
                        loadPostsNot();
                    }
                    else if (data.result=="wrong") {
                        alert('잘못된 비번이나 아디');
                    }
                    else {
                        alert('오류발생');
                    }
                    isLogin=false;
                },error:function() {
                    alert('ajax오류발생');
                    isLogin=false;
                }
            });
		}
       
        //로그인화면에서 로그인하기
        $('.loginBtnJoin').click(function() {
            $('.Login').hide();
            $('.Join').show();
        });
        var currentUser = null;
        var isLogin=false;
        $('.loginBtnLogin').click(function() {
            if(isLogin) return false;
            var id=$('.loginTxtID').val();
            var pw=$('.loginTxtPw').val();
            if(!id){        alert("아이디X"); return false;}
            else if(!pw){   alert("비번X"); return false;}
            isLogin = true;
            //alert(JSON.stringify({ member_id:id,member_pw:pw}));
            $.ajax({
                type:"post",
                url:"/stk/login",
                data:JSON.stringify({ member_id:id,member_pw:pw}),
                contentType: "application/json; charset=UTF-8",
                success:function(strdata) {
                	console.log(strdata);
                	var data = JSON.parse(strdata);
                    if(data.result=="success") {
                        alert('로그인 성공');
                        $('.Login').hide();
                        $('.Main').show();
                        $('.NaviPadding > p').html('안녕하세요, <b>' +id +'</b>님');
                        currentUser =id;
                        console.log('로그인 성공');
                        loadPostsNot();
                    }
                    else if (data.result=="wrong") {
                        alert('잘못된 비번이나 아디');
                    }
                    else {
                        alert('오류발생');
                    }
                    isLogin=false;
                },error:function() {
                    alert('ajax오류발생');
                    isLogin=false;
                }
            });
        });

        //회원가입에서 가입취소버튼 만들기
        $('.joinBtnCancel').click(function() {
            if(window.confirm('가입 취소?')){
                $('.Join').hide();
                $('.Login').show();
            }
        });

        //회원가입에서 회원가입하기
        var isJoin=false;
        $('.joinBtnJoin').click(function() {
            if(isJoin) return false;
            var id=$('.joinTxtID').val();
            var pw=$('.joinTxtPw').val();
            var pwc= $('.joinTxtPwc').val();

            if(!id) {
                alert('아이디!');
                return false;
            } else if(!pw) {
                alert('비번!');
                return false;
            } else if(!pwc) {
                alert('비번확인!');
                return false;
            } else if(pw != pwc) {
                alert('비밀번호 일치X!');
                return false;
            }
            isJoin=true;
            $.ajax({
                type:"post",
                url:"/stk/join",
                data: JSON.stringify({
                    member_id:id,
                    member_pw:pw
                }),
                contentType: "application/json; charset=UTF-8",
                success:function(strdata) {
                	var data = JSON.parse(strdata);
                    if(data.result=="success") {
                        alert("회원가입 완료! 메인으로 감니다");
                        $('.Join').hide();
                        $('.Login').show();
                    }else if(data.result=="fail"){
                        alert('이미 존재하는 아이디입니다.');
                    } else {
                    	alert('오류가 발생했습니다.');
                    }
                    isJoin=false;
                },error:function(err) {
                    alert('ajax 연결에 문제');
                    console.log(err);
                    isJoin=false;
                }
            });
        });

        //메인에서 글쓰기 버튼
        $('.mainBtnWrite').click(function() {
            $('.Main').hide();
            $('.Write').show();
            $('.writeTxtSubject').val("");
            $('.writeTxtContent').val("");
        });

        //메인에서 로그아웃버튼
        $('.mainBtnLogout').click(function() {
            if(confirm('로그아웃?')) {
            	$.removeCookie('curuser',{ path: '/' });
            	location.reload();
            }
        });

        //게시글 작성하기에서 게시글 작성하기(DB에 등록)
        var isPost=false;
        $('.writeBtnWrite').click(function() {
            if(isPost) return false;
            var subject=$('.writeTextSubject').val();
            var content=$('.writeTextContent').val();
            if(!subject) {
                alert("제목입력!");
                return false;
            } else if(!content) {
                alert("내용입력!");
                return false;
            }
            if(confirm("작성?")) {
                isPost=true;
                $.ajax({
                    type:"post",
                    url:"/stk/post",
                    data: JSON.stringify({
                        post_title:subject,
                        post_cont : content,
                        post_userid: currentUser
                    }),
                    contentType: "application/json; charset=UTF-8",
                    success:function(strdata) {
                    	var data = JSON.parse(strdata);
                        if(data.result=="success") {
                            $('.Write').hide();
                            $('.Main').show();
                            loadPosts();
                        }else { alert("오류발생");}
                        isPost=false;
                    },
                    error:function(err) {
                        alert("ajax 연결문제");
                        console.log(err);
                        isPost=false;
                    }
                });
            }

        });

        //게시글 작성창에서 작성취소 하기
        $('.writeBtnCancel').click(function() {
            if(confirm("작성취소?")) {
                $('.Write').hide();
                $('.Main').show();
                loadPostsNot();
            }
        });

        //모든 게시글을 불러와주는 메소드
        var loadPosts = function() {
            $('.Items').empty();
            $.ajax({
                type:"post",
                url:'/stk/load',
                contentType: "application/json; charset=UTF-8",
                success:function(data) {
                	console.log(data);
                	//var data=JSON.parse(strdata);
                    //alert(data.result);
                    if(data.result=="success"){
                        var cnt = data.postlist.length;
                        for(var i=0; i<cnt;i++) {
                            var id=data.postlist[i].POST_ID;
                            var subject=data.postlist[i].POST_TITLE;
                            var content=data.postlist[i].POST_CONT;
                            var writer=data.postlist[i].POST_USERID;
                            var writedate=data.postlist[i].POST_REGDATE;
                            var moddate = data.postlist[i].POST_MODDATE;
                            var item=$('<div></div>').attr('data-id',id).addClass('Item');
                            var itemText=$('<div></div').addClass('ItemText').attr('writer',writer).appendTo(item);
                            $('<h4></h4>').text(subject).appendTo(itemText);
                            $('<h6></h6>').text('작성시간 : ' + writedate).appendTo(itemText);
                            $('<p></p>').text(content).appendTo(itemText);
                            if(writer==currentUser){
                                var itemButtons=$('<div></div>').addClass('ItemButtons').appendTo(itemText);
                                $('<button></button>').addClass('mainBtnDel BtnRed').text('삭제하기').appendTo(itemButtons);
                            }
                            var comment = $('<div></div>').addClass('Comment').appendTo(item);
                            $('<input />').attr({type:'text',placeholder:'댓글입력..'}).addClass('itemTxtComment').appendTo(comment);
                            $('<button></button>').addClass('commentBtnWrite BtnBlue').text('댓글달기').appendTo(comment);
        
                            $('<div></div>').addClass('Comments').appendTo(comment);
                            item.appendTo($('.Items'));
                            //loadComment(id);
                        }
                    }else {
                        alert("오류발생");
                        $('.Main').hide();
                        $('.Login').show();
                    }
                },
                error:function(err) {
                    alert(err);
                    alert('ajax 오류발생');
                    $('.Main').hide();
                    $('.Login').show();
                }
            });
        };
        
		$('.Main').on('click','.Item',function() {
			$('.Content').empty();
			var parent_node = $('.Content');
			var post_id = $(this).attr('data-id');
			console.log(post_id);
			$.ajax({
				type:"post",
                url:"/stk/postDetail",
                data: JSON.stringify({ post_id:post_id	}),
                contentType: "application/json; charset=UTF-8",
                success:function(data) {
                	if(data.result=="success") {
                		var post_title = $('<div></div>').addClass('post_title');
                		$('<div></div>').addClass('post_title_part').text(data.post_title).appendTo(post_title);
                		if(data.post_userid == currentUser) {
                			var title_btn=$('<div></div>').addClass('post_title_btn');
                			$('<button></button>').addClass('BtnRed toRight').text('글 삭제하기').appendTo(title_btn);
                			title_btn.appendTo(post_title);
                		}
                		post_title.appendTo(parent_node);
                		var post_date = $('<div></div>').addClass('post_date').text('작성일  :  '+ data.post_regdate+'  수정일 : '+data.post_moddate).appendTo(parent_node);
                		var post_cont = $('<div></div>').addClass('post_cont').text(data.post_cont).appendTo(parent_node);
                		var file_cont = $('<div></div>').addClass('file_cont').text('파일 드갈곳').appendTo(parent_node);
                		var comments = $('<div></div>').addClass('Comments');
                		for(var i=0; i< data.reply.length;i++) {
                			var commentItem = $('<div></div>').addClass('CommentItem');
                    		var reply_user = $('<h4></h4>').text(data.reply[i].POST_USERID + '  ||  		' + data.reply[i].POST_REGDATE).appendTo(commentItem);
                    		var reply_cont = $('<p></p>').text(data.reply[i].POST_CONT).appendTo(commentItem);
                    		commentItem.appendTo(comments);	
                		}
                		$('<input>').attr('type','text').attr('placeholder','댓글을 입력해주세요').addClass('itemTxtComment').appendTo(comments);
                		$('<button></button>').addClass('BtnBlue').text('댓글 달기').appendTo(comments);
                		comments.appendTo(parent_node);
                		console.log('success loading post detail');	
                	}
                	else {
                		console.log("error loading post detail");
                	}
                },
                error:function(err) {
                    alert("ajax 연결문제");
                    console.log(err);
                }
				
			});
		});
        //동적으로 생성된 게시글의 댓글적기버튼에 이벤트를 달아주기
        var isComment = false;
        $(document.body).on('click','.commentBtnWrite',function() {
            if(isComment) return false;
            var parentId=$(this).parent().parent().attr('data-id');
            var content=$(this).prev().val();
            var comments=$(this).next();
            console.log(parentId +"");
            console.log(content);
            console.log(comments);
            if(!content){ alert("댓글!"); return false;}
            isComment=true;
            $.ajax({
                type:"post",
                url:"/stk/commentPost",
                data:JSON.stringify({
                    parentId:parentId,
                    content:content,
                    writer:currentUser
                }),
                contentType: "application/json; charset=UTF-8",
                success: function(strdata) {
                	var data = JSON.parse(strdata);
                    if(data.result=="success"){
                        var lid=data.lastId;
                        var commentItem = $('<div></div>').addClass('CommentItem').attr('data-id',lid);
                        $('<h4></h4>').text(currentUser).appendTo(commentItem);
                        $('<p></p>').text(content).appendTo(commentItem);
                        $('<button></button>').addClass('BtnRed commentBtnDel').text('삭제').appendTo(commentItem);
                        commentItem.appendTo(comments);
                    }else{ alert('오류발생');    }
                    isComment=false;
                },error:function() {
                    alert('ajax 연결문제');
                    isComment=false;
                }
            });
        });


        //각 게시글의 댓글 불러오는 메소드
        var loadComment=function(postId){
            if(!postId) return false;
            var target= $('div.Item[data-id='+postId+'] .Comments');
            $.ajax({
                type:"post",
                url:"/stk/commentLoad",
                data:JSON.stringify({
                    postId:postId
                }),
                contentType: "application/json; charset=UTF-8",
                success:function(strdata) {
                	var data = JSON.parse(strdata);
                    if(data.result=="success"){
                        var cnt=data.data.length;
                        for(var i=0;i<cnt;i++) {
                            var id=data.data[i].cno;
                            var content=data.data[i].ccontent;
                            var writer=data.data[i].cwriter;
                            var commentItem = $('<div></div>').addClass('CommentItem').attr('data-id',id);
                            $('<h4></h4>').text(writer).appendTo(commentItem);
                            $('<p></p>').text(content).appendTo(commentItem);
                            if($('body > div > div.Main > div.Navi > div > p > b').text()==writer) {
                                $('<button></button>').addClass('AppBtnRed commentBtnDel').text('삭제').appendTo(commentItem);
                            }
                            commentItem.appendTo(target);
                        }   
                    }else{ alert('오류발생');    }
                },error:function() {
                    alert('ajax 연결문제');
                }
            });
        };

        //동적으로 생성된 게시글의 댓글 삭제하기 버튼에 이벤트 달아주기
        $(document.body).on('click','.commentBtnDel',function() {
            if(confirm('삭제?')) {
                var id=$(this).parent().attr('data-id');
                var removeTarget=$(this).parent();
                $.ajax({
                    type:"post",
                    url:"/stk/commentDel",
                    data:JSON.stringify({
                        postId:id
                    }),
                    contentType: "application/json; charset=UTF-8",
                    success:function(strdata) {
                    	var data = JSON.parse(strdata);
                        if(data.result=="success") {
                            removeTarget.remove();
                        }else{ alert("오류발생"); }
                    },
                    error:function() {
                        alert("ajax오류 발생");
                    }
                });
            }
        });

        //동적으로 생성된 게시글의 삭제하기 버튼에 이벤트 달아주기
        $(document.body).on('click','.mainBtnDel',function() {
            if(confirm('삭제?')) {
                var id=$(this).parent().parent().parent().attr('data-id');
                var removeTarget = $(this).parent().parent().parent();
                $.ajax({
                    type:"post",
                    url:"/stk/Del",
                    data:JSON.stringify({
                        postId:id
                    }),
                    contentType: "application/json; charset=UTF-8",
                    success:function(strdata) {
                    	var data = JSON.parse(strdata);
                        if(data.result=='success') {
                            removeTarget.remove();
                        }else{ alert("오류발생");}
                    }, error:function() {
                        alert('ajax 통신문제');
                    }
                });
            }
        });
        //$('.Main').show(); 
        //$('.Write').show();
    });
    </script>
</body>
</html>
