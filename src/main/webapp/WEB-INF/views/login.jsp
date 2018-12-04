<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>CMS-Login</title>

    <style>

        * {
            padding: 0;
            margin: 0;
        }

        html,
        body {
            height: 100%;
            width: 100%;
            background-color: #f2f5f5;
        }

        .login_wrapper {
            width: 490px;
            height: 340px;
            margin: 100px auto;
            border-radius: 2%;
            background-color: #ffffff;
        }

        .login_header {
            padding-top: 15px;
            padding-bottom: 10px;
            color: #000000;
            text-align: center;
            font-size: 35px;
        }

        .line {
            border-top: 2px solid #f2f5f5;
        }

        .login_form {
            display: flex;
            flex-direction: column;
            margin: 20px auto;
            margin-bottom: 10px;
            width: 428px;
        }

        .input {
            height: 50px;
            margin-bottom: 10px;
            border-radius: 3px;
        }

        .login_button {
            margin: 0 auto 10px auto;
            width: 146px;
            height: 59px;
            display: block;
            padding: 10px;
            background-color: #60d3ef;
            border-radius: 5px;

            font-size: 18px;
            color: #ffffff;

            cursor: pointer;
        }

        .footer_login {
            margin: 15px;
            text-align: center;
        }

        .sign_up {
            text-decoration: none;
        }

        .sign_up:hover ,
        .sign_up:focus {
            background-color: #60d3ef;
            color: #ffffff;
        }

        /*TODO: DELETE SCROLE on the page*/

    </style>
</head>
<body>

    <section class="login_wrapper">
        <div class="login_header">
            <span>
                Welcome back!
            </span>
        </div>

        <div class="line"></div>

        <form class="login_form">
            <input type="text" class="input" placeholder="example@email.com" required >
            <input type="password" class="input" placeholder="********" required>
            <input type="submit" class="login_button" value="Login">
        </form>

        <div class="line"></div>

        <div class="footer_login">
            <span>
                Don't have an account?
                <a class="sign_up" href="${contextPath}/registration">Sing up now!</a>
            </span>
        </div>

    </section>

</body>
</html>
