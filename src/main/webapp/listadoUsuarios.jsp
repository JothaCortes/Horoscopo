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
 <%@ page import="java.util.List" %>
 <%@ page import="com.edutecno.modelo.Usuario" %>
 <%@ page import="com.edutecno.dao.UsuarioDao" %>
 
 <%
 	UsuarioDao dao = new UsuarioDao();
 	List<Usuario> usuarios = dao.getAll();
 %>
 
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Listado de Usuarios</title>
</head>
<body>
<style>
        .vh-80 {
            min-height: 80vh;
        }
    </style>
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
    <div class="container-fluid d-flex justify-content-center align-items-center vh-50">
        <div class="w-100">
            <div class="text-center mb-4">
                <h4 class="display-6">Listado de Usuarios</h4>
            </div>
            
            <div class="table-responsive">
                <table class="table table-striped table-hover table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Nombre Usuario</th>
                            <th>Correo</th>
                            <th>Fecha de Nacimiento</th>
                            <th>Contraseña</th>
                            <th>Animal</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for(Usuario usuario: usuarios) { %>
                        <tr>
                            <td><%= usuario.getId() %></td>
                            <td><%= usuario.getNombre() %></td>
                            <td><%= usuario.getUsername() %></td>
                            <td><%= usuario.getEmail() %></td>
                            <td><%= usuario.getFechaNacimiento() %></td>
                            <td><%= usuario.getPassword() %></td>
                            <td><%= usuario.getAnimal() %></td>
                            <td>                           
                               
                                <div class="btn-group" role="group">
                                
                                   <button class="btn btn-sm btn-danger" onclick="deleteUser('<%= usuario.getId() %>')">
									    <i class="bi bi-trash"></i> Eliminar
									</button>
                                    
                                    <button class="btn btn-sm btn-primary" onclick="editUser('<%= usuario.getId() %>')">
                                        <i class="bi bi-pencil"></i>Editar
                                    </button>
                                </div>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>

            <div class="text-center mt-3">
                <a href="inicio.jsp" class="btn btn-secondary">
                    <i class="bi bi-arrow-left me-2"></i>Volver
                </a>
            </div>
        </div>
    </div>
    

<script>
function editUser(id) {
    Swal.fire({
        icon: 'info',
        title: 'Funcionalidad no implementada',
        text: 'La edición de usuarios está pendiente de desarrollo',
        confirmButtonText: 'Entendido'
    });
}
</script>
<script>
function deleteUser(userId) {
    if(confirm('¿Está seguro de que desea eliminar este usuario?')) {
        fetch('EliminarUsuarioSvt', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: 'id=' + userId
        })
        .then(response => {
            // Read the response text
            return response.text();
        })
        .then(message => {
            if (response.ok) {
            	 const row = document.querySelector(`tr:has(td:first-child:contains('${userId}'))`);
                 if (row) {
                     row.remove();
                 }
                 alert(message || 'Usuario eliminado exitosamente');
            } else {
                alert('Error al eliminar el usuario');
            }
        })
  
    }
}
</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>