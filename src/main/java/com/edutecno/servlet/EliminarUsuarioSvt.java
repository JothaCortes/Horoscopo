package com.edutecno.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


import com.edutecno.dao.UsuarioDao;

/**
 * Servlet implementation class EliminarUsuarioSvt
 */
public class EliminarUsuarioSvt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminarUsuarioSvt() {
        super();
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
		 try {
         UsuarioDao usuarioDao = new UsuarioDao();
         usuarioDao.delete(id);
         response.setStatus(HttpServletResponse.SC_OK);
         response.getWriter().write("Usuario eliminado exitosamente");
		 } catch (Exception e) {
	            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	            response.getWriter().write("Error al eliminar usuario");
	      }
}
}