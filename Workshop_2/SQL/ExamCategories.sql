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
(1, 'Quiz', 'Multichoice-Short test in class by your Instructor'),
(2, 'Midterm', 'The midterm exam-An assessment given halfway through an academic term'),
(3, 'Final', 'Final exam-The final test in the end of the course'),
(4, 'Quiz', 'Multichoice-Short test in class by your Instructor'),
(5, 'Midterm', 'The midterm exam-An assessment given halfway through an academic term'),
(6, 'Final', 'Final exam-The final test in the end of the course');
GO