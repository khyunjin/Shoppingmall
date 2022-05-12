<div align = right>

# JSP, Servlet MVC2 쇼핑몰 구현
</div>
<br></br>

## *데이터 베이스 설계*

![db설계](https://user-images.githubusercontent.com/102004096/168110788-e453bd47-2a0c-4efd-b6d4-48541f099429.PNG)

<br>

## *기능 설명*

1. [홈 화면 슬라이드](#1-홈-화면-슬라이드) <br>
2. 사용자 <br>
  2-1. [회원가입](#2-1-회원가입) <br>
  2-2. [로그인, 로그아웃](#2-2-로그인-로그아웃) <br>
  2-3. [아이디, 비밀번호 찾기](#2-3-아이디-비밀번호-찾기) <br>
3. 상품 리스트 및 주문 <br>
  3-1. [상품 리스트 조회](#3-1-상품-리스트-조회) <br>
  3-2. [장바구니 개별 주문](#3-2-장바구니-개별-주문)<br>
  3-3. [장바구니 전체 주문](#3-3-장바구니-전체-주문) <br>

<br>

- ### 1. 홈 화면 슬라이드
  - css를 사용해 4초뒤 자동 슬라이드 진행 및 앞, 뒤 화살표 클릭시 화면 이동이 가능하게 하였습니다. (indexslide.css)

https://user-images.githubusercontent.com/102004096/168095891-c4d1c95a-b6fa-44d6-8a07-361c081814f6.mp4

<br>

- ### 2-1. 회원가입
  - javascript 정규식을 이용해 유효성 검사를 하였습니다. (memberjoin.js)

https://user-images.githubusercontent.com/102004096/168095137-ae77a07b-6387-42dd-bee5-9f4124d9f013.mp4

<br>

- ### 2-2. 로그인, 로그아웃
  - DB에 아이디가 없거나, 있어도 비밀번호가 일치하지 않는 경우 로그인에 실패하게 하였습니다.


https://user-images.githubusercontent.com/102004096/168106958-8c5d7967-d7d2-4f7e-891d-eae69a540ffc.mp4

<br>

- ### 2-3. 아이디, 비밀번호 찾기
  - 아이디는 이름, 이메일로 비밀번호는 이름, 아이디, 이메일로 찾을 수 있게 하였습니다.

https://user-images.githubusercontent.com/102004096/168098358-ecfa4604-2d3d-4175-b4d8-ec0e8e968a3c.mp4

<br>

- ### 3-1. 상품 리스트 조회
  - 상품 리스트는 장바구니 테이블의 컬럼으로 구별하여 조회하였습니다.

https://user-images.githubusercontent.com/102004096/168152661-01bf8b0b-1495-439b-bc83-e62e62434689.mp4

<br>

- ### 3-2. 장바구니 개별 주문
  - 로그인 후 사용 가능하며, 상품 상세 및 장바구니 페이지에서 수량 변경할 수 있게 하였습니다.

https://user-images.githubusercontent.com/102004096/168153197-a87e2e7a-d90c-48da-9d92-525dc81fa750.mp4

<br>

- ### 3-3. 장바구니 전체 주문
  - 장바구니에 담은 상품을 전체 주문 후 카트 비우기를 하였습니다.

https://user-images.githubusercontent.com/102004096/168148364-887d13c7-583b-47bb-9c4f-404e87228f3c.mp4

