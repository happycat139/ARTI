<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.smhrd.Arti.Model.StoryBook"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
<
link href ="https: //fonts.googleapis.com /css2 ?family =Noto+Sans+KR:wght
	 @100 ;300 ;400 ;500 ;700 ;900 &display =swap " rel ="stylesheet ">body,
	div, p, span, input, table {
	margin: 0;
	padding: 0;
}

div {
	display: block;
	unicode-bidi: isolate;
}

body {
	margin: 0;
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		"Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji",
		"Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #212529;
	text-align: left;
	background-color: #fff;
}

#Pch_wrapper {
	display: flow-root;
}

.Pch_full_wrapper {
	width: 1140px;
	min-height: 1000px;
	margin: 60px auto 130px;
	color: rgba(0, 0, 0, 0.8);
	position: relative;
}

#Pch_left {
	float: left;
	display: inline-block;
}

#Pch_list {
	border-bottom: 1px solid #E6E6E6;
}

.Pch_display_list {
	display: grid;
	width: 100%;
	border-top: 1px solid rgba(0, 0, 0, 0.7);
}

.Pch_header {
	height: 60px;
	line-height: 60px;
	padding-left: 12px;
	font-size: 18px;
	font-weight: 600;
	text-align: left;
	box-sizing: border-box !important;
}

.Pch_product {
	float: left;
	display: inline-block;
	width: 513px;
	height: -webkit-fill-available;
	position: relative;
}

.Pch_ea, .Pch_regular, .Pch_price {
	float: left;
	display: inline-block;
	position: relative;
	top: 50%;
	width: 120px;
	transform: translate(0, -50%);
}

#Pch_right {
	float: right;
	float: top;
	display: inline-block;
	width: 356px;
	margin-right: 20px;
}

#Pch_moving_div {
	width: 356px;
	position: fixed;
}

#Pch_cart_all {
	display: none;
	transition: height 0.5s linear;
}

.Pch_cart {
	display: grid;
	grid-template-columns: 3fr 1fr 1fr 1fr; /* 비율 조정 */
	align-items: center;
	padding: 10px 0;
	font-size: 14px;
	border-top: 1px solid #E6E6E6;
	box-sizing: border-box;
	margin-left: 10px;
	text-align: center;
}

.Pub_product {
	display: flex; /* Flexbox로 가로 정렬 */
	align-items: center; /* 이미지와 텍스트를 수직 가운데 정렬 */
	gap: 10px; /* 이미지와 텍스트 사이 간격 */
}

.Pub_product_img img {
	width: 70px;
	height: 70px;
	object-fit: cover; /* 이미지 비율 유지 */
}

.Pub_product_text p {
	margin: 0;
	font-size: 14px; /* 텍스트 크기 조정 */
	line-height: 1.5; /* 텍스트 간격 */
	text-align: left;
	margin-left: 10px;
}

#Pch_order_list, #Pch_delivery_list, #Pch_payment_list {
	margin-top: 50px;
}

.Pch_list_padding {
	width: 100%;
	padding: 12px 0;
	font-size: 14px;
	border-top: 1px solid #E6E6E6;
	box-sizing: border-box !important;
}

.Pch_item_title {
	float: left;
	display: inline-block;
	width: 176px;
	padding-left: 12px;
	line-height: 40px;
	font-size: 14px;
	font-weight: 500;
	color: rgba(0, 0, 0, 0.8);
	box-sizing: border-box !important;
}

input[type='text'], textarea {
	display: inline-block;
	width: 328px;
	height: 40px;
	padding: 0 13px;
	font-size: 14px;
	color: rgba(0, 0, 0, 0.9);
	border: 1px solid #A4A4A4;
	border-radius: 5px;
	box-sizing: border-box !important;
}

.hyphen {
	width: 32px !important;
	box-sizing: border-box !important;
}

.hyphen {
	float: left;
	display: inline-block;
	width: 24px;
	height: 40px;
	line-height: 40px;
	text-align: center;
}

input[type='checkbox'] {
	width: 16px;
	height: 16px;
	margin: 3px 8px 0 0;
}

.Pch_outline_button {
	font-size: 13px;
	font-weight: 500;
	border-radius: 3px;
	position: relative;
	top: 50%;
	text-align: center;
	transform: translate(0, -50%);
	border: 1px solid rgba(0, 0, 0, 0.3);
	box-sizing: border-box !important;
	cursor: pointer;
	padding: 5px;
}

.Pch_item_input {
	align-items: center; /* 세로 중앙 정렬 */
	gap: 10px; /* 라디오 버튼과 텍스트 간격 */
	flex-wrap: wrap; /* 공간이 부족할 경우 줄바꿈 */
}

.Pch_item_input input[type="radio"] {
	margin: 0; /* 기본 여백 제거 */
}

.Pch_item_input span {
	font-size: 13px;
	font-weight: 500;
	cursor: pointer; /* 클릭 가능 표시 */
}

.Pch_item_input p {
	margin: 0; /* 불필요한 여백 제거 */
	display: flex;
	align-items: center;
	gap: 10px; /* 요소 간격 추가 */
}

.Pch_color_button {
	display: block;
	width: 184px;
	height: 46px;
	line-height: 44px;
	margin: 50px auto;
	font-size: 14px;
	font-weight: 500;
	text-align: center;
	border-radius: 8px;
	border: 1px solid #6133E2;
	background-color: #6133E2;
	color: #fff;
	cursor: pointer;
	box-sizing: border-box !important;
}

#Pch_total {
	width: 100%;
	border: 1px solid #E6E6E6;
	border-top: 1px solid rgba(0, 0, 0, 0.7);
	box-sizing: border-box !important;
}

.Pch_total_item {
	height: 35px;
	line-height: 35px;
	padding: 0 12px;
}

.Pch_total_title {
	float: left;
	font-size: 16px;
	font-weight: 500;
}

.Pch_total_price_d {
	float: right;
	padding: 0;
	font-size: 16px;
	font-weight: 500;
	text-align: right;
}
</style>

</head>
<body>
	<%@ include file="Header.jsp"%>
	<div id="Pch_wrapper" class="Pch_full_wrapper">
		<div
			style="font-size: 16px; font-weight: 500; position: absolute; top: -40px; right: 0;">
			<span style="color: rgba(0, 0, 0, 0.5);">장바구니</span> <img
				src="/img/Pch_arrow.png"
				style="margin: 0 13px; vertical-align: inherit;"> <span>주문/결제</span>
			<img src="/img/Pch_arrow.png"
				style="margin: 0 13px; vertical-align: inherit;"> <span
				style="color: rgba(0, 0, 0, 0.5);">완료</span>
		</div>

		<form id="publishForm" action="finalize" method="post"
			onsubmit="combineInfo();">

			<input type="hidden" name="pub_idx" value="${pub_idx}"> <input
				type="hidden" name="totalPrice"
				value="${totalPrice + (totalPrice < 50000 ? 3000 : 0)}">


			<div id="Pch_left">
				<div id="Pch_list" class="Pch_display_list">
					<div class="Pch_header">
						<div class="Pch_product" style="width: 347px;">주문상품</div>
						<div class="Pch_ea" style="font-size: 14px; text-align: center;">수량</div>
						<div class="Pch_regular"
							style="font-size: 14px; text-align: center;">판매금액</div>
						<div class="Pch_price"
							style="font-size: 14px; text-align: center;">결제금엑</div>
					</div>
					<div id="Pch_cart_all" style="display: grid;">
						<c:set var="totalQuantity" value="0" />
						<c:forEach items="${cartList}" var="cart">
							<div class="Pch_cart">
								<!-- 주문 상품 -->
								<div class="Pub_product">
									<div class="Pub_product_img">
										<img src="${cart.book_thumbnail}" alt="동화 썸네일">
									</div>
									<div class="Pub_product_text">
										<p>${cart.book_name}</p>
										<p style="color: #A4A4A4;">고화질 스퀘어북 24P</p>
									</div>
								</div>

								<!-- 수량 -->
								<div class="Pub_ea">
									<p>${cart.quantity}권</p>
								</div>

								<!-- 판매 금액 -->
								<div class="Pub_regular">
									<p>
										<fmt:formatNumber value="${9900 * cart.quantity}"
											type="number" />
										원
									</p>
								</div>

								<!-- 결제 금액 -->
								<div class="Pub_price">
									<p>
										<fmt:formatNumber value="${9900 * cart.quantity}"
											type="number" />
										원
									</p>
								</div>
							</div>
							<c:set var="totalQuantity"
								value="${totalQuantity + cart.quantity}" />
						</c:forEach>
					</div>

					<div id="Pch_order_list" class="Pch_display_list">
						<div class="Pch_header">주문자 정보</div>
						<div class="Pch_list_padding">
							<div class="Pch_item_title">이름</div>
							<div class="Pch_item_input">
								<input type="text" name="pub_sender" placeholder="이름을 입력해 주세요.">
							</div>
						</div>

						<div class="Pch_list_padding">
							<div class="Pch_item_title">휴대폰</div>
							<div class="Pch_item_input">
								<input type="text" maxlength="3"
									oninput="moveNext(this, 'sender_phone2')" name="sender_phone1"
									id="sender_phone1"
									style="float: left; width: 88px; ime-mode: disabled;">
								<div class="hyphen">-</div>
								<input type="text" maxlength="4" name="sender_phone2"
									oninput="moveNext(this, 'sender_phone3')" id="sender_phone2"
									style="float: left; width: 88px; ime-mode: disabled;">
								<div class="hyphen">-</div>
								<input type="text" maxlength="4" name="sender_phone3"
									id="sender_phone3"
									style="float: left; width: 88px; ime-mode: disabled;">
							</div>
						</div>

						<div class="Pch_list_padding">
							<div class="Pch_item_title">이메일</div>
							<div class="Pch_item_input">
								<input type="text" name="pub_email" placeholder="이메일을 입력해 주세요.">
							</div>
						</div>
					</div>


					<div id="Pch_delivery_list" class="Pch_display_list">
						<div class="Pch_header">배송지 정보</div>
						<div class="Pch_list_padding">
							<div class="Pch_item_title">이름</div>
							<div class="Pch_item_input">
								<input type="text" name="pub_receiver"
									placeholder="이름을 입력해 주세요.">
								<div
									style="display: inline-block; height: 24px; margin-left: 23px; position: relative;">
									<input type="checkbox" class="Pch_checkbox" name="check1"
										style="float: left; margin-top: 0; position: relative;">
									<span>주문자 정보와 동일</span>
								</div>
							</div>
						</div>

						<div class="Pch_list_padding">
							<div class="Pch_item_title">휴대폰</div>
							<div class="Pch_item_input">
								<input type="text" maxlength="3" name="receiver_phone1"
									oninput="moveNext(this, 'receiver_phone2')"
									id="receiver_phone1"
									style="float: left; width: 88px; ime-mode: disabled;">
								<div class="hyphen">-</div>
								<input type="text" maxlength="4" name="receiver_phone2"
									oninput="moveNext(this, 'receiver_phone3')"
									id="receiver_phone2"
									style="float: left; width: 88px; ime-mode: disabled;">
								<div class="hyphen">-</div>
								<input type="text" maxlength="4" name="receiver_phone3"
									id="receiver_phone3"
									style="float: left; width: 88px; ime-mode: disabled;">
							</div>
						</div>

						<div class="Pch_list_padding">
							<div class="Pch_item_title">우편번호</div>
							<div class="Pch_item_input">
								<input type="text" id="zipCode" name="zipCode" size="7"
									maxlength="7" style="width: 111px; background: #F9F9F9;"
									readonly> <a class="Pch_outline_button"
									onclick="execDaumPostcode()"
									style="width: 102px; margin: 0 10px; top: unset; transform: none;">
									우편번호 검색</a>
							</div>
						</div>

						<div class="Pch_list_padding">
							<div class="Pch_item_title" style="line-height: 90px;">주소</div>
							<div class="Pch_item_input">
								<input type="text" maxlength="200" id="address1" name="address1"
									style="margin-bottom: 10px; background: #F9F9F9;" readonly>
								<br> <input type="text" maxlength="200" id="address2"
									name="address2" value="" placeholder="상세주소를 입력해 주세요.">
							</div>
						</div>

						<div class="Pch_list_padding">
							<div class="Pch_item_title" style="line-height: 95px;">배송
								메세지</div>
							<div class="Pch_item_input">
								<textarea name="message" id="message" rows="5" cols="40"
									style="padding: 8px 13px; resize: none;"></textarea>
								<br>
								<p
									style="margin-top: 10px; font-size: 13px; font-weight: normal; color: rgba(0, 0, 0, 0.7);">
									※ 이곳은 집배원님들이 보는 메시지란입니다.<br>ARTI에 요청사항이 있으시면 주문하시고 고객센터로
									문의 바랍니다.
								</p>
							</div>
						</div>
					</div>




					<div id="paymentdiv" class="Pch_list_padding">
						<div id="title-payment" class="Pch_item_title"
							style="line-height: 87px;">결제 방식</div>
						<div class="Pch_item_input">
							<p>
								<input type="radio" name="pay" value="online"
									onclick="document.getElementById('title-payment').style.lineHeight = '124.5px'; document.getElementById('online_str').style.display = ''; document.getElementById('document-list').style.display = '';" />
								<span
									onclick="document.af.pay[0].checked=true;document.getElementById('title-payment').style.lineHeight = '124.5px';document.getElementById('online_str').style.display = '';document.getElementById('document-list').style.display = '';">
									무통장입금 </span>
							</p>
							<input type="hidden" name="bank_info" value="375">
							<p style="margin-top: 10px; margin-bottom: 10px;">
								<span
									style="font-size: 13px; font-weight: 500; border: 1px dashed #A4A4A4; border-radius: 3px; padding: 10px;">국민
									419801-01-249238 (주)ARTI</span> <span style="margin-left: 24px;">입금자
									성명</span> <input type="text" name="send_name" value="김예원"
									style="width: 120px;" />
							</p>
							<p id="online_str"
								style="margin: 10px 0; color: #183FCB; font-size: 13px; display: none;">
								※ 입금자 성명을 꼭 확인해주세요. 실제 입금하시는 분과 성함이 다르면 입금 확인이 어렵습니다.</p>
							<p>
								<input type="radio" name="pay" value="card"
									onclick="document.getElementById('title-payment').style.lineHeight = '87px';document.getElementById('online_str').style.display = 'none'; document.getElementById('document-list').style.display = 'none';" />
								<span
									onclick="document.af.pay[1].checked = true;document.getElementById('title-payment').style.lineHeight = '87px'; document.getElementById('online_str').style.display = 'none'; document.getElementById('document-list').style.display = 'none';">
									신용카드/휴대폰/계좌이체 결제 </span>
							</p>
						</div>
					</div>
				</div>

				<input type="hidden" name="sender_phone" id="sender_phone">
				<input type="hidden" name="receiver_phone" id="receiver_phone">
				<input type="hidden" name="address" id="address">

				<div class="Pch_color_button" type="button"
					onclick="publish(${totalPrice + (totalPrice < 50000 ? 3000 : 0)})"
					style="width: 344px;">결제하기</div>
			</div>


		</form>

		<div id="Pch_right">
			<div id="Pch_moving_div" style="position: fixed;">
				<div id="Pch_total">
					<div class="Pch_header"
						style="margin: 0 12px 5px; padding: 0; border-bottom: 1px solid #E6E6E6;">결제
						상세</div>
					<div class="Pch_total_item" style="font-size: 15px;">
						주문 상품 수량 <span id="ea_count" style="font-weight: 500;">${totalQuantity}개</span>
					</div>
					<div class="Pch_total_item">
						<div class="Pch_total_title">판매금액</div>
						<div class="Pch_total_price_d">
							<fmt:formatNumber value="${totalPrice}" type="number" />
							원
						</div>
					</div>
					<div class="Pch_total_item">
						<div class="Pch_total_title">배송비</div>
						<div class="Pch_total_price_d">
							<fmt:formatNumber value="${totalPrice < 50000 ? 3000 : 0}"
								type="number" />
							원
						</div>
					</div>

					<div class="Pch_total_item"
						style="margin-bottom: 12px; font-size: 13px; color: rgba(0, 0, 0, 0.6);">
						<img src="/img/Pch_notice.png"
							style="vertical-align: text-bottom;"> 50,000만원 이상 구매 시 무료배송
					</div>
					<div class="Pch_total_item"
						style="height: 60px; line-height: 60px; background: #F9F9F9;">
						<div class="Pch_total_title">총 결제금액</div>
						<div id="Pch_total_price_final" class="Pch_total_price_d"
							style="font-weight: 600; color: #FF4040;">
							<fmt:formatNumber
								value="${totalPrice + (totalPrice < 50000 ? 3000 : 0)}"
								type="number" />
							원
						</div>
					</div>


				</div>

			</div>


		</div>
	</div>

	<%@ include file="Footer.jsp"%>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- CDN 방식 사용 -->
	<script>
		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업을 통한 검색 결과 항목 클릭 시 실행
							var addr = ''; // 주소_결과값이 없을 경우 공백 
							var extraAddr = ''; // 참고항목

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 도로명 주소를 선택
								addr = data.roadAddress;
							} else { // 지번 주소를 선택
								addr = data.jibunAddress;
							}

							if (data.userSelectedType === 'R') {
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
							} else {
								document.getElementById("UserAdd1").value = '';
							}

							// 선택된 우편번호와 주소 정보를 input 박스에 넣는다.
							document.getElementById('zipCode').value = data.zonecode;
							document.getElementById("address1").value = addr;
							document.getElementById("address2").value += extraAddr;
							document.getElementById("address2").focus(); // 우편번호 + 주소 입력이 완료되었음으로 상세주소로 포커스 이동

						}
					}).open();
		}

		// 전화번호 탭 넘어가는 기능
		function moveNext(currentInput, nextInputId) {
			// 현재 입력창의 값이 maxlength에 도달했을 때
			if (currentInput.value.length === currentInput.maxLength) {
				// 다음 입력창으로 포커스 이동
				const nextInput = document.getElementById(nextInputId);
				if (nextInput) {
					nextInput.focus();
				}
			}
		}

		// 전화번호 합치기
		function combineInfo() {

			// 주문자 전화번호 결합
			const senderPhone1 = document.getElementById("sender_phone1").value;
			const senderPhone2 = document.getElementById("sender_phone2").value;
			const senderPhone3 = document.getElementById("sender_phone3").value;
			const fullSenderPhone = senderPhone1 + "-" + senderPhone2 + "-"
					+ senderPhone3;
			document.getElementById("sender_phone").value = fullSenderPhone;

			// 수령자 전화번호 결합
			const receiverPhone1 = document.getElementById("receiver_phone1").value;
			const receiverPhone2 = document.getElementById("receiver_phone2").value;
			const receiverPhone3 = document.getElementById("receiver_phone3").value;
			const fullReceiverPhone = receiverPhone1 + "-" + receiverPhone2
					+ "-" + receiverPhone3;
			document.getElementById("receiver_phone").value = fullReceiverPhone;

			// 주소 결합
			const address1 = document.getElementById("address1").value;
			const address2 = document.getElementById("address2").value;
			const fulladdress = address1 + " " + address2;
			document.getElementById("address").value = fulladdress;
			
			console.log(fullSenderPhone);
			console.log(fullReceiverPhone);
			console.log(fulladdress);

		}
	</script>
	<script src="https://js.tosspayments.com/v1"></script>
	<script>
	  const clientKey = "test_ck_4yKeq5bgrpWqnYoeJ72BVGX0lzW6"; // Toss Payments Console에서 확인
	  const tossPayments = TossPayments(clientKey);
	  const successUrl = 'http://localhost:8093//arti/publish/finalize';
	  const failUrl = 'http://localhost:8093/arti/payments/fail';
	  const orderName = '동화책 결제';

	  function publish(amount) {
		    combineInfo(); // 폼 데이터 준비

		    // 1. 폼 데이터 수집
		    const formData = new FormData(document.getElementById('publishForm'));
		    const jsonData = {};
		    formData.forEach((value, key) => {
		        jsonData[key] = value;
		    });

		    // 주문 번호 생성
		    const orderId = 'order_' + new Date().getTime();
		    jsonData['amount'] = amount; // 결제 금액 추가
		    jsonData['orderId'] = orderId; // 주문 번호 추가

		    // 2. 서버에 데이터 전달 및 결제 요청
		    fetch('/arti/payments/request/pub', {
		        method: 'POST',
		        headers: { 'Content-Type': 'application/json' },
		        body: JSON.stringify(jsonData),
		    })
		        .then((response) => response.json())
		        .then((data) => {
		            // Toss Payments 결제 요청
		            TossPayments('test_ck_4yKeq5bgrpWqnYoeJ72BVGX0lzW6')
		                .requestPayment('간편결제', {
		                	amount: amount,
			                orderId: orderId,
			                orderName: orderName,
			                successUrl: successUrl,
			                failUrl: failUrl,
		                })
		                .catch((error) => {
		                    console.error('결제 요청 실패:', error);
		                    alert('결제 요청에 실패했습니다.');
		                });
		        })
		        .catch((error) => console.error('서버 요청 실패:', error));
		}





	</script>


</body>
</html>