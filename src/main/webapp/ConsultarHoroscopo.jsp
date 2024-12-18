<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List, com.edutecno.modelo.*"%>
<%@ page import="java.util.List, com.edutecno.dao.*"%>
<%
	HttpSession sessionObj = request.getSession(false);
	String username = "";
	Usuario usuario = null;
	if (sessionObj != null) {
	    username = (sessionObj.getAttribute("username") != null)
	        ? (String) sessionObj.getAttribute("username")
	        : "Usuario";
	    UsuarioDao dao = new UsuarioDao();
	    usuario = dao.findByUsername(username);
	   }
	
	    if (usuario == null) {
	        usuario = new Usuario();
	        usuario.setUsername(username);
	   }
%>

<!DOCTYPE html>
<html>
<head>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Consulta de Horóscopo Chino </title>
  
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-dark" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Horóscopo Chino</a>
     <form class="d-flex" role="search" action="CerrarSesionSvt" method="post"> 
        <button class="btn btn-outline-primary" type="submit">Cerrar Sesión</button>
      </form>
  </div>
</nav>
	
	
	
    <div class="container-fluid d-flex justify-content-center align-items-center vh-80">
        <div class="text-center">
            <h1 class="mb-5">Conoce a tu animal de horóscopo chino</h1>

            <div class="d-grid gap-3 col-12 col-md-6 mx-auto">
                <div>
                    <h4>Tu animal es</h4>
                    <h1 class="display-3 fw-bold text-primary">
                        <%= 
                        (usuario.getAnimal() != null)
                            ? usuario.getAnimal()
                            : "No definido" 
                        %>
                    </h1>
                </div>
            </div>

           <div class="mt-4">
                <form class="d-flex justify-content-center" action="inicio.jsp" method="get">
                    <button class="btn btn-success btn-lg" type="submit">
                        <i class="bi bi-arrow-left me-2"></i>Volver
                    </button>
                </form>
            </div>
    </div>
</div>
  <style>
      body {
		    background-color: #f4f6f9;
		}

		.btn {
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    text-align: center;
		    padding: 12px 24px;
		    font-weight: 500;
		    transition: all 0.3s ease;
		}

		.btn:hover {
		    transform: scale(1.05);
		    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
		}
    </style>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>