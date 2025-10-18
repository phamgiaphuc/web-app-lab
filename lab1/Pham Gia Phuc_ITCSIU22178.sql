CREATE TABLE departments (
    department_id INT NOT NULL AUTO_INCREMENT,
    department_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (department_id)
);

CREATE TABLE lecturers (
    lecturer_id INT NOT NULL AUTO_INCREMENT,
    lecturer_name VARCHAR(255) NOT NULL,
    department_id INT NOT NULL,
    PRIMARY KEY (lecturer_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE CASCADE
);

CREATE TABLE students (
    student_id INT NOT NULL AUTO_INCREMENT,
    dob DATE,
    student_name VARCHAR(255) NOT NULL,
    major VARCHAR(255),
    PRIMARY KEY (student_id)
);

CREATE TABLE courses (
    course_id INT NOT NULL AUTO_INCREMENT,
    course_name VARCHAR(255),
    PRIMARY KEY (course_id)
);

CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

CREATE TABLE lecturer_courses (
    lecturer_id INT,
    course_id INT,
    PRIMARY KEY (lecturer_id, course_id),
    FOREIGN KEY (lecturer_id) REFERENCES lecturers(lecturer_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);