<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>Registro de Usuario - Horóscopo Chino</title>
    <style>
      
    </style>
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
                        <h3>Registro de usuario</h3>
                    </div>
                    <div class="card-body p-5">
                        <form action="CrearUsuarioSvt" method="post">
                            <input type="hidden" name="action" value="create">
                            
                            <div class="form-group mb-3">
                                <label for="id">ID:</label>
                                <input type="text" id="id" name="id" class="form-control" required>
                            </div>

                            <div class="form-group mb-3">
                                <label for="nombre">Nombre Completo:</label>
                                <input type="text" id="nombre" name="nombre" class="form-control" required>
                            </div>

                            <div class="form-group mb-3">
                                <label for="username">Nombre de Usuario:</label>
                                <input type="text" id="username" name="username" class="form-control" required>
                            </div>

                            <div class="form-group mb-3">
                                <label for="email">Correo Electrónico:</label>
                                <input type="email" id="email" name="email" class="form-control" required>
                            </div>

                            <div class="form-group mb-3">
                                <label for="fecha_nacimiento">Fecha de Nacimiento:</label>
                                <input type="date" id="fecha_nacimiento" name="fecha_nacimiento" class="form-control" required>
                            </div>

                            <div class="form-group mb-3">
                                <label for="password">Contraseña:</label>
                                <input type="password" id="password" name="password" class="form-control" required>
                            </div>

                            <div class="form-group mb-3">
                                <button type="submit" class="submit-btn">Registrarse</button>
                            </div>
                        </form>

                        <p class="text-center">¿Ya tienes cuenta? <a href="index.jsp">Inicia sesión aquí</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
      <!-- Success Modal -->
    <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                    <h5 class="modal-title" id="successModalLabel">Registro Exitoso</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    ¡Usuario creado con éxito! 
                    Serás redirigido al inicio de sesión.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="closeModalBtn">Aceptar</button>
                </div>
            </div>
        </div>
    </div>
     <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Check if user creation was successful
        <% 
        String usuarioCreado = (String) request.getAttribute("usuarioCreado");
        if (usuarioCreado != null && usuarioCreado.equals("true")) {
        %>
            document.addEventListener('DOMContentLoaded', function() {
                var successModal = new bootstrap.Modal(document.getElementById('successModal'));
                successModal.show();

                // Add event listener to redirect after modal closes
                document.getElementById('closeModalBtn').addEventListener('click', function() {
                    window.location.href = 'index.jsp';
                });

                document.getElementById('successModal').addEventListener('hidden.bs.modal', function () {
                    window.location.href = 'index.jsp';
                });
            });
        <% } %>
    </script>
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

        .form-control:focus, 
        .input-group-text:focus {
            border-color: #80bdff;
            box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
        }

        .submit-btn {
            transition: all 0.3s ease;
            background-color: #007bff;
            color: white;
            border: none;
            width: 100%;
            padding: 10px;
            border-radius: 5px;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            background-color: #0056b3;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>