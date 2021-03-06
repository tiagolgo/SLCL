<%-- 
    Document   : Login
    Created on : 11/04/2013, 20:32:15
    Author     : Miray
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
    <head>
        <title>Login</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>    
        <script type="text/javascript" src="js/bootstrap.js"></script>    
        <script type="text/javascript" src="js/bootstrap.min.js"></script>     
        <link href="css/bootstrap-responsive.css" rel="stylesheet" media="screen">
        <link href="css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="css/bootstrap.css" rel="stylesheet" media="screen">
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="css/LoginCSS.css" rel="stylesheet" media="screen">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div id="box">
            <form action="Login" method="POST" class="form-horizontal" accept-charset="ISO-8859-1">
                <fieldset >
                    <h5 class="row">${erroLogin}</h5>
                    <label for="username">Usuário</label>
                    <div>
                        <div class="input-prepend">
                            <span class="add-on">
                                <i class="icon-user"></i>
                            </span>
                            <input id="username" name="username" type="text" class="span3">
                        </div>
                    </div>
                    <label for="password">Senha</label>
                    <div>
                        <div class="input-prepend">
                            <span class="add-on">
                                <i class="icon-lock"></i>
                            </span>
                            <input id="password" name="password" type="password" class="span3">
                            <div class="controls">
                                <br /> 
                                <button type="submit" class="btn-large btn-info">Login</button>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </body>
</html>
