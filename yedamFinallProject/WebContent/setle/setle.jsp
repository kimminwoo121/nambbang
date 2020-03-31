<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.6">
    <title>Insert title here</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>

    <link href="setle/css/form-validation.css" rel="stylesheet">
    <script src="setle/js/form-validation.js"></script>

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width : 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <!-- Custom styles for this template -->

    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script type="text/javascript">
        window.addEventListener("load", function () {

            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation')

            // Loop over them and prevent submission
            Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })

            var IMP = window.IMP; // 생략가능
            IMP.init('imp73961880'); //"가맹점 식별코드"를 사용

            btncancel.addEventListener("click", function () {

                $.ajax({
                    url: "ajaxSetleCancel.do",
                    type: 'POST',
                    data: {
                        order_group_no: document.getElementById('groupNo').innerHTML //주문그룹번호
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done();
                location.href = 'index.do';
            });

            btn.addEventListener("click", function () {
                var phon = document.getElementById('phon')

                if (phon.value == "") {
                    alert('휴대전화번호 값을 입력하지 않았습니다.')
                    phon.focus();
                    return;
                } else {

                    IMP.request_pay({
                        pg: 'kakaopay', // version 1.1.0부터 지원.
                        pay_method: 'card',
                        merchant_uid: new Date().getTime(),
                        name: document.getElementById('groupNo').innerHTML,
                        amount: document.getElementById('amountOfPayment').innerHTML,//'{%=결제될금액%}',
                        buyer_tel: document.getElementById('phon').innerHTML,
                        m_redirect_url: '결제완료후 페이지이동'  //
                    }, function (rsp) {
                        if (rsp.success) {
                            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기

                            // [2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                            var everythings_fine = rsp; //true, false로 전달
                            if (everythings_fine) {
                                var msg = '결제가 완료되었습니다.';
                                msg += '결제번호 : ';
                                msg += '결제수단' + rsp.pay_method;
                                msg += '결제승인코드' + rsp.imp_uid;
                                msg += '결제금액' + rsp.paid_amount;
                                msg += '마일리지 사용금액';
                                msg += '결제일시';
                                msg += '주문그룹번호';


                                $.ajax({
                                    url: "ajaxSetle.do", //전달할 서버,cross-domain error가 발생하지 않도록 주의해주세요
                                    type: 'POST',
                                    data: {
                                        merchant_uid: rsp.merchant_uid // 결제번호
                                        ,
                                        pay_method: rsp.pay_method //결제수단
                                        ,
                                        imp_uid: rsp.imp_uid //결제승인코드
                                        ,
                                        paid_amount: rsp.paid_amount //결제금액
                                        ,
                                        mlg_use_amount: document.getElementById('mlguse').innerHTML//마일리지 사용금액
                                        ,
                                        order_group_no: document.getElementById('groupNo').innerHTML //주문그룹번호
                                        ,
                                        order_tel_no: document.getElementById('phon').value
                                        //기타 필요한 데이터가 있으면 추가 전달
                                    }
                                }).done(function (data) {
                                    if (data == 'true') {
                                        alert('결제가 완료되었습니다.');
                                    }
                                    else {
                                        alert('결제가 실패했습니다.');
                                    }

                                });
                            } else {

                                var msg = '오류가 발생했습니다..';
                                msg += '에러내용 : ' + rsp.error_msg;
                                //[3] 아직 제대로 결제가 되지 않았습니다.
                                //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                                alert(msg);
                                //실패시 이동할 페이지

                            }
                            location.href = 'index.do';
                            // 성공시 이동할 페이지
                        } else {
                            var msg = '결제에 실패하였습니다.';
                            msg += '에러내용 : ' + rsp.error_msg;
                            //실패시 이동할 페이지
                            alert(msg);
                        }
                    });
                }
            });
            document.getElementById('mlguse').innerHTML = 0;
            document.getElementById('amountOfPayment').innerHTML = document.getElementById('totalOderAmount').innerHTML;

            mlg.addEventListener("change", function () {
                var mlg = document.getElementById('mlg').value;  //입력값
                var tm = document.getElementById('totalMlg').innerHTML; //사용가능 마일리지

                var mlgUse = 0;
                if (parseInt(tm) < parseInt(mlg)) { //마일리지 입력값이 사용가능한 마일리지 값보다 높을때
                    mlgUse = document.getElementById('mlguse').innerHTML = tm;
                    document.getElementById('mlg').value = tm;
                }
                else if (mlg === "" || parseInt(mlg) === 0) { //마일리지 입력값이 0이거나 null일때

                    mlgUse = document.getElementById('mlguse').innerHTML = 0;
                    document.getElementById('mlg').value = 0;
                }
                else {
                    mlgUse = document.getElementById('mlguse').innerHTML = mlg;
                }

                var toa = document.getElementById('totalOderAmount').innerHTML;
                document.getElementById('amountOfPayment').innerHTML = toa - mlgUse;

            });

        }, false);
    </script>
</head>

<body class="">
    <div class="container bg-light">
        <div class="py-5 text-center"></div>
        <form class="needs-validation" method="POST" action="">
            <div class="row">


                <div class="col-md-8 order-md-1">
                    <h2 class="mb-3">주문서 작성/결제</h2>
                    <c:set var="sum" value="0" />
                    <c:forEach var="i" items="${list}">
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <img src="${i.photoFile}" style="width: inherit; max-width: 100%; height: auto;" />
                                <!--제품이미지 출력-->
                            </div>
                            <div class="col-md-8 mb-3" style="padding-top: 40px;">
                                <!--제품정보 출력-->
                                <div class="col-md-12 mb-3">
                                    <!-- 판매ID -->
                                    <h5>${i.sleId }</h5>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <!-- 제품이름 -->
                                    <h3>${i.goodsName }</h3>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <!--제품수량 가격-->
                                    <h5>수량 ${i.orderQy } &nbsp;&nbsp; ${i.orderQy * i.slePc } 원</h5>
                                </div>
                            </div>
                        </div>
                        <div class="progress border" style="height: 1px;">
                            <div class="progress-bar bg-light" style="width: 100%;"></div>
                        </div>
                        <c:set var="sum" value="${sum+(i.orderQy * i.slePc)}" />
                    </c:forEach>

                    <div class="row" style="padding-top: 30px;">

                        <div class="col-md-3 mb-3">
                            <h5>휴대전화 번호</h5>
                        </div>
                        <div class="col-md-9 mb-3">
                            <input type="text" class="form-control" id="phon" placeholder="- 없이 숫자만 입력해 주세요." value=""
                                required>
                            <div class="invalid-feedback">Valid first name is required.
                            </div>
                        </div>
                    </div>

                    <div class="row" style="padding-top: 30px;">
                        <div class="col-md-3 mb-3">
                            <h5>마일리지</h5>
                        </div>
                        <div class="col-md-4 mb-3">
                            <input type="text" class="form-control" id="mlg" placeholder="" value="0" required>
                            <div class="invalid-feedback">Valid first name is required.
                            </div>
                        </div>
                        <div class="col-md-5 mb-3">
                            원 &nbsp;&nbsp;&nbsp; / &nbsp;&nbsp;&nbsp; <span id="totalMlg" style="color: crimson;">
                                ${mlg} </span><span>원</span>
                        </div>
                    </div>

                    <div class="row" style="padding-top: 30px;">
                        <div class="col-md-3" style="margin-top: 30px;">
                            <h5>결제 수단</h5>
                        </div>
                        <div class="col-md-9">
                            <button type="button" class="btn btn-outline-light">
                                <img src="sellviews/images/카카오페이.png" style="width: 100px; height: 100px;" />
                            </button>
                        </div>
                    </div>
                    <hr class="mb-3">


                </div>
                <div class="col-md-4 order-md-2 mb-4">
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-muted">주문 확인</span>
                    </h4>
                    <ul class="list-group mb-3">
                        <li class="list-group-item d-flex justify-content-between lh-condensed">
                            <div>
                                <h6 class="my-0">주문그룹번호</h6>
                                <small class="text-muted">Order group number</small>
                            </div> <span id="groupNo" class="text-muted">${groupno }</span><span></span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-condensed">
                            <div>
                                <h6 class="my-0">총 주문 금액</h6>
                                <small class="text-muted">Total order amount</small>
                            </div><span id="totalOderAmount" class="text-muted">
                                <c:out value="${sum }" /></span><span>원</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-condensed">
                            <div>
                                <h6 class="my-0">마일리지 사용금액</h6>
                                <small class="text-muted">Mileage spend amount</small>
                            </div><span id="mlguse" class="text-muted"></span><span>원</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between bg-light">
                            <div class="text-success">
                                <h6 class="my-0">결제금액</h6>
                                <span>Amount of payment</span>
                            </div>
                            <strong id="amountOfPayment" class="text-success"> </strong><span>원</span>
                        </li>
                    </ul>


                    <div class="input-group">
                        <hr class="mb-4">
                        <button id="btn" name="btn" class="btn btn-primary btn-lg btn-block" type="button">결제하기</button>
                        <button id="btncancel" name="btncancel" class="btn btn btn-danger btn-lg btn-block"
                            type="button">주문 취소</button>
                    </div>

                </div>
            </div>
        </form>
        <footer class="my-5 pt-5 text-muted text-center text-small">
            <p class="mb-1">&copy; 2020.01-2020.03 Nambbang</p>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#">Privacy</a></li>
                <li class="list-inline-item"><a href="#">Terms</a></li>
                <li class="list-inline-item"><a href="#">Support</a></li>
            </ul>
        </footer>
    </div>


</body>

</html>