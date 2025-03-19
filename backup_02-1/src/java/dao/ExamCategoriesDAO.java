/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ExamCategoriesDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author mah
 */
public class ExamCategoriesDAO implements IDAO<ExamCategoriesDTO, String>{

    @Override
    public boolean create(ExamCategoriesDTO entity) {
        String sql = "INSERT INTO [dbo].[tblExamCategories] "
                + "([category_id], [category_name], [description]) "
                + "VALUES (?, ?, ?)";
//int category_id, String category_name, String description
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, entity.getCategory_id());
            ps.setString(2, entity.getCategory_name());
            ps.setString(3, entity.getDescription());
            int i = ps.executeUpdate();
            return i > 0;
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return false;
    }

    @Override
    public List<ExamCategoriesDTO> readAll() {
        List<ExamCategoriesDTO> result = new ArrayList<>();
        String sql = "SELECT * FROM tblExamCategories";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ExamCategoriesDTO ecdto = new ExamCategoriesDTO(
                        rs.getInt("category_id"),
                        rs.getString("category_name"),
                        rs.getString("description")
                );
                result.add(ecdto);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return result;
    }

    @Override
    public ExamCategoriesDTO readByID(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(ExamCategoriesDTO entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    

    @Override
    public boolean delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
//int category_id, String category_name, String description
    @Override
    public List<ExamCategoriesDTO> search(String searchTerm) {
        String sql = "SELECT * FROM tblExamCategories WHERE title category_name ? OR category_id ?";
        List<ExamCategoriesDTO> list = new ArrayList<ExamCategoriesDTO>();
        
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ExamCategoriesDTO ecdto = new ExamCategoriesDTO(
                        rs.getInt("category_id"),
                        rs.getString("category_name"),
                        rs.getString("description"));
                list.add(ecdto);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return list;
    }
    
}
