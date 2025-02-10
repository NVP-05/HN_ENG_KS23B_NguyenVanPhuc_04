CREATE DATABASE hackathon;
USE hackathon;

CREATE TABLE tbl_students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    address VARCHAR(255)
);

CREATE TABLE tbl_teachers (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE tbl_courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    teacher_id INT,
    start_date DATE,
    end_date DATE,
    tuition_fee DECIMAL(10,2),
    FOREIGN KEY (teacher_id) REFERENCES tbl_teachers(teacher_id) ON DELETE SET NULL
);

CREATE TABLE tbl_enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    status ENUM('Active', 'Completed', 'Cancelled') NOT NULL DEFAULT 'Active',
    FOREIGN KEY (student_id) REFERENCES tbl_students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES tbl_courses(course_id) ON DELETE CASCADE
);

CREATE TABLE tbl_schedules (
    schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT,
    teacher_id INT,
    class_date DATETIME,
    room VARCHAR(50),
    FOREIGN KEY (course_id) REFERENCES tbl_courses(course_id) ON DELETE CASCADE,
    FOREIGN KEY (teacher_id) REFERENCES tbl_teachers(teacher_id) ON DELETE SET NULL
);


INSERT INTO tbl_students (student_id ,student_name, phone, email, address) 
VALUES 
    (1, 'Nguyễn Văn Phúc', '0962854080', 'mkPhuc1@gmail.com', 'Hà Nội'),
    (2, 'Nguyễn Văn An', '0955555555', 'mkPhuc12@gmail.com', 'Hà Nội'),
    (3, 'Nguyễn Văn Nhất', '0964444444', 'mkPhuc13@gmail.com', 'Hà Nội'),
    (4, 'Nguyễn Văn Minh', '0963333333', 'mkPhuc14@gmail.com', 'Hà Nội'),
    (5, 'Nguyễn Văn Quân', '0962222222', 'mkPhuc15@gmail.com', 'Hà Nội');


INSERT INTO tbl_teachers (teacher_id, teacher_name, specialization, phone, email) 
VALUES 
    (1, 'Nguyễn Văn Quang', 'Lập trình C', '0961111111', 'quang@gmail.com'),
    (2, 'Nguyễn Văn Hưởng', 'Lập trình C++', '0962222222', 'huong@gmail.com'),
    (3, 'Nguyễn Văn Hai', 'Lập trình JavaScript', '0963333333', 'hai@gmail.com'),
    (4, 'Nguyễn Văn Cường', 'Lập trình Scratch', '0964444444', 'cuong@gmail.com'),
    (5, 'Nguyễn Văn Phú', 'Lập trình Web', '0965555555', 'phu@gmail.com');


INSERT INTO tbl_courses (course_name, teacher_id, start_date, end_date, tuition_fee) 
VALUES 
    ('Code C', 1, '2025-03-01', '2025-06-01', 10000000.00),
    ('Code CPP', 2, '2025-04-15', '2025-07-15', 12000000.00),
    ('Code JS', 3, '2025-05-10', '2025-08-10', 13000000.00),
    ('Code Scratch', 4, '2025-06-20', '2025-09-20', 14000000.00),
    ('Code Dạo', 5, '2025-07-05', '2025-10-05', 15000000.00);


INSERT INTO tbl_enrollments (enrollment_id, student_id, course_id, enrollment_date, status)
VALUES
    (1, 1, 1, '2025-03-01', 'Active'),
    (2, 2, 2, '2025-04-15', 'Active'),
    (3, 3, 3, '2025-05-10', 'Completed'),
    (4, 4, 4, '2025-06-20', 'Active'),
    (5, 5, 5, '2025-07-05', 'Cancelled');
    
INSERT INTO tbl_schedules (schedule_id, course_id, teacher_id, class_date, room)
VALUES
    (1, 1, 1, '2025-03-01', '401'),
    (2, 2, 2, '2025-04-15', '402'),
    (3, 3, 3, '2025-05-10', '403'),
    (4, 4, 4, '2025-06-20', '404'),
    (5, 5, 5, '2025-07-05', '405');

-- 2.1
ALTER TABLE tbl_enrollments 
ADD COLUMN discount DECIMAL(10,2);

-- 2.2
ALTER TABLE tbl_students 
MODIFY COLUMN phone VARCHAR(15);

-- 2.3
ALTER TABLE tbl_courses 
DROP COLUMN tuition_fee;

-- 3
INSERT INTO tbl_students (student_name, phone, email, address)
VALUES 
    ('Nguyễn Văn H', '0333333333', 'a@gmail.com', 'Hà Nội'),
    ('Trần Thị B', '044444444444', 'b@gmail.com', 'Hồ Chí Minh'),
    ('Lê Văn C', '0666666666', 'c@gmail.com', 'Đà Nẵng'),
    ('Hoàng Thị D', '05555555555', 'd@gmail.com', 'Hải Phòng'),
    ('Phạm Văn E', '01111111111', 'e@gmail.com', 'Cần Thơ');

INSERT INTO tbl_teachers (teacher_name, specialization, phone, email)
VALUES 
    ('Thầy An', 'Lập trình C', '0911111111', 'an@gmail.com'),
    ('Cô Bình', 'Lập trình C++', '0922222222', 'binh@gmail.com'),
    ('Thầy Chính', 'JavaScript', '0933333333', 'chinh@gmail.com'),
    ('Thầy Dũng', 'Scratch', '0944444444', 'dung@gmail.com'),
    ('Cô Hoa', 'Lập trình Python', '0955555555', 'hoa@gmail.com');

INSERT INTO tbl_courses (course_name, teacher_id, start_date, end_date) 
VALUES 
    ('Code C', 1, '2025-03-01', '2025-06-01'),
    ('Code CPP', 2, '2025-04-15', '2025-07-15'),
    ('Code JS', 3, '2025-05-10', '2025-08-10'),
    ('Code Scratch', 4, '2025-06-20', '2025-09-20'),
    ('Code Dạo', 5, '2025-07-05', '2025-10-05');

INSERT INTO tbl_enrollments (student_id, course_id, enrollment_date, status)
VALUES 
    ( 1, 1, '2025-03-02', 'Active'),
    ( 1, 3, '2025-03-10', 'Active'), 
    ( 2, 2, '2025-04-16', 'Completed'),
    ( 3, 4, '2025-06-21', 'Active'),
    ( 4, 5, '2025-07-06', 'Cancelled');


INSERT INTO tbl_schedules ( course_id, teacher_id, class_date, room)
VALUES 
    ( 1, 1, '2025-03-05 08:00:00', 'P101'),
    ( 2, 2, '2025-04-18 09:30:00', 'P202'),
    ( 3, 3, '2025-05-12 14:00:00', 'P303'),
    ( 4, 4, '2025-06-25 10:00:00', 'P404'),
    ( 5, 5, '2025-07-10 13:30:00', 'P505');


-- 4.a
SELECT 
    c.course_id AS "Mã khóa học",
    c.course_name AS "Tên khóa học",
    t.teacher_name AS "Giảng viên phụ trách",
    c.start_date AS "Ngày bắt đầu",
    c.end_date AS "Ngày kết thúc"
FROM tbl_courses c
JOIN tbl_teachers t ON c.teacher_id = t.teacher_id;

-- 4.b
SELECT DISTINCT 
    s.student_id AS "Mã học viên",
    s.student_name AS "Tên học viên",
    s.phone AS "Số điện thoại",
    s.email AS "Email",
    s.address AS "Địa chỉ"
FROM tbl_students s
JOIN tbl_enrollments e ON s.student_id = e.student_id;

-- 5.a 
SELECT 
    t.teacher_name AS "Tên giảng viên",
    COUNT(c.course_id) AS "Số lượng khóa học"
FROM tbl_teachers t
LEFT JOIN tbl_courses c ON t.teacher_id = c.teacher_id
GROUP BY t.teacher_id, t.teacher_name;

-- 5.b 
SELECT 
    c.course_name AS "Tên khóa học",
    COUNT(e.student_id) AS "Số lượng học viên"
FROM tbl_courses c
LEFT JOIN tbl_enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

-- 6.a 
SELECT 
    s.student_name AS "Tên học viên",
    COUNT(e.course_id) AS "Số lượng khóa học đã đăng ký"
FROM tbl_students s
JOIN tbl_enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.student_name;

-- 6.b 
SELECT 
    s.student_name AS "Tên học viên",
    COUNT(e.course_id) AS "Số lượng khóa học đã đăng ký"
FROM tbl_students s
JOIN tbl_enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.student_name
HAVING COUNT(e.course_id) >= 2;

-- 7



