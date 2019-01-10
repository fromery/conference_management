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
    <div class="wrapper">
        <div class="create_wrapper">
            <img class="plus_ico" src="<c:url value="/resources/img/plus.jpg"/>" alt="plus_ico"/>
            <span>
                   Create User
               </span>
        </div>

        <div class="search_wrapper">
            <img class="search_ico" src="<c:url value="/resources/img/search.jpg" />" alt="user_ico"/>

            <input class="search_input" type="text" placeholder="Search" cssClass="input">
        </div>
    </div>

    <table class="table_wrapper">
        <tr>
            <td>
                <table class="header_table">
                    <thead>
                    <th id="header_firstname">First name</th>
                    <th id="header_lastname">Last name</th>
                    <th id="header_role">Role</th>
                    <th id="header_actions">Actions</th>
                    </thead>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <div class="content_users">

                    <table id="user-table" class="table">
                        <tbody>

                        </tbody>
                    </table>

                </div>
            </td>
        </tr>
    </table>

</section>

<script src="${usersJs}"></script>

<jsp:include page="footer.jsp"/>

</body>
</html>
