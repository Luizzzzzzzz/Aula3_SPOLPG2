package Controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/FinalizarServlet")
public class FinalizarServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        // Coletando dados (poderiam ser salvos no banco, mas o exercício pede apenas apresentação)
        String pagamento = request.getParameter("pagamento");
        String parcelamento = request.getParameter("parcelamento");
        
        request.setAttribute("pagamento", pagamento);
        request.setAttribute("parcelamento", parcelamento);
        
        request.getRequestDispatcher("sucesso.jsp").forward(request, response);
    }
}