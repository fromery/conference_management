<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Users</title>

    <spring:url value="/resources/img/browser_tab_icon.ico" var="ico"/>
    <link href="${ico}" rel="shortcut icon" type="image/x-icon">

    <spring:url value="/resources/css/reset.css" var="resetCss"/>
    <link href="${resetCss}" rel="stylesheet"/>

    <spring:url value="/resources/css/users.css" var="usersCss"/>
    <link href="${usersCss}" rel="stylesheet"/>

    <spring:url value="/resources/js/users.js" var="usersJs"/>

    <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            type="text/javascript">
    </script>

    <script>
        var root = "${pageContext.request.contextPath}";
    </script>

</head>

<body>

<jsp:include page="header.jsp"/>

<section class="main_section_home">

    <div>

<%--
        <div>
            <span>
                 <img class="search_ico" src="<c:url value="/resources/img/search.jpg" />" alt="user_ico" />
            </span>
            <form:input class="input" path="" placeholder="Search" cssClass="input"  />
        </div>
--%>

    <%--
       <button id="create_user" type="button">
            <img class="plus_ico" src="<c:url value="/resources/img/plus.jpg"/>" alt="plus_ico" />
            <span>
                Create User
            </span>
        </button>
--%>

    </div>

    <table id="user-table" class="table">
        <thead>
            <tr>
                <th>First name</th>
                <th>Last name</th>
                <th>Email</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%-- <tr>
                 <td>There are currently no users scheduled.</td>
             </tr>--%>
        </tbody>
    </table>

</section>

<script src="${usersJs}"></script>

<jsp:include page="footer.jsp"/>

</body>
</html>
