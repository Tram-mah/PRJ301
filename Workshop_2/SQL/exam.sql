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
(1, 'Quiz', 'EnglishFunny', 1, 100, 30),
(2, 'Midterm', 'EnglishSame', 2, 50, 60),
(3, 'Final', 'EnglishMix', 3, 90, 120),
(4, 'Quiz', 'EnglishFunny', 4, 25, 45),
(5, 'Midterm ', 'EnglishSame', 5, 60, 100),
(6, 'Final', 'EnglishMix', 6, 95, 120);
GO
