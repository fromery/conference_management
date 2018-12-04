<%@ page contentType="text/html;charset=UTF-8" %>

<style>

    #footer {
        width: 100%;
        height: 40px;
        background-color: #ffffff;
        position: absolute;
        bottom: 0px;
    }

    .footer_menu {
        display: flex;
        justify-content: space-around;
    }

    .footer_menu_item {
        display: inline-block;
        height: 40px;
    }

    .footer_menu_item_link {
        line-height: 40px;
        height: 100%;
        padding: 0 20px;
        display: inline-block;

        color: #000000;
        text-decoration: none;
        font-family: Open Sans, Arial, serif;
        font-size: 16px;
    }

    .footer_menu_item_link:hover,
    .footer_menu_item_link:focus{
        color: #3e99b8;
        font-size: 20px;
    }

</style>

<section id="footer">

    <ul class="footer_menu">
        <li class="footer_menu_item"><a class="footer_menu_item_link" href="tel:+8(063)-743-17-91">&#9742; &nbsp;+8(063)-743-17-91</a></li>
        <li class="footer_menu_item"><a class="footer_menu_item_link" href="mailto:saushkinsemen@gmail.com">&#9993; &nbsp;saushkinsemen@gmail.com</a></li>
    </ul>

</section>
