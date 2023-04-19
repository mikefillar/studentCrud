const encrypt = require('bcrypt');
const mysql = require('mysql2');
// const jwt = require('jsonwebtoken');
const db = mysql.createConnection(
    {
        database: process.env.DATABASE,
        host: process.env.DATABASE_HOST,
        user: process.env.DATABASE_USER,
        password: process.env.DATABASE_PASSWORD,
        port: process.env.DATABASE_PORT
    }
);

//for login account
exports.loginAccount = (req,res) => {
    const {email,password} = req.body;
    if(email == "" || password == "")
        {
            res.render('index',
                {
                    message: "Email or password is empty!",
                    color: "alert-danger"
                });
        }
    else
        {
        db.query('SELECT * FROM users where user_email = ?',[email], 
            (error,result)=>
                {
                    if(!result[0])
                        {
                            res.render('index', 
                                {
                                    message: "Login failed! Please try again.",
                                    color: "alert-danger"
                                });
                        }
                    else if (result[0].user_password !=password)
                        {
                            res.render('index', 
                                {
                                    message: "Login failed! Please try again.",
                                    color: "alert-danger"
                                });
                        }
                    else
                        {
                        db.query('CALL list_of_students()',
                        // db.query('Select * from students',
                            (error,data)=>
                                {
                                    if(error)
                                        {
                                            console.log("Error Message" + error);
                                        }
                                    else if(!data)
                                        {
                                            return res.render('viewStudents',
                                                {
                                                    message: "No data found",
                                                    color: "alert-warning"
                                                });
                                        }                                        
                                    else
                                        {
                                            // console.log(data);
                                            res.render('viewStudents',
                                                {
                                                    title: "List of students",
                                                    data: data[0],
                                                    color: "alert-info",
                                                    students: "Add Student"
                                                });
                                        }
                            })
                        }
        });
    }
}

//for adding students and for updating students
exports.addStudent = (req,res) => {
    let {student_id,first_name, last_name, email, course} = req.body;

    function valid(value)
        {
            value = value.charAt(0).toUpperCase() + value.slice(1).trim();
            return value;
        }
    first_name = valid(first_name);
    last_name = valid(last_name);
    email = email.trim();

    if(first_name == "" || last_name == "" || email == "" || course == "")
        {
            db.query('CALL list_of_students()',(err,data)=>
            {
                if(err)
                    {
                        console.log("Error Message: "+err);
                    }
                else
                    {
                        res.render('viewStudents',
                            {
                                students: "All fields are mandatory!",
                                title: "List of students",
                                color: "alert-danger",
                                data: data[0]
                            });
                    }
            });
        }
    
    //checks student_id input field if empty to add students
    if(student_id == "")
        {
            console.log("You can add students!");
            db.query('INSERT INTO students set ?',
            {
                first_name: first_name,
                last_name: last_name,
                email: email,
                course_id: course
            },
            (err,data)=>
                {
                    console.log(data);
                    if(err)
                        {
                            console.log("Error Message: "+err);
                        }
                    else
                        {
                            db.query('CALL list_of_students()',(err,data)=>
                                {
                                    if(err)
                                        {
                                            console.log("Error Message: "+err);
                                        }
                                    else
                                        {
                                            res.render('viewStudents',
                                                {
                                                    students: "Student Added Successfully!",
                                                    title: "List of students",
                                                    color: "alert-warning",
                                                    data: data[0]
                                                });
                                        }
                                });
                        }
                });
        }
    //checks student_id input field if not empty for updating student
    else
        {
            console.log("You can update students!");
            db.query('UPDATE students set course_id = ?, first_name = ?, last_name = ?, email =? where student_id = ?',
                [course,first_name,last_name,email,student_id],
                (err,result)=>
                    {
                        if(err)
                            {
                                console.log("Error Message : " + err)
                            }
                        else
                            {
                                db.query('CALL list_of_students()',(err,data)=>
                                {
                                    if(err)
                                        {
                                            console.log("Error Message: "+err);
                                        }
                                    else
                                        {
                                            console.log("Student added successfully!");
                                            res.render('viewStudents',
                                                {
                                                    students: "Student's data updated successfully!",
                                                    title: "List of students",
                                                    color: "alert-success",
                                                    data: data[0]
                                                });
                                        }
                                });
                            }
                    })
        }
    
}

//for retrieveing student to udpate
exports.update = (req,res) => {

    const id = req.params.student_id;
    db.query('SELECT * FROM students where student_id = ?',[id],(err,stud)=>
        {
            if(stud[0].course_id == 1)
                {
                    console.log("Hello 1");
                    db.query("CALL list_of_students",(err,data)=>
                        {
                            if(err)
                                {
                                    console.log("Error Message :" + err);
                                }
                            else
                                {
                                    res.render('viewStudents',
                                        {
                                            students: "Update Students",
                                            stud: stud[0],
                                            value: "1",
                                            title: "List of Student",
                                            color: "alert-warning",
                                            data: data[0]
                                        });
                                }
                        });
                }
            else if (stud[0].course_id == 2)
                {
                    console.log("Hello 2");
                    db.query("CALL list_of_students",(err,data)=>
                        {
                            if(err)
                                {
                                    console.log("Error Message :" + err);
                                }
                            else
                                {
                                    res.render('viewStudents',
                                        {
                                            students: "Update Students",
                                            stud: stud[0],
                                            value2: "2",
                                            title: "List of Student",
                                            color: "alert-warning",
                                            data: data[0]
                                        });
                                }
                        });
                }
            else
                {
                    console.log("Hello 3");
                    db.query("CALL list_of_students",(err,data)=>
                        {
                            if(err)
                                {
                                    console.log("Error Message :" + err);
                                }
                            else
                                {
                                    res.render('viewStudents',
                                        {
                                            students: "Update Students",
                                            stud: stud[0],
                                            value3: "3",
                                            title: "List of Student",
                                            color: "alert-warning",
                                            data: data[0]
                                        });
                                }
                        });
                }
            if(err)
                {
                    console.log("Error Message :" + err);
                }
            else
                {
                    
                }
        });
}

//for deleting student
exports.deleteStudent = (req,res) => {
    const id = req.params.student_id;
    db.query('DELETE from students where student_id = ?',[id],
        (err,result)=>
            {
                if(err)
                    {
                        console.log("Error Message : " + err)
                    }
                else
                    {
                        db.query('CALL list_of_students',
                            (err,data)=>
                                {
                                    if(err)
                                        {
                                            console.log("Error Message :" + err)
                                        }
                                    else
                                        {
                                            res.render('viewStudents',
                                                {
                                                    students: "Student's data successfully deleted!",
                                                    title: "List of students",
                                                    color: "alert-danger",
                                                    data: data[0]
                                                });
                                        }
                                });
                    }
            })
}