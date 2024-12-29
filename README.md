# ARTI🎨 
![Inrto](https://github.com/user-attachments/assets/b92cca70-427c-40e6-9f88-13ecc1a46895)

# 👀 서비스 소개

* <b>서비스명 :</b> AI 기반 동화 생성 및 미술 심리 검사 서비스
* <b>서비스설명 :</b> OPEN AI (ChatGpt_4o, DallE_v3)와 Yolov5 모델을 활용하여 동화 생성 및 미술 심리 검사를 제공하는 서비스 
<br>

 ![InfoService](https://github.com/user-attachments/assets/34b86fd4-11c4-4f6d-8a13-b9521c53c00f)

<br>

# 📅 프로젝트 기간
<b>2024.11.27 ~ 2024.12.19</b> (약 4주)

<br>

# ✍ 구현 기능

<b>1. AI기반 동화책 </b> (OpenAI API를 활용한 AI 기반 동화책 생성)

기본정보 -> 줄거리 -> 이미지 순서

- 사용자에게 주제를 입력받아 동화의 기본정보, 11페이지 분량의 줄거리 생성
- 한국어에 능통하고 응답속도가 빠른 ChatGPT 4.0 모델 사용

<p>
<img src="https://github.com/user-attachments/assets/8f813286-7a3e-4266-aeb8-ec28cec77696">
</p>

<br>
<br>

- 동화 ai이미지 생성 및 세부사항 편집
- 이미지의 퀄리티가 높고 한국어 프롬프트 전송이 가능한  DALL·E 3 모델로 이미지 생성

<p>
<img src="https://github.com/user-attachments/assets/05a234c8-d651-42b5-9174-83f9255b96c4">
</p>

<br>
<br>
<br>

<b>2. 결제 기능 </b> (Toss Payments API를 활용한 결제 및 코인 충전 기능 구현)

- 생성된 동화책을 장바구니에 담아 결제할 수 있는 기능 제공.

- 이미지 수정 및 추가 생성을 위해 필요한 코인을 Toss Payments API를 통해 간편하게 충전 가능.

<p>
<img src="https://github.com/user-attachments/assets/505ce57e-334c-4243-a6f9-2753ba8f80df">
</p>


<br>
<br>
<br>


<b>3. 소셜로그인 기능 </b> (Spring MVC 기반으로 Google OAuth 2.0 소셜 로그인 구현)

-  OAuth 2.0 인증 프로토콜을 사용하여 간결하고 효율적인 방식으로 소셜 로그인 기능을 완성.
  
- 로그인한 사용자의 프로필 정보를 인증 후 세션에 저장하여, 간편하게 다른 페이지에서도 접근 가능하도록 구현.

<p>
<img src="https://github.com/user-attachments/assets/9dc47a62-ac2c-4366-b582-2c4abba5b728">
</p>

<br>
<br>

## ⛏ 기술스택
<table>
    <tr>
        <th>구분</th>
        <th>내용</th>
    </tr>
    <tr>
        <td>사용언어</td>
        <td>
            <img src="https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=java&logoColor=white"/>
            <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=white"/>
            <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=CSS3&logoColor=white"/>
            <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white"/>
            <img src="https://img.shields.io/badge/python-3776AB?style=for-the-badge&logo=python&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>라이브러리</td>
        <td>
            <img src="https://img.shields.io/badge/googlecloud-4285F4?style=for-the-badge&logo=googlecloud&logoColor=white"/>
            <img src="https://img.shields.io/badge/openai-412991?style=for-the-badge&logo=openai&logoColor=white"/>
            <img src="https://img.shields.io/badge/OAuth2.0-000000?style=for-the-badge&logo=OAuth2.0&logoColor=white"/>
            <img src="https://img.shields.io/badge/TossPayments-5865F2?style=for-the-badge&logo=TossPayments&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>개발도구</td>
        <td>
            <img src="https://img.shields.io/badge/Eclipse-2C2255?style=for-the-badge&logo=Eclipse&logoColor=white"/>
            <img src="https://img.shields.io/badge/VSCode-007ACC?style=for-the-badge&logo=VisualStudioCode&logoColor=white"/>
            <img src="https://img.shields.io/badge/jupyter-F37626?style=for-the-badge&logo=jupyter&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>서버환경</td>
        <td>
            <img src="https://img.shields.io/badge/Apache Tomcat-D22128?style=for-the-badge&logo=Apache Tomcat&logoColor=white"/>
            <img src="https://img.shields.io/badge/Uvicorn-007ACC?style=for-the-badge&logo=Uvicorn&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>데이터베이스</td>
        <td>
            <img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white"/>
            <img src="https://img.shields.io/badge/googlecloudstorage-4285F4?style=for-the-badge&logo=googlecloudstorage&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>협업도구</td>
        <td>
            <img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=Git&logoColor=white"/>
            <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white"/> 
            <img src="https://img.shields.io/badge/googledrive-4285F4?style=for-the-badge&logo=googledrive&logoColor=white"/>
            <img src="https://img.shields.io/badge/discord-5865F2?style=for-the-badge&logo=discord&logoColor=white"/>
            <img src="https://img.shields.io/badge/notion-000000?style=for-the-badge&logo=notion&logoColor=white"/>
        </td>
    </tr>
</table>


<br>


## ⚙ 시스템 아키텍처
![SystemArchitecture](https://github.com/user-attachments/assets/1b540465-0ada-4d25-b425-baca6bad0d58)

<br>

## 📌 서비스 흐름도
![UserFlow](https://github.com/user-attachments/assets/d3348034-7e7b-4e6b-9d1f-eea6ee762a1c)

<br>

## 📌 ER다이어그램
![ERD](https://github.com/user-attachments/assets/512b03c0-361b-43e8-b09d-f672c78eae33)

<br>


## 💣 트러블슈팅

#### 이전 문제점
- 초기 구현에서는 하나의 요청에 대한 응답이 하나로 돌아오는 구조에서, 우리가 한 번에 받아야 하는 <제목, 장르, 배경, 주제, 주인공, 요약 줄거리>의 6가지 요소와, <줄거리1, 줄거리2, ..., 줄거리11>의 11가지 요소를 함께 포함시키는 데 어려움이 있었음.
- 이를 해결하기 위해 **구분 기호(###)** 를 사용하여 여러 요소를 구분하는 방식을 선택했으나, 복잡성과 응답 일관성 유지에 문제가 생김.

#### 해결 방안
- **JSON 형식**을 활용하여 응답을 구조적으로 처리하도록 개선.
  - **System 메시지**에 구체적인 역할과 응답 형식을 명시적으로 정의하여, ChatGPT가 정확하고 일관된 JSON 응답을 생성하도록 설정.
  - `book_name`, `book_genre`, `book_background`, `book_subject`, `book_mc`, `book_summary` 등의 필드를 명확히 지정해 한 번의 요청으로 모든 데이터를 효율적으로 수집 가능하도록 개선.
- 불필요한 기호나 추가적인 텍스트 없이, **간결한 JSON 응답**만 반환하도록 규칙을 강화함으로써 응답 처리의 깔끔함과 가독성을 향상.



<br>





## 👨‍👩‍👦‍👦 팀원 역할
<table>
  <tr>
    <td align="center"><img src="https://item.kakaocdn.net/do/fd49574de6581aa2a91d82ff6adb6c0115b3f4e3c2033bfd702a321ec6eda72c" width="100" height="100"/></td>
    <td align="center"><img src="https://mb.ntdtv.kr/assets/uploads/2019/01/Screen-Shot-2019-01-08-at-4.31.55-PM-e1546932545978.png" width="100" height="100"/></td>
    <td align="center"><img src="https://mblogthumb-phinf.pstatic.net/20160127_177/krazymouse_1453865104404DjQIi_PNG/%C4%AB%C4%AB%BF%C0%C7%C1%B7%BB%C1%EE_%B6%F3%C0%CC%BE%F0.png?type=w2" width="100" height="100"/></td>
    <td align="center"><img src="https://i.pinimg.com/236x/ed/bb/53/edbb53d4f6dd710431c1140551404af9.jpg" width="100" height="100"/></td>
  </tr>
  <tr>
    <td align="center"><strong>이혜성</strong></td>
    <td align="center"><strong>김예원</strong></td>
    <td align="center"><strong>김원섭</strong></td>
    <td align="center"><strong>권오빈</strong></td>
  </tr>
  <tr>
    <td align="center"><b>PM / Back-end /
                        <br>Front-end</b></td>
    <td align="center"><b>Back-end /
                        <br>Prompt-Engineering</b></td>
    <td align="center"><b>Data Modeling</b></td>
    <td align="center"><b>SQL / Frontend</b></td>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/user-attachments/assets/f9af1c97-db84-4cee-93e7-7a4ff0f818af" target='_blank'>github</a></td>
    <td align="center"><a href="https://github.com/happycat139" target='_blank'>github</a></td>
    <td align="center"><a href="https://github.com/K-wonsub1871" target='_blank'>github</a></td>
    <td align="center"><a href="https://github.com/fivebin" target='_blank'>github</a></td>
  </tr>
</table>
