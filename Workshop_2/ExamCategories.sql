/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Admin
 * Created: Mar 10, 2025
 */

CREATE TABLE tblExamCategories(
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL CHECK (category_name IN ('Quiz', 'Midterm', 'Final')),
    description TEXT
);
GO

INSERT INTO tblExamCategories (category_id, category_name, description) VALUES
(1, 'Quiz', N'Bài kiểm tra ngắn để đánh giá kiến thức cơ bản'),
(2, 'Midterm', N'Bài kiểm tra giữa kỳ đánh giá tiến trình học tập'),
(3, 'Final', N'Bài kiểm tra cuối kỳ đánh giá toàn bộ kiến thức học kỳ'),
(4, 'Quiz', N'Bài kiểm tra nhanh trong lớp học'),
(5, 'Midterm', N'Bài kiểm tra giữa kỳ có tính điểm cao'),
(6, 'Final', N'Bài thi cuối kỳ với nhiều dạng câu hỏi');
GO
