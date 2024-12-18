package com.edutecno.service;

import java.util.List;

import com.edutecno.dao.UsuarioDao;
import com.edutecno.modelo.Usuario;

public class LoginService {
	private UsuarioDao usuarioDao;

	public LoginService() {
		super();
		usuarioDao = new UsuarioDao();
		usuarioDao.getAll();
	}
	
	public List<Usuario> mostrarUsuario(){
		return usuarioDao.getAll();
	}
	
	
//	public boolean login(String username, String password) {
//		Usuario usuario = usuarioDao.getByUsername(username);
//		if(usuario == null) {
//			return false;
//		}
//		if(usuario.getPassword().equals(password)) {
//			return true;
//		}
//		return false;
//	}
	
}
