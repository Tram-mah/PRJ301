/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Admin
 * Created: Mar 10, 2025
 */

-- Tạo database
CREATE DATABASE prj301_1820_workshop2
GO

-- Sử dụng database vừa tạo
USE prj301_1820_workshop2
GO

-- Tạo bảng tblUsers
CREATE TABLE tblUsers (
    username varchar(50) PRIMARY KEY,
    Name varchar(100) NOT NULL,
    password varchar(255) NOT NULL,
    Role VARCHAR(20) NOT NULL CHECK (Role IN ('Instructor', 'Student'))
);
GO

-- Thêm 3 người dùng mẫu với tên tiếng Việt
INSERT INTO tblUsers (username, Name, password, Role) VALUES
('nguyenan', N'Nguyễn An', 'password123', 'Student'),
('tranbinh', N'Trần Bình', 'securepass', 'Instructor'),
('phamcuong', N'Phạm Cường', '123456', 'Student'),
('lehoa', N'Lê Hoa', 'hoa789', 'Student'),
('dangthuy', N'Đặng Thúy', 'thuysecure', 'Instructor');
GO