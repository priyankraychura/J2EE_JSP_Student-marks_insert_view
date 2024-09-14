<%-- 
    Document   : viewMarks.jsp
    Created on : 14-Sept-2024, 7:21:01 pm
    Author     : Priya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>View Marksheet</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <div class="container mt-5">
            <div class="d-flex align-items-center justify-content-between my-2">
                <h3>Students List with Marks</h3>
                <a href="addMarks.html" class="btn btn-sm btn-primary">Add New</a>
            </div>
            <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Roll no.</th>
                    <th scope="col">Name</th>
                    <th scope="col">HTML</th>
                    <th scope="col">CSS</th>
                    <th scope="col">JavaScript</th>
                    <th scope="col">Java</th>
                    <th scope="col">Python</th>
                    <th scope="col">Android</th>
                    <th scope="col">Total</th>
                    <th scope="col">Percentage</th>
                    <th scope="col">Pass/Fail</th>

                </tr>
            </thead>
            <tbody class="table-group-divider">
                <%
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String DB_URL = "jdbc:mysql://localhost:3306/bca-sem-5b";
                    Connection conn = DriverManager.getConnection(DB_URL, "root", "");

                    String SQL = "SELECT * FROM student_marks";
                    PreparedStatement stmt = conn.prepareStatement(SQL);
                    ResultSet rs = stmt.executeQuery();

                    while(rs.next()){
                        int total = rs.getInt("html") + rs.getInt("css") + rs.getInt("js") + rs.getInt("java") + rs.getInt("python") + rs.getInt("android");
                        float percentage = ((float)total / 600) * 100;
                        
                        String result = "Pass";
                        if(rs.getInt("html") < 35 || rs.getInt("css") < 35 || rs.getInt("js") < 35 || rs.getInt("java") < 35 || rs.getInt("python") < 35 || rs.getInt("android") < 35){
                            result = "Fail";
                        }
                %>
                <tr>
                    <th scope="row"><%= rs.getInt("id") %></th>
                    <td><%= rs.getInt("rollno")%></td>
                    <td><%= rs.getString("name")%></td>
                    <td><%= rs.getInt("html")%></td>
                    <td><%= rs.getInt("css")%></td>
                    <td><%= rs.getInt("js")%></td>
                    <td><%= rs.getInt("java")%></td>
                    <td><%= rs.getInt("python")%></td>
                    <td><%= rs.getInt("android")%></td>
                    <td><%= total %></td>
                    <td><%= percentage %>%</td>
                    <td><%= result %></td>
                </tr>
                <%
                        } 
                    rs.close();
                    stmt.close();
                    conn.close();
                %>
            </tbody>
        </table>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
