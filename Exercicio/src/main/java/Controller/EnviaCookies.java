package Controller;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/EnviaCookies")
public class EnviaCookies extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {

                //tem que salvar em cookies o caminho da imagem, a descrição e o preço dos produtos selecionados
            }
        }