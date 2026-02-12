DROP TABLE IF EXISTS course_dependencies;

CREATE TABLE course_dependencies (
    course_id INTEGER NOT NULL,
    prerequisite_id INTEGER NOT NULL,
    PRIMARY KEY (course_id, prerequisite_id),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (prerequisite_id) REFERENCES courses(id)
);

INSERT INTO course_dependencies (course_id, prerequisite_id) VALUES
-- Computer Science
(2, 1), (3, 2), (4, 2), (5, 4), (7, 1), (8, 7), (75, 1), (76, 8), (77, 1), (79, 3),

-- Mathematics
(12, 11), (16, 12), (14, 13), (15, 11), (81, 12), (82, 13),

-- Physics
(18, 17), (19, 17), (20, 18), (83, 18), (84, 18),

-- Chemistry
(22, 21), (23, 21), (85, 23),

-- Biology / Medicine
(25, 24), (26, 25), (87, 26), (88, 28), (89, 29),

-- Law
(69, 68), (70, 69), (108, 70),

-- Nursing
(72, 71), (109, 71),

-- Economics
(42, 41), (43, 41), (99, 43), (98, 42),

-- Philosophy
(63, 62), (64, 62), (106, 63),

-- Education
(74, 73);