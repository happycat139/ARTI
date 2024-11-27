<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<link rel="icon" href="/img/favicon.ico">
</head>
<style>

body {
    margin: 0px;
    padding: 0px;
    font-family: "Noto Sans KR", sans-serif;
    background-color: #f7f7fc;
    box-sizing: border-box; /* 모든 요소에 border-box 적용 */
}

.SbPlotModifyModalBack_THUMB {
    width: 100vw;
    height: 100vh;
    top: 0;
    left: 0;
    background-color: rgba(0, 0, 0, 0.5);
    position: fixed;
    z-index: 2;
}

.SbPlot-ModifyModal_THUMB {
    width: 663px;
    height: 600px;
    border-radius: 20px;
    background: #fff;
    box-shadow: 0px 0px 5px -1px rgba(0, 0, 0, 0.15);
    position: fixed;
    left: calc(50vw - 317px);
    top: 22%;
    
}

.SbPlotModalCloseBtn_THUMB {
    margin: 20px 0 15px 615px;
}

.SbPlot-ModifyTHUMB {
    color: #000;
    text-align: center;
    font-family: "Noto Sans KR", sans-serif;
    font-size: 22px;
    font-style: normal;
    font-weight: 500;
    line-height: 30px;
}

.SbPlot-ModifySubTHUMB {
    color: #000;
    text-align: center;
    font-family: "Noto Sans KR", sans-serif;
    font-size: 22px;
    font-style: normal;
    font-weight: 500;
    line-height: 30px;
    margin-top: 30px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.SbPlot-ModifyInput_THUMB {
    font-family: "Noto Sans KR", sans-serif;
    font-size: 20px;
    width: 570px;
    height: 276px;
    border-radius: 8px;
    border: white;
    resize: none;
    background: #f4f4fc;
    margin: 24px 0 20px 30px;
    padding: 16px;
}

.SbPlot-ModifyInput_THUMB:focus {
	outline:none;
	border:none;
}

.Modify-SBPModal-btn_THUMB {
    float: right;
    width: 234px;
    height: 46px;
    margin: 0 35px 0 15px;
    flex-shrink: 0;
    border-radius: 8px;
    border: 1px solid #6133e2;
    background-color: var(--story, #6133e2);
    color: #fff;
    text-align: center;
    font-family: "Noto Sans KR", sans-serif;
    font-size: 16px;
    font-style: normal;
    font-weight: 500;
    line-height: 30px;
    cursor: pointer;
}

.Modify-SBPModal-credit_THUMB {
    color: rgba(0, 0, 0, 0.7);
    text-align: right;
    font-family: Inter;
    font-size: 14px;
    font-style: normal;
    font-weight: 400;
    line-height: 46px;
    float: right;
}

.Modify-SbEdit_THUMB {
    color: var(--story, #6133e2);
    text-align: left;
    font-family: Inter;
    font-size: 18px;
    font-style: normal;
    font-weight: 400;
    line-height: 46px;
    float: left;
    margin: 0 0 20px 30px;
    
}

.SbEdit-Option {
    color: #6133e2;
    margin-left: 10px;
    cursor: pointer;
    border: 2px solid #6133e2;
    padding: 5px 10px;
    border-radius: 30px;
}
</style>
<body>
<%@ include file="SbCreateHeader.jsp"%>
<!-- 플롯 수정 팝업창 -->
		<div id="SbPlotModifyModalBack_THUMB" class="SbPlotModifyModalBack_THUMB">
			<div class="SbPlot-ModifyModal_THUMB">
				<img src="/img/close-icon.svg" id="SbPlotModifyModalClose_THUMB" class="SbPlotModalCloseBtn_THUMB">
				<div class="SbPlot-ModifyTHUMB">
					<b>원하는 장면을 자세히 적으면 AI가 그림을 생성합니다.</b>
				</div>
				<div class="SbPlot-ModifySubTHUMB">
					현재 그림체 : 
					<div class="SbEdit-Option">
						수채화 일러스트
						<img src="/img/gear.png" style="margin-top:5px;">
					</div>
				</div>
				<textarea class="SbPlot-ModifyInput_THUMB"></textarea>
				<button class="Modify-SBPModal-btn_THUMB">생성하기</button>
				<br>
				<div class="Modify-SBPModal-credit_THUMB">잔여 크레딧 : 31</div>
				<div class="Modify-SbEdit_THUMB"><b>직접 그림 업로드</b></div>
			</div>
		</div>
</body>
</html>
