<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<spring:url value="/resources/css/header.css" var="headerCss" />
<link href="${headerCss}" rel="stylesheet" />

<spring:url value="/resources/js/header.js" var="headerJs" />

<section id="header">

    <div class="logo">
        <img src="<c:url value="/resources/img/logo.jpg" />" alt="logo" />
    </div>

    <ul class="menu">
        <li class="menu_item"><a class="menu_item_link" href="<spring:url value="/"/>">Home</a></li>
        <li class="menu_item"><a class="menu_item_link" href="<spring:url value="/users/"/>">Users</a></li>
        <li class="menu_item"><a class="menu_item_link" href="<spring:url value="/reports/"/>">Reports</a></li>
        <li class="menu_item"><a class="menu_item_link" href="<spring:url value="/conferences/"/>">Conferences</a></li>

        <sec:authorize access="authenticated" var="authenticated"/>
        <c:choose>
            <c:when test="${authenticated}">
                <li class="menu_item" id="logined_user_wrapper">
                    <div class="user_ico_wrapper">
                        <img class="user_ico" src="<c:url value="/resources/img/user.jpg" />" alt="user_ico" />
                    </div>

                    <p>
                        <sec:authentication property="name"/>
                    </p>

                    <div class="user_ico_wrapper">
                        <img class="arrow_ico" src="<c:url value="/resources/img/arrow-point-to-down.png" />" alt="arrow_ico" />
                    </div>

                    <ul class="account_submenu">
                        <li id="edit_account"  ><a class="account_submenu_link" href="<c:url value="#"/>">Edit Account</a></li>  <%--TODO:--%>
                        <li><a id="logout" class="account_submenu_link" href="#">Logout</a></li>

                        <form id="logout-form" action="<c:url value="/logout"/>" method="post">
                            <sec:csrfInput/>
                        </form>

                    </ul>
                </li>

            </c:when>
            <c:otherwise>
                <li class="menu_item"><a class="menu_item_link" href="<spring:url value="/login/"/>">Log In</a></li>
                <li class="menu_item"><a class="menu_item_link" id="sign_up" href="<spring:url value="/signup/"/>">Sign Up</a></li>
            </c:otherwise>
        </c:choose>
    </ul>

</section>

<script src="${headerJs}"></script>
