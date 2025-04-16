/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prj301.pe.user;

/**
 *
 * @author hoadnt
 */
public class UserDTO {
    //[dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status])
    private String userID;
    private String fullName;
    private String password;
    private String roleID;
    private int status;

    public UserDTO() {
    }

    public UserDTO(String userID, String fullName, String password, String roleID, int status) {
        this.userID = userID;
        this.fullName = fullName;
        this.password = password;
        this.roleID = roleID;
        this.status = status;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "UserDAO{" + "userID=" + userID + ", fullName=" + fullName + ", password=" + password + ", roleID=" + roleID + ", status=" + status + '}';
    }
    

    
    
    
}
