<%@ page contentType="text/html;charset=UTF-8" %>

<style>

    #header {
        width: 940px;
        margin: 0px auto;
        padding: 15px 0;
        display: flex;
        justify-content: space-between;
    }

    .menu_item {
        display: inline-block;
        height: 38px;
    }

    .menu_item_link {
        line-height: 38px;
        height: 100%;
        padding: 0 20px;
        display: inline-block;

        border: 1px solid transparent;
        border-radius: 4px;

        color: #fff;
        text-decoration: none;
        font-family: Open Sans, Arial, serif;
        font-size: 16px;
    }

    #sign_in {
        border-color: #ffffff;
        border-radius: 4px;
    }

    .menu_item_link:hover,
    .menu_item_link:focus {
        color: #000;
        background-color: #ffffff;
        border: 1px solid transparent;
    }

</style>

<section id="header">

    <div>
        <%--TODO: Not loading logo--%>
        <%--<img src="/resources/img/home_page.jpg">--%>
    </div>

    <ul class="menu">
        <li class="menu_item"><a class="menu_item_link" href="/" >Home</a></li>
        <li class="menu_item"><a class="menu_item_link" href="#" >Users</a></li>    <%--TODO--%>
        <li class="menu_item"><a class="menu_item_link" href="#" >Reports</a></li>  <%--TODO--%>
        <li class="menu_item"><a class="menu_item_link" href="#" >Conferences</a></li>
        <li class="menu_item"><a class="menu_item_link" href="${contextPath}/login" >Log In</a></li>
        <li class="menu_item"><a class="menu_item_link" id="sign_in" href="${contextPath}/registration" >Sign Up</a></li>
    </ul>

</section>
