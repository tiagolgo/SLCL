<%@ taglib uri = "http://java.sun.com/jstl/core" prefix = "c"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>    
        <script type="text/javascript" src="js/bootstrap.js"></script>    
        <script type="text/javascript" src="js/bootstrap-dropdown.js"></script>    
        <script type="text/javascript" src="js/ajax.js"></script>  
        <link href="css/bootstrap-responsive.css" rel="stylesheet" media="screen">
        <link href="css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="css/bootstrap.css" rel="stylesheet" media="screen">
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="css/PageCSS.css" rel="stylesheet" media="screen">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Inicio</title>

        <script language="javascript">

            function alterarTexto(id) {
                var novoTexto = document.getElementById(id).innerHTML;
                document.getElementById("migalhas").innerHTML = novoTexto;

            }

            function adicionarTexto(id) {

                var novoTexto = document.getElementById(id).innerHTML;
                document.getElementById("migalhas").innerHTML +=  novoTexto;

            }

        </script>

    </head>
    <body>
        <div id="container">
            <div id="header">
                <c:import url="cabecalho.jsp" ></c:import>
                </div>

                <div id="content">
                    
                    <ul class="breadcrumb">
                        <li><a href="javascript:open('index.jsp')">Inicio</a><span class="divider">></span></li>
                        <li class="active"><div id="migalhas"></div></li>
                    </ul>

                    <div class="navbar">
                        <div class="navbar-inner">
                            <ul class="nav">
                                <li id="professor"><a href="javascript:open('crudProfessor.jsp')" onclick="alterarTexto('professor')">Professor</a></li>
                                <li id="coordenador"><a href="javascript:open('crudCoordenador.jsp')" onclick="alterarTexto('coordenador')">Coordenador</a></li>
                                <li id="curso"><a href="javascript:open('crudCurso.jsp')" onclick="alterarTexto('curso')">Curso</a></li>
                                <li id="disciplina"><a href="javascript:open('crudDisciplina.jsp')" onclick="alterarTexto('disciplina')">Disciplina</a></li>
                                <li id="listaPedidos"><a>Lista de Livros Pedidos</a></li>
                            </ul>
                        </div>
                    </div>
                    <div id="ajax">
                    <c:import url="index.jsp"></c:import>
                    </div>
                </div>

                <div id="sidebar">
                </div>

                <div id="footer">
                    <p style="text-align: center"><c:import url="rodape.jsp"></c:import></p>
            </div>
        </div>
    </body>
</html>
