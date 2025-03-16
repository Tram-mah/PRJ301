/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Admin
 * Created: Mar 10, 2025
 */

CREATE TABLE tblExams(
    exam_id INT PRIMARY KEY,
    exam_title VARCHAR(100) NOT NULL,
    Subject VARCHAR(50) NOT NULL,
    category_id INT NOT NULL,
    total_marks INT NOT NULL,
    Duration INT NOT NULL,
    CONSTRAINT FK_category FOREIGN KEY (category_id) REFERENCES tblExamCategories(category_id)
);
GO

INSERT INTO tblExams (exam_id, exam_title, Subject, category_id, total_marks, Duration) VALUES
(1, 'Quiz 1 - Toán', 'Mathematics', 1, 80, 30),
(2, 'Midterm - Lý', 'Physics', 2, 50, 60),
(3, 'Final - Hóa', 'Chemistry', 3, 100, 120),
(4, 'Quiz 2 - Anh', 'English', 1, 25, 35),
(5, 'Midterm - Sinh', 'Biology', 2, 60, 75);
GO
