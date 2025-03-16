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
(1, 1, 'Số nào là số nguyên tố?', '4', '6', '7', '9', 'C'), -- SỐ nào là số nguyên tố: 7 là số nguyên tố nên đáp án C
(2, 1, 'Kết quả của 5 + 3 × 2 là?', '16', '11', '10', '13', 'B'), -- 
(3, 2, 'Vật lý: Đơn vị đo lực là gì?', 'Newton', 'Joule', 'Watt', 'Pascal', 'A'),
(4, 3, 'Nguyên tố nào có ký hiệu hóa học là O?', 'Vàng', 'Oxi', 'Bạc', 'Sắt', 'B'),
(5, 4, 'Which is the synonym of "happy"?', 'Sad', 'Joyful', 'Angry', 'Bored', 'B')
(5, 5, '[日本語]?', 'Tiếng Quảng', 'Tiếng Tây Ban Nha', 'Tiếng Nhât', 'Tiếng Trung', 'C');
GO