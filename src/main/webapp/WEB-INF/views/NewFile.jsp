<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Turn.js Test</title>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/turn.min.js"></script>
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

#flipbook {
    width: 800px;
    height: 600px;
    margin: auto;
    position: relative;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

#flipbook .hard {
    background-color: #333;
    color: white;
    font-weight: bold;
    text-align: center;
    line-height: 600px;
    border: 1px solid #000;
}

#flipbook .page {
    background-color: white;
    border: 1px solid #ddd;
    text-align: center;
    font-size: 18px;
    line-height: 600px;
}

</style>
</head>
<body>

<div id="flipbook">
    <div class="hard">Cover</div>
    <div class="hard"></div>
    <div>Page 1</div>
    <div>Page 2</div>
    <div>Page 3</div>
    <div>Page 4</div>
    <div class="hard">Back Cover</div>
    <div class="hard"></div>
</div>

<script>
$(document).ready(function () {
    if ($.fn.turn) {
        console.log("Turn.js is loaded properly.");
        $("#flipbook").turn({
            width: 800, // 책 너비
            height: 600, // 책 높이
            autoCenter: true, // 중앙 정렬
            display: "double", // 기본으로 양쪽 페이지 표시
            gradients: true, // 모서리 꺾임 효과
            elevation: 50 // 모서리 돌출 효과
        });
    } else {
        console.error("Turn.js is not loaded.");
    }
});
</script>
</body>
