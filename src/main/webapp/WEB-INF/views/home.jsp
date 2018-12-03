<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CMS-Home</title>

   <%-- <link href="${contextPath}/resources/css/reset.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/home.css" rel="stylesheet">--%>
    <link rel="stylesheet" href="../resources/css/home.css">

</head>

<body>

<jsp:include page="header.jsp" />

<section class="main_section_home">
    <p class="title_home">
        Conference Management System
    </p>

    <p>
        Stop the long searching for reports over the Internet
    </p>
    <p>
        Start CMS app and find all them here
    </p>

</section>

</body>
</html>
