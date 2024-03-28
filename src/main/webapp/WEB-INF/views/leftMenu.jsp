<%@ page pageEncoding="UTF-8"%> 

<style>
body, ul, li {
  margin: 0;
  padding: 0;
  list-style: none;
}

a {
  color: inherit;
  text-decoration: none;
}
/* 노멀라이즈 끝 */

/* 2차 메뉴 가두기 */
.side-bar > ul > li {
  position: relative;
}

/* 2차 메뉴 숨기기 */
.side-bar > ul ul {
  display: none;
  position: absolute;
  top: 0;
  left: 100%;
  width: 100%;
  background-color: #666;
}

body {
  /* background-color: #444; */
  height: 3333px;
}

.side-bar {
  position: fixed;
  min-height: 100vh;
  width: 100px;
  background-color: black;
  transition: .5s;
  z-index : 1;
}

.side-bar ul > li > a {
  display: block;
  color: white;
  font-size: 1.7rem;
  padding: 10px 20px;
  white-space: nowrap;
}

.side-bar {
  position: fixed;
  min-height: 100vh;
  width: 100px;
  background-color: black;
  overflow: hidden;	/* 넘치는 메뉴 요소 숨기기 */
  transition: .5s;
}

/* 마우스 인식 시 너비 확장 */
.side-bar:hover {
  width: 270px;
}

/* 2차 메뉴 공간 제한 해제 */
.side-bar:hover {
  width: 270px;
  overflow: visible;
}

.side-bar ul > li:hover > a {
  background-color: #888
}

.side-bar > ul > li:hover > ul {
  display: block;
}

/* 사이드바가 늘어나기 전 메뉴 노출 차단 */
.side-bar > ul > li > a > span:last-child {
  opacity: 0;
  transition: .5s .1s;
}

.side-bar:hover > ul > li > a > span:last-child {
  opacity: 1;
}

.side-bar > ul > li > a > span:first-child {
  position: relative;
  display: inline-block;
  border: 5px solid white;
  border-radius: 50%;
  width: 3rem;
  height: 3rem;
}

.side-bar > ul > li > a > span > i {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.side-bar > ul > li > a > span {
  vertical-align: middle;
}

</style>

<aside class="side-bar">
  <section class="side-bar__icon-box">
    <section class="side-bar__icon-1">
      <div></div>
      <div></div>
      <div></div>
    </section>
  </section>
  <ul>
    <li>
      <a href="#">
        <span><i class="fa-solid fa-cat"></i></span>
        <span>전자결재</span>
      </a>
      <ul>
        <li><a href="#">(내 부서함 표시)</a></li>
        <li><a href="#">진행중인 결재</a></li>
        <li><a href="#">반려된 문서</a></li>
        <li><a href="#">문서 보관함</a></li>
        <li><a href="#">전자결재 설정</a></li>
      </ul>
    </li>
    <li>
      <a href="#">
        <span><i class="fa-solid fa-dragon"></i></span>
        <span>My Account</span>  
      </a>
      <ul>
        <li><a href="#">내 정보</a></li>
        <li><a href="#">동호회</a></li>
        <li><a href="#">비품 요청</a></li>
      </ul>
    </li>
    <li>
      <a href="#">
        <span><i class="fa-solid fa-dove"></i></span>
        <span>관리자 페이지</span>
      </a>
      <ul>
        <li><a href="#">사용자 관리</a></li>
        <li><a href="/groupAdd">부서 관리</a></li>
        <li><a href="#">batch Job 관리</a></li>
      </ul>
    </li>
  </ul>
</aside>

