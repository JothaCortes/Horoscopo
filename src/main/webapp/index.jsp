<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 <title>Iniciar Sesión - Horóscopo Chino</title>
   
</head>
<body>
<nav class="navbar navbar-expand-lg bg-dark" data-bs-theme="dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Horóscopo Chino</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
</nav>

<div class="container py-3">
    <div class="row justify-content-center">
        <div class="col-12 col-md-6 col-lg-5">
            <div class="card shadow-lg border-0 rounded-lg">
                <div class="card-header bg-dark text-white text-center py-4">
                    <h3 class="">Iniciar Sesión</h3>
                </div>
                <div class="card-body p-5">
                    <form action="IniciarSesionSvt" method="post">
                        <input type="hidden" name="action" value="login">
                        
                        <div class="form-group mb-3">
                            <label for="username" class="form-label">Nombre de Usuario</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-person"></i></span>
                                <input type="text" class="form-control" id="username" name="username" required placeholder="Ingresa tu usuario">
                            </div>
                        </div>

                        <div class="form-group mb-4">
                            <label for="password" class="form-label">Contraseña</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-lock"></i></span>
                                <input type="password" class="form-control" id="password" name="password" required placeholder="Ingresa tu contraseña">
                            </div>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary btn-lg">
                                <i class="bi bi-box-arrow-in-right me-2"></i>Iniciar Sesión
                            </button>
                        </div>
                    </form>
                </div>
                <div class="card-footer text-center py-3">
                    <p class="m-0">¿No tienes cuenta? <a href="registroUsuario.jsp" class="text-primary">Regístrate aquí</a></p>
                </div>
            </div>
        </div>
    </div>
</div>
 <style>
     body {
	    background-color: #f4f6f9;
	}

	.card {
	    border-radius: 15px;
	    overflow: hidden;
	}
	
	.card-header {
	    background-color: #343a40 !important;
	}
	
	.input-group-text {
	    background-color: #f8f9fa;
	    border-right: none;
	}
	
	.form-control {
	    border-left: none;
	    box-shadow: none;
	}
	
	.form-control:focus, .input-group-text:focus {
	    border-color: #80bdff;
	    box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
	}
	
	.btn-primary {
	    transition: all 0.3s ease;
	}
	
	.btn-primary:hover {
	    transform: translateY(-2px);
	    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
	}
	        
 </style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>