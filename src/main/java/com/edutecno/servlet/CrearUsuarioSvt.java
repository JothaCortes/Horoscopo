package com.edutecno.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

import com.edutecno.modelo.Usuario;
import com.edutecno.service.UsuarioService;

/**
 * Servlet implementation class CrearUsuarioSvt
 */
@WebServlet("/crearUsuario")
public class CrearUsuarioSvt extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UsuarioService usuarioService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CrearUsuarioSvt() {
        super();
        usuarioService = new UsuarioService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		int id = Integer.parseInt(request.getParameter("id"));
		String nombre = request.getParameter("nombre");
		String username = request.getParameter("username");
		String email = request.getParameter("email");

		Date fecha_nacimiento = null;
		String fechaParam = request.getParameter("fecha_nacimiento");

		if (fechaParam != null && !fechaParam.trim().isEmpty()) {
		    try {
		      
		        fecha_nacimiento = Date.valueOf(fechaParam);
		    } catch (IllegalArgumentException e) {
		        try {  
		            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy"); 
		            java.util.Date parsedDate = sdf.parse(fechaParam);
		            fecha_nacimiento = new Date(parsedDate.getTime());
		        } catch (ParseException parseEx) {
		            System.out.println("Invalid date format: " + fechaParam);
		           
		        }
		    }
		}
		String password = request.getParameter("password");
		String animal = request.getParameter("animal");
		
		Usuario usuario = new Usuario(id,nombre,username,email,fecha_nacimiento,password,animal);
		
		System.out.println(usuario);
		usuarioService.crearUsuario2(usuario);
		  try {
		        // After successful user creation
		        request.setAttribute("usuarioCreado", "true");
		        request.getRequestDispatcher("registroUsuario.jsp").forward(request, response);
		    } catch (Exception e) {
		        // Handle errors
		        request.setAttribute("usuarioCreado", "false");
		        request.setAttribute("errorMensaje", "No se pudo crear el usuario");
		        request.getRequestDispatcher("registroUsuario.jsp").forward(request, response);
		    }
	}

}
