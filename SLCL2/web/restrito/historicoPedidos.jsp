
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<form action="CadastroPedidos" method="GET" accept-charset="ISO-8859-1">
    <fieldset>
        <legend>Hist�rico de Pedidos de Livros</legend>
        <div class="accordion" id="accordion2">
            <c:set var="count" value="${0}" />
            <c:forEach items="${pedidosLivro}" var="item">
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse${count}">
                            ${item.livro.titulo} - ${item.evento.estado} (<fmt:formatDate type="date" value="${item.evento.dataMod}"/>)
                        </a>
                    </div>
                    <div id="collapse${count}" class="accordion-body collapse">
                        <div class="accordion-inner">
                            <p><b>ISBN:</b> ${item.livro.isbn}</p>
                            <p><b>Titulo Original:</b> ${item.livro.tituloOriginal}</p>
                            <p><b>Editora:</b> ${item.livro.editora}</p>
                            <p><b>Edi��o:</b> ${item.livro.edicao}</p>
                            <p><b>Quantidade:</b> ${item.qtde}</p>
                            <p><b>Curso:</b> ${item.curso.nome}</p>
                            <p><b>Disciplina:</b> ${item.disciplina.nome}</p>
                            <p><b>Tipo de Bibliografia:</b> ${item.bibliografia}</p>
                        </div>
                    </div>
                </div>
                <c:set var="count" value="${count +1}" />    
            </c:forEach>
        </div>
    </fieldset>
</form>