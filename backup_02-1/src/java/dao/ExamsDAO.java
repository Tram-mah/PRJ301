/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ExamsDTO;
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
public class ExamsDAO implements IDAO<ExamsDTO, String> {
//[exam_id], [exam_title], [Subject], [category_id], [total_marks]

    @Override
    public boolean create(ExamsDTO entity) {
        String sql = "INSERT INTO [dbo].[tblExams] "
                + "([exam_id], [exam_title], [Subject], [category_id], [total_marks]) "
                + "VALUES (?, ?, ?, ?, ?)";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, entity.getExam_id());
            ps.setString(2, entity.getExam_title());
            ps.setString(3, entity.getSubject());
            ps.setInt(4, entity.getCategory_id());
            ps.setInt(5, entity.getTotal_marks());
            int i = ps.executeUpdate();
            return i > 0;
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return false;
    }
//[exam_id], [exam_title], [Subject], [category_id], [total_marks]

    @Override
    public List<ExamsDTO> readAll() {
        List<ExamsDTO> result = new ArrayList<>();
        String sql = "SELECT * FROM tblExams";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ExamsDTO edto = new ExamsDTO(
                        rs.getInt("exam_id"),
                        rs.getString("exam_title"),
                        rs.getString("Subject"),
                        rs.getInt("category_id"),
                        rs.getInt("total_marks")
                );
                result.add(edto);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return result;
    }

    @Override
    public ExamsDTO readByID(String id) {
        String sql = "SELECT * FROM tblExams WHERE exam_id = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ExamsDTO edto = new ExamsDTO(
                        rs.getInt("exam_id"),
                        rs.getString("exam_title"),
                        rs.getString("Subject"),
                        rs.getInt("category_id"),
                        rs.getInt("total_marks")
                );
                return edto;
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return null;
    }

    @Override
    public boolean update(ExamsDTO entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
//[exam_id], [exam_title], [Subject], [category_id], [total_marks]

    @Override
    public List<ExamsDTO> search(String searchTerm) {
        List<ExamsDTO> result = new ArrayList<>();
        String sql = "SELECT * FROM tblExams WHERE exam_title LIKE ? OR Subject LIKE ? OR category_id LIKE ?";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            String param = "%" + searchTerm + "%";
            ps.setString(1, param);
            ps.setString(2, param);
            ps.setString(3, param);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ExamsDTO edto = new ExamsDTO(
                        rs.getInt("exam_id"),
                        rs.getString("exam_title"),
                        rs.getString("Subject"),
                        rs.getInt("category_id"),
                        rs.getInt("total_marks")
                );
                result.add(edto);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return result;
    }

    public List<ExamsDTO> searchByTitle(String searchTerm) {
        List<ExamsDTO> result = new ArrayList<>();
        String sql = "SELECT * FROM tblExams WHERE exam_title LIKE ?";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ExamsDTO edto = new ExamsDTO(
                        rs.getInt("exam_id"),
                        rs.getString("exam_title"),
                        rs.getString("Subject"),
                        rs.getInt("category_id"),
                        rs.getInt("total_marks")
                );
                result.add(edto);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return result;
    }

    public List<ExamsDTO> searchByTitle2(String searchTerm) {
        List<ExamsDTO> result = new ArrayList<>();
        String sql = "SELECT * FROM tblExams WHERE exam_title LIKE ? AND category_id>0";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ExamsDTO edto = new ExamsDTO(
                        rs.getInt("exam_id"),
                        rs.getString("exam_title"),
                        rs.getString("Subject"),
                        rs.getInt("category_id"),
                        rs.getInt("total_marks")
                );
                result.add(edto);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return result;
    }

}
