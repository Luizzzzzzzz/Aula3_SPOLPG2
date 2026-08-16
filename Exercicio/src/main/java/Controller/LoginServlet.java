package Controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        
        // Autenticação definida no próprio código[cite: 1]
        if ("luiz".equals(user) && "123".equals(pass)) {
            HttpSession session = request.getSession();
            session.setAttribute("usuarioLogado", user);
            response.sendRedirect("cadastro.jsp");
        } else {
            response.sendRedirect("login.jsp?erro=1");
        }
    }
}