package com.edutecno.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.edutecno.modelo.Horoscopo;
import com.edutecno.procesaconexion.ConexionDB;

public class HoroscopoDAO extends ConexionDB implements Dao<Horoscopo>{
	

	private Connection conn;
	
	public HoroscopoDAO() {
		super();
		conn = ConexionDB.generaConexion();
	}

	@Override
	public List<Horoscopo> getAll() {
		 List<Horoscopo> horoscopo = new ArrayList<>();
	        String consultaSql = "SELECT * FROM HOROSCOPO";
	        
	        
	        try (PreparedStatement pstm = conn.prepareStatement(consultaSql);
	             ResultSet rs = pstm.executeQuery()) {
	            
	            while (rs.next()) {
	                Horoscopo h = new Horoscopo(
	                	rs.getInt("id"),
	                    rs.getString("animal"), 
	                    rs.getDate("fecha_inicio"), 
	                    rs.getDate("fecha_fin")
	                );
	                horoscopo.add(h);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return horoscopo;
	}

	
	

	@Override
	public Horoscopo getById(int id) {
		Horoscopo horoscopo = new Horoscopo();
		String sql="SELECT * FROM HOROSCOPO WHERE ID = ?";
		try (PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				horoscopo.setId(rs.getInt("id"));
				horoscopo.setAnimal(rs.getString("animal"));
				horoscopo.setFechaInicio(rs.getDate("fecha_inicio"));
				horoscopo.setFechaFin(rs.getDate("fecha_fin"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return horoscopo;
	}
	
	
	
	@Override
	public void save(Horoscopo t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		
	}
}


