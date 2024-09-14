/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Priya
 */
public class insertMarks extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int rollno = Integer.parseInt(request.getParameter("rollno"));
        String name = request.getParameter("name");
        int html = Integer.parseInt(request.getParameter("html"));
        int css = Integer.parseInt(request.getParameter("css"));
        int js = Integer.parseInt(request.getParameter("js"));
        int java = Integer.parseInt(request.getParameter("java"));
        int python = Integer.parseInt(request.getParameter("python"));
        int android = Integer.parseInt(request.getParameter("android"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String DB_URL = "jdbc:mysql://localhost:3306/bca-sem-5b";
            Connection conn = DriverManager.getConnection(DB_URL, "root", "");

            String SQL = "INSERT INTO student_marks(rollno, name, html, css, js, java, python, android) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(SQL);

            stmt.setInt(1, rollno);
            stmt.setString(2, name);
            stmt.setInt(3, html);
            stmt.setInt(4, css);
            stmt.setInt(5, js);
            stmt.setInt(6, java);
            stmt.setInt(7, python);
            stmt.setInt(8, android);

            int isInserted = stmt.executeUpdate();
            
            if(isInserted > 0){
                response.sendRedirect("viewMarks.jsp");
            }
      
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
