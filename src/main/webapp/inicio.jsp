<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		HttpSession sessionObj = request.getSession(false);
		String username = "";
		if (sessionObj != null) {
		    username = (sessionObj.getAttribute("username") != null) 
		               ? (String) sessionObj.getAttribute("username") 
		               : "Usuario";
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
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
     <form class="d-flex" role="search" action="CerrarSesionSvt" method="post">
       
        <button class="btn btn-outline-primary" type="submit">Cerrar Sesión</button>
      </form>

  </div>
</nav>
	
	
	<div class="container">
	 <div class="d-flex justify-content-center gap-3">
    <h1 class="mb-5 ">¿Qué deseas hacer <%= username %> ?</h1>
    </div>
    <div class="d-flex justify-content-center gap-3">
        <form action="ConsultarHoroscopo.jsp" method="get">
            <button type="submit" class="btn btn-primary btn-lg">
                <i class="bi bi-search me-2"></i>Conoce tu animal
            </button>
        </form>
        <form action="listadoUsuarios.jsp" method="get">
            <button type="submit" class="btn btn-success btn-lg">
                <i class="bi bi-people me-2"></i>Buscar Usuarios
            </button>
        </form>
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