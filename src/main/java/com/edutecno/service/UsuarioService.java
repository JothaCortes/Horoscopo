package com.edutecno.service;

import com.edutecno.dao.UsuarioDao;
import com.edutecno.modelo.Usuario;

public class UsuarioService {
	private UsuarioDao usuarioDao;

	public UsuarioService() {
		super();
		usuarioDao = new UsuarioDao();
		usuarioDao.getAll();
	}
	public void crearUsuario(Usuario usuario){
		usuarioDao.save(usuario);
	}
	public void crearUsuario2(Usuario usuario){
		usuarioDao.save2(usuario);
	}
	public void obtenerById(int id) {
		usuarioDao.getById(id);
	}
}
