package com.edutecno.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.edutecno.modelo.Usuario;
import com.edutecno.procesaconexion.ConexionDB;

public class UsuarioDao extends ConexionDB implements Dao<Usuario>{
	static private List<Usuario> usuarios;
	private Connection conn;
	private HoroscopoDAO horoscopoDAO;

	
	
	public UsuarioDao() {
		super();
		conn = ConexionDB.generaConexion();
		usuarios = new ArrayList<>();
	}

	@Override
	public List<Usuario> getAll() {
		List<Usuario> usuarios = new ArrayList<>();
	    String sql = "SELECT * FROM USUARIOS";
	    
	    try ( PreparedStatement stmt = conn.prepareStatement(sql);
	         ResultSet rs = stmt.executeQuery()) {
	        
	        while (rs.next()) {
	            Usuario usuario = new Usuario();
	            usuario.setId(rs.getInt("id"));
	            usuario.setNombre(rs.getString("nombre"));
	            usuario.setUsername(rs.getString("username"));
	            usuario.setEmail(rs.getString("email"));
	            usuario.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
	            usuario.setPassword(rs.getString("password"));
	            usuario.setAnimal(rs.getString("animal"));
	            
	            //usuario.setHoroscopo(rs.getString("horoscopo"));
//                int idH = rs.getInt("id");
//	            Horoscopo horoscopo = horoscopoDAO.getById(idH);
//	            usuario.setHoroscopo(horoscopo);

	            usuarios.add(usuario);
	        }
	    } catch (SQLException e) {
	        // Proper error handling
	        System.err.println("Error retrieving users: " + e.getMessage());
	        e.printStackTrace();
	    }
	    
	    return usuarios;
	}

	@Override
	public Usuario getById(int id) {
		
		Usuario usuario = new Usuario();
		String sql="SELECT * FROM usuarios WHERE id = ?";
		try (PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				usuario.setId(rs.getInt("id"));
				usuario.setNombre(rs.getString("nombre"));
				usuario.setUsername(rs.getString("username"));
				usuario.setEmail(rs.getString("email"));
				usuario.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
				usuario.setPassword(rs.getString("password"));
				usuario.setAnimal(rs.getString("animal")); 				
			}
		} catch (SQLException e) {
			 System.err.println("Error al obtener usuario: " + e.getMessage());
			e.printStackTrace();
		}
		return usuario;
	}
	
//	public Usuario getByUsername(String username) {
//		for(Usuario usuario: usuarios) {
//			if(usuario.getUsername().equals(username)) {
//				return usuario;
//			}
//		}return null;
//	}
//	
	public Usuario findByUsername(String username) {
	    try {
	   
	        String sql = "SELECT * FROM usuarios WHERE username = ?";
	       
	        PreparedStatement stmt = conn.prepareStatement(sql);
	        stmt.setString(1, username);
	        
	        ResultSet rs = stmt.executeQuery();
	        if (rs.next()) {
	            Usuario usuario = new Usuario();
	            usuario.setId(rs.getInt("id"));
				usuario.setNombre(rs.getString("nombre"));
				usuario.setUsername(rs.getString("username"));
				usuario.setEmail(rs.getString("email"));
				usuario.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
				usuario.setPassword(rs.getString("password"));
				usuario.setAnimal(rs.getString("animal")); 
	            return usuario;
	        }
	    } catch (SQLException e) {
	        // Log the error
	        e.printStackTrace();
	    }
	    return null;
	}
	@Override
	public void save(Usuario t) {
		
		String sql = "INSERT INTO USUARIOS VALUES(?,?,?,?,?,?,?)";
		
		try(PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setInt   (1, t.getId());
			stmt.setString(2, t.getNombre());
			stmt.setString(3, t.getUsername());
			stmt.setString(4, t.getEmail());
			stmt.setDate(5, t.getFechaNacimiento());
			stmt.setString(6, t.getPassword());
			stmt.setString(7, t.getAnimal());			
			stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	public String obtenerAnimalZodiaco(Date fecha_nacimiento) {
	    String sql = "SELECT animal FROM HOROSCOPO WHERE ? BETWEEN fecha_inicio AND fecha_fin";
	    
	    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setDate(1, fecha_nacimiento);
	        
	        try (ResultSet rs = pstmt.executeQuery()) {
	            if (rs.next()) {
	                return rs.getString("animal");
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return calcularAnimalZodiaco(fecha_nacimiento);
	}
	
	public String calcularAnimalZodiaco(Date fecha_nacimiento) {
	    Calendar cal = Calendar.getInstance();
	    cal.setTime(fecha_nacimiento);
	    int year = cal.get(Calendar.YEAR);
	    
	    String[] animales = {
	        "Rata", "Buey", "Tigre", "Conejo", "Dragón", "Serpiente", 
	        "Caballo", "Cabra", "Mono", "Gallo", "Perro", "Cerdo"
	    };
	    
	    return animales[(year - 1900) % 12];
	}
	
	
	public void save2(Usuario t) {
		
		String sql = "INSERT INTO USUARIOS VALUES(?,?,?,?,?,?,?)";
		
		try(PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setInt   (1, t.getId());
			stmt.setString(2, t.getNombre());
			stmt.setString(3, t.getUsername());
			stmt.setString(4, t.getEmail());
			stmt.setDate(5, t.getFechaNacimiento());
			stmt.setString(6, t.getPassword());
			
			String animal = obtenerAnimalZodiaco(t.getFechaNacimiento());
	        stmt.setString(7, animal);
			
			stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void delete(int id) {
		 String sql = "DELETE FROM usuarios WHERE id = ?";
	        
		 try (PreparedStatement stmt = conn.prepareStatement(sql)) {
				stmt.setInt(1, id);    
	        	stmt.executeUpdate();
	        		            
	        } catch (SQLException e) {
	        	 System.err.println("Error al eliminar usuario: " + e.getMessage());
	             throw new RuntimeException("No se pudo eliminar el usuario", e);     
	        }	
	}
	public void update(Usuario usuario) {
		String sql = "UPDATE usuarios SET " +
				     "nombre = ?, " +
                     "username = ?, " +
                     "email = ?, " +
                     "fecha_nacimiento = ?, " +
                     "password= ?, "+
                     "animal = ? " +
                     "WHERE id = ?";
		
		try (PreparedStatement stmt = conn.prepareStatement(sql)) {
			 stmt.setString(1, usuario.getNombre());
	            stmt.setString(2, usuario.getUsername());
	            stmt.setString(3, usuario.getEmail());
	            stmt.setDate(4, usuario.getFechaNacimiento());
	            stmt.setString(5,usuario.getPassword());
	            stmt.setString(6, usuario.getAnimal());
	            stmt.setInt(7, usuario.getId());
			stmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("Error al actualizar usuario: " + e.getMessage());
			e.printStackTrace();
		}
	}
}
