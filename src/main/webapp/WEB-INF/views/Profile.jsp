<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARTI</title>
<style>

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, menu, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, main, menu, nav, output, ruby, section, summary, time, mark, audio, video {
    		margin: 0px;
    		padding: 0px;
    		border: 0px;
    		font: inherit;
    		vertical-align: baseline;
		}
		
        h1, h2, h3, h4, h5, h6, strong, b {
            font-weight: 700;
        }
        
        select, input, textarea, a {
    		outline: none;
		}
		
		textarea, input {
    		appearance: none;
		}
		
		* {
    		box-sizing: border-box;
		}

        .Login-Container {
            -webkit-box-flex: 1;
            flex-grow: 1;
            padding: 20px 0px 206px;
        }

        .Login-Container > div {
            width: 800px;
            margin: 0px auto;
        }

        .View-Box {
            transition: padding 250ms ease-in-out;
            padding: 68px;
        }

        .Header {
            padding-bottom: 28px;
            
        }

        .Header > h1 {
            color: rgb(34, 34, 34);
            font-size: 30px;
            line-height: 40px;
            letter-spacing: -0.5px;
            font-weight: 700;
        }

        .DescWrap > p {
            color: rgb(34, 34, 34);
            font-size: 20px;
            line-height: 24px;
            font-weight: 700;
        }
        
       
</style>
</head>
<body>
<%@ include file="Header.jsp" %>
        <section class="Login-Container">
            <div class="View-Box">
                <header class="Header">
                    <h1>프로필</h1>
                </header>
                
                	<%
                        User user1 = (User) session.getAttribute("user");
                    %>
                    
                <div class="DescWrap">
                    <p><b>이메일</b></p>
                    <p><%=user1.getEmail() %></p>
                </div>
                <div class="DescWrap" style="margin-top:20px;">
                    <p><b>이름</b></p>
                    <p><%=user1.getNickname() %></p>
                </div>
				
            </div>
            	
        </section>
<%@ include file="Footer.jsp" %>
</body>
</html>
