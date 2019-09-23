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
	<script>
		$(function() {
			
		});
	</script>
</head>
<body>
<div class="AppWrap">
        <div class="Login">
            <h1>My SNS Service</h1>
            <br>
            <h3>로그인해주세요</h3>
            <p>아이디</p>
            <input type="text" class="loginTxtID" maxlength="50">
            <p>비밀번호</p>
            <input type="password" class="loginTxtPw" maxlength="50">
            <br>
            <br>
            <button class="loginBtnLogin">로그인</button>
            <button class="loginBtnJoin">회원가입</button>
        </div>
        <div class="Join">
            <h1>My SNS Service</h1>
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
                    <h2>My SNS Service</h2>
                    <p>안녕하세요, <b>사용자</b>님.</p>
                    <button class="mainBtnWrite AppBtnBlue">글쓰기</button>
                    <button class="mainBtnLogout AppBtnRed">로그아웃</button>
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
                            <button class="mainBtnDel AppBtnRed">삭제하기</button>
                        </div>
                    </div>
                    <div class="Comment">
                            <input type="text" class="itemTxtComment" placeholder="댓글입력..">
                            <button class="AppBtnBlue">댓글 달기</button>
                            <div class="Comments">
                                <div class="CommentItem">
                                    <h4>사용자1</h4>
                                    <p>댓글입니다.</p>
                                    <button class="AppBtnRed">학제</button>
                                </div>
                                <div class="CommentItem">
                                    <h4>사용자2</h4>
                                    <p>댓글입니다.</p>
                                    <button class="AppBtnRed">학제</button>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
        <div class="Write">
            <div class="Navi">
                <div class="NaviPadding">
                <h2>My SNS Service</h2>
                <p>안녕하세요, <b>사용자</b>님.</p>
                <button class="mainBtnWrite AppBtnBlue">글쓰기</button>
                <button class="mainBtnWrite AppBtnRed">로그아웃</button>
                </div>
            </div>
            <div class="HeightPadding"></div>
            <p>제목</p>
            <input type="text" class="writeTextSubject" placeholder="제목을 입력하세요" maxlength="50">
            <p>내용</p>
            <textarea class="writeTextContent" placeholder="내용을 입력하세요"></textarea>
            <div class="ItemButtons">
                <button class="writeBtnWrite AppBtnBlue">작성하기</button>
                <button class="writeBtnCancel AppBtnRed">작성취소</button>
            </div>
        </div>
    </div>
</body>
</html>
