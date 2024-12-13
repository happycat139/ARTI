<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Turn.js Test</title>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/turn.js"></script>
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
        width: 400px;
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

    #flipbook .odd {
        background-color: #f7f7f7;
    }

    #flipbook .even {
        background-color: #ffffff;
    }
</style>
</head>
<body>

<div id="flipbook">
    <div class="hard">Cover</div>
    <div class="page">Page 1</div>
    <div class="page">Page 2</div>
    <div class="page">Page 3</div>
    <div class="page">Page 4</div>
    <div class="hard">Back Cover</div>
</div>

<script>
$(document).ready(function () {
    if ($.fn.turn) {
        console.log("Turn.js is loaded properly.");

        $("#flipbook").turn({
            width: 400,
            height: 600,
            autoCenter: true,
            gradients: true,
            elevation: 50,
            when: {
                turning: function(event, page) {
                    console.log("Turning to page " + page);
                },
                turned: function(event, page) {
                    console.log("Turned to page " + page);
                }
            }
        });

        // Ensure "hard" class is applied to the first and last pages
        $("#flipbook .hard").each(function () {
            $(this).addClass("turnjs-hard");
        });
    } else {
        console.error("Turn.js is not loaded.");
    }
});

$(document).bind('keydown', function(e){
	
	if (e.keyCode==37)
		$('#flipbook').turn('previous');
	else if (e.keyCode==39)
		$('#flipbook').turn('next');
		
});
</script>
</body>
</html>
