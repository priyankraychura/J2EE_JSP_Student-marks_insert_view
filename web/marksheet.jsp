<%-- 
    Document   : marksheet
    Created on : 17-Sept-2024, 6:04:06 pm
    Author     : Priya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Marksheet</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<style>
    body{
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .wrapper{
        width: 440px;
        /* border: 1px solid red; */
        border-radius: 8px;
        padding: 10px 20px;
        background-color: #a3c4e0;
        box-shadow: 4px 4px 26px -1px rgba(0,0,0,0.42);
    }

    .collage-name{
        border-bottom: 1px solid rgba(0, 0, 0, 0.233);
    }

    .collage-name h1{
        font-size: 26px;
    }

    .collage-name span{
        font-size: 18px;
        letter-spacing: 1px;
    }
    .student-details{
        padding: 10px;
    }
    .student-details h3{
        font-size: 16px;
    }
    .table{
        /* border-radius: 8px; */
        overflow: hidden;
    }
    .table td, .table th{
        background-color: transparent;
    }

</style>
        <%!            
            int id;
            int rollno;
            String name;
            int html;
            int css;
            int js;
            int java;
            int python;
            int android;
            int total;
            float percentage;
            String result = "Pass";
        %>
    <%
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        String DB_URL = "jdbc:mysql://localhost:3306/bca-sem-5b";
        Connection conn = DriverManager.getConnection(DB_URL, "root", "");

        String SQL = "SELECT * FROM student_marks WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(SQL);
        stmt.setInt(1, studentId);
        
        ResultSet rs = stmt.executeQuery();

        while(rs.next()){
            rollno = rs.getInt("rollno");
            name = rs.getString("name");
            html = rs.getInt("html");
            css = rs.getInt("css");
            js = rs.getInt("js");
            java = rs.getInt("java");
            python = rs.getInt("python");
            android = rs.getInt("android");
        }
        
        total = html + css + js + java + python + android;
        percentage = ((float)total / 600) * 100;
        
        if(html < 35 || css < 35 || js < 35 || java < 35 || python < 35 || android < 35){
            result = "Fail";
        }
        
        rs.close();
        stmt.close();
        conn.close();           
    %>
<body>
    <div class="wrapper py-2">
        <div class="collage-name d-flex flex-column align-items-center p-2 py-3">
            <h1>Christ College, Rajkot</h1>
            <span>There comes some tagline</span>
        </div>
        <div class="student-details d-flex px-3 py-2 justify-content-between align-items-center">
            <h3 class="mt-1 w-50">Roll no: <%= rollno %></h3>
            <h3 class="mt-1 w-75">Name: <%= name %></h3>
        </div>
        <div class="marks">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">Sub Name</th>
                        <th scope="col">Total marks</th>
                        <th scope="col">Marks obtained</th>
                    </tr>
                </thead>
                <tbody class="text-center">
                    <tr>
                        <td scope="row">HTML</td>
                        <td>100</td>
                        <td><%= html %></td>
                    </tr>
                    <tr>
                        <td scope="row">CSS</td>
                        <td>100</td>
                        <td><%= css %></td>
                    </tr>
                    <tr>
                    <tr>
                        <td scope="row">Javascript</td>
                        <td>100</td>
                        <td><%= js %></td>
                    </tr>
                    <tr>
                        <td scope="row">Java</td>
                        <td>100</td>
                        <td><%= java %></td>
                    </tr>
                    <tr>
                        <td scope="row">Python</td>
                        <td>100</td>
                        <td><%= python %></td>
                    </tr>
                    </tr>
                    <td scope="row">Android</td>
                        <td>100</td>
                        <td><%= android %></td>
                    </tr>
                    <tr>
                        <td></td>
                        <th>Total</th>
                        <td><%= total %></td>
                    </tr>
                    <tr>
                        <td></td>
                        <th>Percentage</th>
                        <td><%= percentage %>%</td>
                    </tr>
                    <tr>
                        <td></td>
                        <th>Result</th>
                        <td><%= result %></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>
