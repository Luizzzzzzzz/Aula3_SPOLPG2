package Controller;

import java.io.IOException;
import java.net.URLEncoder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EnviaCookies")
public class EnviaCookies extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] produtos = request.getParameterValues("produtos");
        
        if (produtos != null) {
            for (int i = 0; i < produtos.length; i++) {
                // O valor vem no formato "imagem|descricao|preco"
                String valorCodificado = URLEncoder.encode(produtos[i], "UTF-8");
                Cookie cookie = new Cookie("prod_" + i, valorCodificado);
                cookie.setMaxAge(60 * 60); // Expira em 1 hora
                response.addCookie(cookie);
            }
        }
        // Direciona para autenticação após fechar o carrinho[cite: 1]
        response.sendRedirect("login.jsp");
    }
}