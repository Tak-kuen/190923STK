<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>1501163 송탁근</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>" />
	<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.js"/>"></script>
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
            		<button class="loginBtnLogin btn btn-outline-primary">로그인</button>
            		<button class="loginBtnJoin btn btn-outline-info">회원가입</button>
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
            <br>
            <p>아이디</p>
            <input type="text" class="joinTxtID" maxlength="50">
            <p>비밀번호</p>
            <input type="password" class="joinTxtPw" maxlength="50">
            <p>비밀번호 재입력</p>
            <input type="password" class="joinTxtPwc" maxlength="50">
            <br>
            <br>
            <button class="joinBtnJoin btn btn-outline-primary">가입하기</button>
            <button class="joinBtnCancel btn btn-outline-danger">가입취소</button>
        </div>
        <div class="Main">
            <div class="Navi">
                <div class="NaviPadding">
                    <h2>자유게시판</h2>
                    <p>안녕하세요, <b>사용자</b>님.</p>
                    <button class="mainBtnWrite btn btn-outline-primary">글쓰기</button>
                    <button class="mainBtnLogout btn btn-outline-danger">로그아웃</button>
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
                            <button class="mainBtnDel btn btn-outline-danger">삭제하기</button>
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
            	<!-- <div class="post_title">글 제목 들어갈 부분</div>
           		<div class="post_date">작성일과 수정일</div>
           		<div class="post_cont">글 내용</div>
           		<div class="file_cont">파일 내용</div>
           		<div class="Comments">
           			<div class="CommentItem">
						<h4>사용자1</h4>
						<p>댓글입니다.</p>
						<button class="BtnRed">삭제</button>
					</div>
					<div class="CommentItem">
					<h4>사용자2</h4>
					<p>댓글입니다.</p>
					<button class="BtnRed">삭제</button>
					</div>
					<input type="text" class="itemTxtComment" placeholder="댓글입력..">
					<button class="BtnBlue">댓글 달기</button>
				</div> -->
            </div>
        </div>
        <div class="Write">
            <div class="Navi">
                <div class="NaviPadding">
                <h2>자유게시판</h2>
                <p>안녕하세요, <b>사용자</b>님.</p>
                <button class="mainBtnWrite btn btn-outline-primary">글쓰기</button>
                <button class="mainBtnWrite btn btn-outline-danger">로그아웃</button>
                </div>
            </div>
            <div class="HeightPadding"></div>
            <div class="WriteItem">
            	<p>제목</p>
            	<input type="text" class="writeTextSubject" placeholder="제목을 입력하세요" maxlength="50">
            	<p>내용</p>
            	<textarea class="writeTextContent" placeholder="내용을 입력하세요"></textarea>
            	<p>파일 업로드하기</p>
            	<div class="dragDropDiv fileUpload">
					<table class='fileTable'>
						<tr>
						<td class='tabFileName'>파일명</td>
						<td class='tabFileSize'>사이즈</td>
						<td class='tabFileDel'>삭제 </td>
						</tr>
					</table>
				</div>
            	<div class="ItemButtons">
            		<button onclick="submitFile()" class="btn btn-outline-primary">작성하기</button>
					<button class="writeBtnCancel btn btn-outline-danger">작성취소</button>
            	</div>
            </div>
        </div>
    </div>
    <script>
    var fd = new FormData();
    var map = new Map();
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
                        var visit=data.postlist[i].POST_VISIT;
                        var moddate = data.postlist[i].POST_MODDATE;
                        var item=$('<div></div>').attr('data-id',id).addClass('Item');
                        //$('<img>').attr('src','경로').addClass('클래스 추가할때 이름');
                        var itemText=$('<div></div').addClass('ItemText').attr('writer',writer).appendTo(item);
                        $('<h4></h4>').text(subject).appendTo(itemText);
                        $('<h6></h6>').html('조회수 : ' +visit+ ' &nbsp;&nbsp;작성시간 : ' + writedate).appendTo(itemText);
                        item.appendTo($('.Items'));
                        //loadComment(id);
                    }
                    var pagingParent = $('.Paging');
                    var toFirst = $('<a></a>').addClass('btn btn-link').attr('href',"javascript:list('1')").html('<span>&lt;&lt;</span>');
                    toFirst.appendTo(pagingParent);
                    
                    console.log(data.postPager.blockEnd);
                    for(var i=0; i<data.postPager.blockEnd;i++) {
                    	var toPage = $('<a></a>').addClass('btn btn-link').attr('href',"javascript:list('"+(i+1)+"')").html('<span>'+(i+1)+'</span>');
                    	toPage.appendTo(pagingParent);
                    }
                    var toLast = $('<a></a>').addClass('btn btn-link').attr('href',"javascript:list('"+data.postPager.nextPage+"')").html('<span>&gt;&gt;</span>');
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
    function postDetail(post_id) {
		$('.Content').empty();
		var parent_node = $('.Content');
		console.log(post_id);
		$.ajax({
			type:"post",
            url:"/stk/postDetail",
            data: JSON.stringify({ post_id:post_id	}),
            contentType: "application/json; charset=UTF-8",
            success:function(data) {
            	if(data.result=="success") {
            		var post_title = $('<div></div>').addClass('post_title').attr('id',post_id);
            		$('<div></div>').addClass('post_title_part').text(data.post_title).appendTo(post_title);
            		if(data.post_userid == $.cookie('curuser')) {
            			var title_btn=$('<div></div>').addClass('post_title_btn');
            			$('<button></button>').addClass('btn btn-outline-danger toRight PostDelete').text('글 삭제하기').appendTo(post_title);
            			$('<button></button>').addClass('btn btn-outline-primary toRight PostUpdate').text('글 수정하기').appendTo(post_title);
            			//title_btn.appendTo($('.post_title_part'));
            		}
            		post_title.appendTo(parent_node);
            		var post_date = $('<div></div>').addClass('post_date').html('조회수 : ' + data.post_visit + '&nbsp;&nbsp;&nbsp;작성일  :  '+ data.post_regdate+'  수정일 : '+data.post_moddate).appendTo(parent_node);
            		var post_cont = $('<div></div>').addClass('post_cont').text(data.post_cont).appendTo(parent_node);
            		var file_cont = $('<div></div>').addClass('file_cont').text('첨부파일');
            		console.log(data.files);
            		for(var i=0; i<data.files.length;i++) {
            			var fileItem = $('<div></div>').addClass('FileItems');
            			$('<a></a>').attr("href",'/stk/fileDownload.do?saveName='+data.files[i].FILE_PATH+'&oldName='+data.files[i].FILE_ORIGIN).text(data.files[i].FILE_ORIGIN).addClass('FileItem').attr('file_id',data.files[i].FILE_ID).appendTo(fileItem);
            			fileItem.appendTo(file_cont);
            		}
            		file_cont.appendTo(parent_node)
            		var comments = $('<div></div>').addClass('Comments');
            		for(var i=0; i< data.reply.length;i++) {
            			var commentItem = $('<div></div>').addClass('CommentItem');
            			var user_txt = data.reply[i].POST_USERID + '  ||  		' + data.reply[i].POST_REGDATE;
            			if(data.post_userid == $.cookie('curuser')) {
            				user_txt = '(작성자)'+user_txt;
            			}
                		var reply_user = $('<h4></h4>').text(user_txt).appendTo(commentItem);
                		var reply_cont = $('<p></p>').text(data.reply[i].POST_CONT).appendTo(commentItem);
                		commentItem.appendTo(comments);	
            		}
            		$('<input>').attr('type','text').attr('placeholder','댓글을 입력해주세요').addClass('itemTxtComment').appendTo(comments);
            		$('<button></button>').addClass('btn btn-outline-primary addReply').text('댓글 달기').appendTo(comments);
            		comments.appendTo(parent_node);
            		
            		console.log('success loading post detail');	
            		isPostUpdate=false;
            		checkVisit(post_id);
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
	};
	function checkVisit(post_id) {
		if($.cookie('curuser')) {
		//로그인 우선 확인
			var userid = $.cookie('curuser');
			if($.cookie(post_id+'_'+userid) =="yes") {
			//이미 등록된 쿠키 있는지 확인
			}else {
				$.cookie(post_id+'_' +$.cookie('curuser'),"yes",{ expires: 30 });
				$.ajax({
					type:"post",
					url:"/stk/visitCheck",
					data:JSON.stringify({post_id : post_id}),
					contentType: "application/json; charset=UTF-8",
					success:function(strdata) {
						console.log(strdata);
						var data=JSON.parse(strdata);
						console.log(data);
						if(data.result =="success") {
							console.log(data.post_visit);
						}else {
							console.log('컨트롤러 에러');
						}
					},error:function(err) {
						console.log(err);
					}
				});
			}
		}
		
	}
	function resetFileForm() {
		for(var key in fd.keys()) {
			fd.delete(key);
		}
		map.clear();
		var trs =$('.dragDropDiv').find('.tabFileName').parent('tr').not(':first').remove();
	}
	
	var isPost=false;
    function submitFile(post_id,isPostUpdate) {
		if(isPost) return false;
		var subject;
		var content;
    	if(post_id ==''|| post_id ==null) {
			subject=$('.writeTextSubject').val();
			content=$('.writeTextContent').val();
            if(!subject) {
                alert("제목입력!");
                return false;
            } else if(!content) {
                alert("내용입력!");
                return false;
            }
            if(confirm("작성?")) {
            	isPost=true;
    			fd.append('post_title',subject);
    			fd.append('post_cont',content);
    			fd.append('post_userid',$.cookie('curuser'));
    			fd.append('is_update','n');
    			sendFileToServer();
    			resetFileForm();
    			$('.writeTextSubject').val("")
    			$('.writeTextContent').val("");
            }
    	}else {
    		console.log('submitFile로 제대로 왔다');
    		fd.append('post_id',post_id);
    		subject = $('.update_title').val();
    		console.log(subject);
			content = $('.update_cont').val();
    		if(!subject) {
                alert("제목입력!");
                return false;
            } else if(!content) {
                alert("내용입력!");
                
                return false;
            }
			fd.append('post_title',subject);
			fd.append('post_cont',content);
			fd.append('post_userid',post_id);
			fd.append('is_update','y');
			sendFileToServer();
			console.log(subject + "|||||||||||" + content);
			alert('ㅇㅇ');
			postDetail(post_id);
    	}
        
    	
    }
	var sendFileToServer = function() {
		console.log(fd);
		$.ajax({
			type:"post",
			url:"/stk/fileUpload.do",
			data:fd,
			contentType:false,
			processData:false,
			cache : false,
			success:function(data) {
				console.log(data);
				if(data.result =="success") {
					console.log('업로드 성공');
					$('.Write').hide();
                    $('.Main').show();
                    loadPostsNot();
                    resetFileForm();
				}else {
					console.log('컨트롤러 에러');
				}
				isPost=false;
			},error:function(err) {
				console.log(err);
				isPost=false;
			}
		});
	}
	function handleFileUpload(files) {
		console.log(files);
		var megaByte = 1024*1024;
		for(var i=0 ; i<files.length;i++) {
			if(map.containsValue(files[i].name)==false && (files[i].size/megaByte)<=20) {
				fd.append(files[i].name,files[i]);
				map.put(files[i].name,files[i].name);
				var tag = createFile(files[i].name,files[i].size);
				$('.fileTable').append(tag);
			}else {
				if((files[i].size/megaByte)>20) {
					alert("20메가 바이트를 초과해 업로드 할 수 없습니다!");
				}else {
					alert('중복파일 업로드 입니다.');
				}
			}
		}
	}
	function createFile(fileName,fileSize) {
		var file = {
			name : fileName,
			size : fileSize,
			format : function() {
				var sizeKB = this.size / 1024;
					if (parseInt(sizeKB) > 1024) {
						var sizeMB = sizeKB / 1024;
						this.size = sizeMB.toFixed(2) + " MB";
					} else {
						this.size = sizeKB.toFixed(2) + " KB";
					}
					if(name.length > 70){
					this.name = this.name.substr(0,68)+"...";
					}
					return this;
			},
			tag : function() {
				var tag = new StringBuffer();
				tag.append('<tr>');
				tag.append('<td class="tabFileName">'+this.name+'</td>');
				tag.append('<td class="tabFileSize">'+this.size+'</td>');
				tag.append("<td class='tabFileDel'><button id='"+this.name+"' onclick='delFile(this)'>취소</button></td>");
				tag.append('</tr>');
				return tag.toString();                    
			}
		}
		return file.format().tag();
	}
	function delFile(e) {
		//선택한 창의 아이디가 파일의 form name이므로 아이디를 받아온다.
		var formName = e.id;
		//form에서 데이터를 삭제한다.
		fd.delete(formName);
		//맵에서도 올린 파일의 정보를 삭제한다.
		map.remove(formName);
		// tr을 삭제하기 위해
		$(e).parents('tr').remove();
	}
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
                        var visit=data.postlist[i].POST_VISIT;
                        var moddate = data.postlist[i].POST_MODDATE;
                        var item=$('<div></div>').attr('data-id',id).addClass('Item');
                        var itemText=$('<div></div').addClass('ItemText').attr('writer',writer).appendTo(item);
                        $('<h4></h4>').text(subject).appendTo(itemText);
                        $('<h6></h6>').html('조회수 : ' +visit+ ' &nbsp;&nbsp;작성시간 : ' + writedate).appendTo(itemText);
                        item.appendTo($('.Items'));
                        //loadComment(id);
                    }
                    var pagingParent = $('.Paging');
                    var toFirst = $('<a></a>').addClass('btn btn-link').attr('href',"javascript:list('1')").html('<span>&lt;&lt;</span>');
                    toFirst.appendTo(pagingParent);
                    
                    for(var i=0; i<data.postPager.blockEnd;i++) {
                    	var toPage = $('<a></a>').addClass('btn btn-link').attr('href',"javascript:list('"+(i+1)+"')").html('<span>'+(i+1)+'</span>');
                    	toPage.appendTo(pagingParent);
                    	console.log('====');
                    }
                    var toLast = $('<a></a>').addClass('btn btn-link').attr('href',"javascript:list('"+data.postPager.nextPage+"')").html('<span>&gt;&gt;</span>');
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
    var isPostUpdate =false;
    $(function() {
        //처음화면은 로그인화면
        var isLogin =$.cookie('curuser');
        console.log(isLogin);
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
                        alert('잘못된 비번이나 아이디입니다. \n다시 로그인해주세요');
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
                        alert('잘못된 비번이나 아이디입니다. \n다시 로그인해주세요');
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
        //게시글 작성창에서 작성취소 하기
        $('.writeBtnCancel').click(function() {
            if(confirm("작성취소?")) {
                $('.Write').hide();
                $('.Main').show();
                resetFileForm();
                loadPostsNot();
            }
        });
		$('.Main').on('click','.Item', function() {
			var post_id=$(this).attr('data-id');
			postDetail(post_id);
		});
        //동적으로 생성된 게시글의 댓글적기버튼에 이벤트를 달아주기
        
        $(document.body).on('click','.PostUpdate',function() {
        	if(isPostUpdate) {
        		var post_id = $(this).parent().attr('id');
        		if(confirm('수정하시겠습니까?')) {
        			submitFile(post_id,isPostUpdate);
					isPostUpdate=false;
        		}else {
        			resetFileForm();
        			postDetail(post_id);
        		}
        		
        	}else {
        		var parent_node= $(this).parent().parent();
            	var post_id = $(this).parent().attr('id');
            	var title_part= $('#'+post_id).find('.post_title_part');
            	var title_temp = title_part.text();
            	title_part.html('<input type="text" class="update_title" value="'+title_temp+'"/>');
            	var cont_part = parent_node.find('.post_cont');
            	var cont_temp = cont_part.text();
            	cont_part.html('<textarea class="update_cont updateContent">'+cont_temp+'</textarea>');
            	parent_node.find('.Comments').hide();
            	var fileUpdateDiv = $('<div></div>').addClass("dragDropDiv fileUpload ");
            	var uploadTab = $('<table></table>').addClass('fileTable dragUpdate');
            	var _tr = $('<tr></tr>');
            	$('<td></td>').addClass('tabFileName').text('파일명').appendTo(_tr);
            	$('<td></td>').addClass('tabFileSize').text('사이즈').appendTo(_tr);
            	$('<td></td>').addClass('tabFileDel').text('삭제').appendTo(_tr);
            	_tr.appendTo(uploadTab);
            	uploadTab.appendTo(fileUpdateDiv);
            	fileUpdateDiv.appendTo(parent_node);
            	
            	//기존 첨부파일 삭제하기 버튼
            	$('.file_cont .FileItems').each(function(index,item) {
            		var delBtn = $('<button></button>').addClass('delBtn').text('X');
            		$(item).append(delBtn);
            	});
            	$('.delBtn').on('click',function() {
        			console.log($(this).prev());
        			var file_id=$(this).prev().attr('file_id');
        			var parent_node = $(this).parent();
        			console.log(file_id);
        			if(confirm("파일 삭제시 바로 삭제 됩니다!")) {
        				$.ajax({
            				type:"post",
                            url:"/stk/deleteFile",
                            data: JSON.stringify({
                                file_id:file_id
                            }),
                            contentType: "application/json; charset=UTF-8",
                            success:function(strdata) {
                            	var data = JSON.parse(strdata);
                            	console.log(data.result);
                            	parent_node.remove();
                            },error:function(err) {
                                alert('ajax 연결에 문제');
                                console.log(err);
                            }	
            			});
        			}
        		});
            	/* <div class="dragDropDiv fileUpload">
				<table class='fileTable'>
					<tr>
					<td class='tabFileName'>파일명</td>
					<td class='tabFileSize'>사이즈</td>
					<td class='tabFileDel'>삭제 </td>
					</tr>
				</table>
				</div> */
            	isPostUpdate=true;
        	}
        	
        	
        });
        //동적으로 생성된 게시글의 삭제하기 버튼에 이벤트 달아주기
		$(document.body).on('click','.PostDelete',function() {
			if(confirm("글을 삭제하시면 글에 있는 첨부파일도 같이 삭제됩니다.\n그래도 삭제하시겠습니까?")) {
				var post_id = $(this).parent().attr('id');
				console.log('삭제버튼에서 얻은 게시글 id ' + post_id);
				$.ajax({
					type:"post",
					url:"/stk/deletePost",
					data:JSON.stringify({
                        post_id:post_id
                    }),
                    contentType: "application/json; charset=UTF-8",
                    success:function(strdata) {
                    	var data = JSON.parse(strdata);
                        if(data.result=='success') {
                            loadPostsNot();
                            $('.Content').empty();
                        }else{ alert("오류발생");}
                    }, error:function() {
                        alert('ajax 통신문제');
                    }
				});
			}
		});
		$(document.body).on('click','.addReply',function() {
			var post_id = $(this).parent().parent().find('.post_title').attr('id');
			var reply_cont = $(this).prev().val();
			console.log('댓글 달기 눌렀을때 게시글 id 및 내용 확인하기 : ' +post_id +"||" + reply_cont);
			$.ajax({
				type:"post",
				url:"/stk/addReply",
				data:JSON.stringify({
					post_userid : $.cookie('curuser'),
                    post_ref : post_id,
                    post_cont : reply_cont
                }),
                contentType: "application/json; charset=UTF-8",
                success:function(strdata) {
                	var data = JSON.parse(strdata);
                    if(data.result=='success') {
                    	postDetail(post_id);
                    }else{ alert("오류발생");}
                }, error:function() {
                    alert('ajax 통신문제');
                }
			})
		});
       
        var dragDrop = $('.dragDropDiv');
        $(document.body).on('dragover','.dragDropDiv',function(e) {
        	e.stopPropagation();
        	e.preventDefault();
        	$(this).css('border','2px solid red');
        });
        $(document.body).on('drop','.dragDropDiv',function(e) {
        	$(this).css('2px solid green');
        	e.preventDefault();
        	var files = e.originalEvent.dataTransfer.files;
        	handleFileUpload(files);
        });
		$(document).on('dragover', function(e) {
			e.stopPropagation();
			e.preventDefault();
			$('.dragDropDiv').css('border', '2px solid green');
		});
    });
    </script>
</body>
</html>
