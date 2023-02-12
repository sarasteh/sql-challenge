
CREATE TABLE "departments" (
    "dept_no" varchar(4) PRIMARY KEY  NOT NULL,
    "dept_name" varchar(20)  UNIQUE NOT NULL
    
);

CREATE TABLE "titles" (
    "title_id" varchar(5) PRIMARY KEY  NOT NULL,
    "title" varchar(20)  UNIQUE NOT NULL
);


CREATE TABLE "employees" (
    "emp_no" varchar(7) PRIMARY KEY  NOT NULL ,
    "emp_title_id" varchar(5),
    "birth_date" date  NOT NULL,
    "first_name" varchar(20)  NOT NULL, 
    "last_name" varchar(20)  NOT NULL,
    "sex" varchar(2)  NOT NULL,
    "hire_date" date  NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
    
);


CREATE TABLE "dept_emp" (
    "emp_no" varchar(7) ,
	"dept_no" varchar(4),
    PRIMARY KEY("dept_no","emp_no"),
	FOREIGN KEY ("dept_no") REFERENCES departments("dept_no"),
	FOREIGN KEY ("emp_no") REFERENCES employees("emp_no")
);


CREATE TABLE "dept_manager" (
    "dept_no" varchar(4) ,
    "emp_no" varchar(7)  ,
	PRIMARY KEY("dept_no","emp_no"),
	FOREIGN KEY ("dept_no") REFERENCES departments("dept_no"),
	FOREIGN KEY ("emp_no") REFERENCES employees("emp_no")
    
);

CREATE TABLE "salaries" (
    "emp_no" varchar(7) ,
    "salary" varchar(7)  NOT NULL,
	FOREIGN KEY ("emp_no") REFERENCES employees("emp_no")
    
);


