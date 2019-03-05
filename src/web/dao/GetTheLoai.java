package web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import web.model.TheLoai;

public class GetTheLoai {

	public List<TheLoai> getTheLoai(){
		List<TheLoai> listTheLoai = new ArrayList<TheLoai>();
		
		Connection connection = JDBCConnection.myConnect();
		
		String sql = "SELECT * FROM theloai";
		
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				TheLoai sanPham = new TheLoai();
				sanPham.setiD(resultSet.getInt("id_theloai"));
				sanPham.setTenTheLoai(resultSet.getString("ten"));
				sanPham.setDanhMuc(resultSet.getInt("danhmuc"));
				
				listTheLoai.add(sanPham);				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		return listTheLoai;
	}
}
