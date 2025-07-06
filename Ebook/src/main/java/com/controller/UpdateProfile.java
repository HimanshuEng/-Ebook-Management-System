package com.controller;

import com.dao.DaoImpl;

import com.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class UpdateProfile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phno = request.getParameter("phno");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        DaoImpl dao = new DaoImpl();

        boolean isPasswordCorrect = dao.checkPassword(id, password);
        if (isPasswordCorrect) {
            User user = new User();
            user.setId(id);
            user.setName(name);
            user.setEmail(email);
            user.setPhno(phno);
            user.setPassword(password); // update same or new password

            boolean updated = dao.updateProfile(user);
            if (updated) {
                session.setAttribute("succMsg", "Profile Updated Successfully");
            } else {
                session.setAttribute("falMsg", "Something went wrong");
            }
        } else {
            session.setAttribute("falMsg", "Invalid Password");
        }

        response.sendRedirect("editProfile.jsp");
    }
}
