package com.edutecno.modelo;

import java.sql.Date;

public class Usuario {
	private int id;
    private String nombre;
    private String username;
    private String email;
    private Date fechaNacimiento;
    private String password;
    private String animal;
    //private Horoscopo horoscopo; 
    
    
	public Usuario(int id, String nombre, String username, String email, Date fechaNacimiento, String password,
			String animal) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.username = username;
		this.email = email;
		this.fechaNacimiento = fechaNacimiento;
		this.password = password;
		this.animal = animal;
		//this.horoscopo = horoscopo;
	}
	
	
	public Usuario() {
		super();
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}
	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}


	public String getAnimal() {
		return animal;
	}


	public void setAnimal(String animal) {
		this.animal = animal;
	}


	@Override
	public String toString() {
		return String.format(
				"Usuario [id=%s, nombre=%s, username=%s, email=%s, fechaNacimiento=%s, password=%s, animal=%s]", id,
				nombre, username, email, fechaNacimiento, password, animal);
	}
	
//	 public Horoscopo getHoroscopo() {
//	        return horoscopo;
//	    }
//
//	    public void setHoroscopo(Horoscopo horoscopo) {
//	        this.horoscopo = horoscopo;
//	    }


//		@Override
//		public String toString() {
//			return String.format(
//					"Usuario [id=%s, nombre=%s, username=%s, email=%s, fechaNacimiento=%s, password=%s, horoscopo=%s]",
//					id, nombre, username, email, fechaNacimiento, password, horoscopo);
//		}
//	 
	   
    
    
}
