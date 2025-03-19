/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Admin
 * Created: Mar 10, 2025
 */
CREATE TABLE tblQuestions (
    question_id INT PRIMARY KEY,
    exam_id INT NOT NULL,
    question_text TEXT NOT NULL,
    option_a VARCHAR(100) NOT NULL,
    option_b VARCHAR(100) NOT NULL, 
    option_c VARCHAR(100) NOT NULL,
    option_d VARCHAR(100) NOT NULL,
    correct_option CHAR(1) NOT NULL CHECK (correct_option IN ('A', 'B', 'C', 'D')),
    CONSTRAINT FK_exam FOREIGN KEY (exam_id) REFERENCES tblExams(exam_id)
);
GO

INSERT INTO tblQuestions (question_id, exam_id, question_text, option_a, option_b, option_c, option_d, correct_option) VALUES
--Quiz1
(1, 1, 'What key does not lock the door?', 'Keyboard', 'Keycap', '7', 'Key words', 'C'), -- EnglishFunny (Quiz1)


--Quiz2
(2, 4, 'Which months have the 28th day?', 'February', 'January', 'All months', 'November', 'C'), -- EnglishFunny (Quiz2)


--Midterm1
(3, 2, 'Which is the synonym of "happy"?', 'Sturdy', 'Powerful', 'Challenging', 'Bright', 'D'), -- Synonymous (Midterm1) 


--Midterm2  
(4, 5, 'Which is the synonym of "Clever"?', 'Sad', 'Joyful', 'Angry', 'Bored', 'B'), -- Synonymous (Midterm2) 


--Final
(5, 3, 'What is a force measurement unit?', 'Newton', 'Joule', 'Watt', 'Pascal', 'A'), -- Multidisciplinary Integration (Final1)
(6, 6, 'Which element has a chemical Oxygen?', 'Au', 'Oxi', 'Ag', 'Fe', 'B'); -- Multidisciplinary Integration (Final2)
GO
