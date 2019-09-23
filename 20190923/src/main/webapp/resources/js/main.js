$(function() {
    //처음화면은 로그인화면
    $('.Login').show();

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
        $.ajax({
            type:"post",
            url:"/stk/login",
            data:{ id:id,pw:pw},
            dataType:'json',
            success:function(data) {
                if(data.result=="success") {
                    alert('로그인 성공');
                    $('.Login').hide();
                    $('.Main').show();
                    $('.NaviPadding > p').html('안녕하세요, <b>' +id +'</b>님');
                    currentUser =id;
                    loadPosts();
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
            data: {
                id:id,
                pw:pw
            },
            dataType:'json',
            success:function(data) {
                if(data.result=="success") {
                    alert("회원가입 완료! 메인으로 감니다");
                    $('.Join').hide();
                    $('.Login').show();
                }else {
                    alert('오류가 발생했습니다.');
                }
                isJoin=false;
            },error:function() {
                alert('ajax 연결에 문제');
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
        if(confirm('로그아웃?')) location.reload();
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
                data: {
                    title:subject,
                    content : content,
                    mid:currentUser
                },
                dataType:'json',
                success:function(data) {
                    if(data.result=="success") {
                        $('.Write').hide();
                        $('.Main').show();
                        loadPosts();
                    }else { alert("오류발생");}
                    isPost=false;
                },
                error:function() {
                    alert("ajax 연결문제");
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
            loadPosts();
        }
    });

    //모든 게시글을 불러와주는 메소드
    var loadPosts = function() {
        $('.Items').empty();
        $.ajax({
            type:"post",
            url:'/stk/load',
            data:{},
            dataType:'json',
            success:function(data) {
                alert(data.result);
                if(data.result=="success"){
                    var cnt = data.data.length;
                    for(var i=0; i<cnt;i++) {
                        var id=data.data[i].pno;
                        var subject=data.data[i].ptitle;
                        var content=data.data[i].pcontent;
                        var writer=data.data[i].pwriter;
                        var writedate=data.data[i].pwritedate;
                        var item=$('<div></div>').attr('data-id',id).addClass('Item');
                        var itemText=$('<div></div').addClass('ItemText').attr('writer',writer).appendTo(item);
                        $('<h4></h4>').text(subject).appendTo(itemText);
                        $('<h6></h6>').text('작성시간 : ' + writedate).appendTo(itemText);
                        $('<p></p>').text(content).appendTo(itemText);
                        if(writer==currentUser){
                            var itemButtons=$('<div></div>').addClass('ItemButtons').appendTo(itemText);
                            $('<button></button>').addClass('mainBtnDel AppBtnRed').text('삭제하기').appendTo(itemButtons);
                        }
                        var comment = $('<div></div>').addClass('Comment').appendTo(item);
                        $('<input />').attr({type:'text',placeholder:'댓글입력..'}).addClass('itemTxtComment').appendTo(comment);
                        $('<button></button>').addClass('commentBtnWrite AppBtnBlue').text('댓글달기').appendTo(comment);
    
                        $('<div></div>').addClass('Comments').appendTo(comment);
                        item.appendTo($('.Items'));
                        loadComment(id);
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
            data:{
                parentId:parentId,
                content:content,
                writer:currentUser
            },
            dataType:'json',
            success: function(data) {
                if(data.result=="success"){
                    var lid=data.lastId;
                    var commentItem = $('<div></div>').addClass('CommentItem').attr('data-id',lid);
                    $('<h4></h4>').text(currentUser).appendTo(commentItem);
                    $('<p></p>').text(content).appendTo(commentItem);
                    $('<button></button>').addClass('AppBtnRed commentBtnDel').text('삭제').appendTo(commentItem);
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
            data:{
                postId:postId
            },
            dataType:'json',
            success:function(data) {
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
                data:{
                    postId:id
                },
                dataType:'json',
                success:function(data) {
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
                data:{
                    postId:id
                },
                dataType:'json',
                success:function(data) {
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