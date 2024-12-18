package com.edutecno.procesaconexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class ConexionDB {

	 protected static Connection conn = null;
	 protected PreparedStatement pstm = null;
	 protected ResultSet rs = null;
	 
	 
	 public static Connection generaConexion(){
		 
		 String usr = "postgres";
		 String pwd = "1234";
		 String driver = ("org.postgresql.Driver");
		 String url = ("jdbc:postgresql://localhost:5432/DBHOROSCOPO");
		if(conn == null) {
		 try {
			 Class.forName(driver);
			 conn = DriverManager.getConnection(url, usr, pwd);	
		 }catch(Exception e) {
			 e.printStackTrace();
			 
		 }System.out.println("Se entrega nuevaConexion");
	}else {
		System.out.println("Se entrega conexion existente");
	}
		return conn;
	}
	 
	 public static void closeConnection() {
	        if (conn != null) {
	            try {
	                conn.close();
	                conn = null;
	                System.out.println("Conexión cerrada");
	            } catch (SQLException e) {
	                System.err.println("Error al cerrar la conexión");
	                e.printStackTrace();
	            }
	        }
	    }

	}
	
