<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>CMS-Conferences</title>

    <style>

        * {
            padding: 0;
            margin: 0;
        }

        html,
        body {
            height: 100%;
            width: 100%;
            background: radial-gradient(at center, #3e99b8, #53bee1);
            position: relative;
        }

        .main_section_home {
            width: 940px;
            margin: 70px auto;
        }

    </style>

</head>

<body>

<jsp:include page="header.jsp" />

<section class="main_section_home">

    Conferences

</section>

<jsp:include page="footer.jsp" />

</body>
</html>
