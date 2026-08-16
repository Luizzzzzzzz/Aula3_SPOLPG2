<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.URLDecoder" %>
<%
    // Validação de Sessão
    if (session.getAttribute("usuarioLogado") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Cálculo do Total a partir dos cookies
    double valorTotal = 0;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if (c.getName().startsWith("prod_")) {
                String desc = URLDecoder.decode(c.getValue(), "UTF-8");
                String[] partes = desc.split("\\|");
                valorTotal += Double.parseDouble(partes[2]);
            }
        }
    }
%>
<html>
<head><title>Cadastro do Pedido</title></head>
<body bgcolor="#F0F4F8">
    <font face="Arial, Helvetica, sans-serif">
        <table width="100%" border="0">
            <tr>
                <td align="right">
                    <b>Bem-vindo(a)!</b> | <a href="LogoutServlet"><font color="red">Sair (Logout)</font></a>
                </td>
            </tr>
        </table>
        
        <center>
            <h2>Finalizar Compra</h2>
            <hr width="80%" color="#336699">
            
            <form action="FinalizarServlet" method="POST">
                <table border="1" cellpadding="10" cellspacing="0" bordercolor="#336699" bgcolor="#FFFFFF" width="60%">
                    <tr>
                        <td width="30%"><b>Nome completo:</b></td>
                        <td><input type="text" name="nome" size="40" required></td>
                    </tr>
                    <tr>
                        <td><b>CPF:</b></td>
                        <td><input type="text" name="cpf" required></td>
                    </tr>
                    <tr>
                        <td><b>Sexo:</b></td>
                        <td>
                            <input type="radio" name="sexo" value="Masculino" required> Masculino
                            <input type="radio" name="sexo" value="Feminino"> Feminino
                        </td>
                    </tr>
                    <tr>
                        <td><b>Endereço:</b></td>
                        <td><input type="text" name="endereco" size="40" required></td>
                    </tr>
                    <tr>
                        <td><b>Cidade:</b></td>
                        <td><input type="text" name="cidade" required></td>
                    </tr>
                    <tr>
                        <td><b>Estado:</b></td>
                        <td>
                            <select name="estado">
                                <option value="SP">SP</option>
                                <option value="RJ">RJ</option>
                                <option value="MG">MG</option>
                                <option value="ES">ES</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Forma de Pagamento:</b></td>
                        <td>
                            <input type="radio" name="pagamento" value="Cartão de Crédito" required> Cartão de Crédito<br>
                            <input type="radio" name="pagamento" value="Pix"> Pix<br>
                            <input type="radio" name="pagamento" value="Boleto Bancário"> Boleto Bancário
                        </td>
                    </tr>
                    <tr>
                        <td><b>Parcelamento:</b></td>
                        <td>
                            <select name="parcelamento">
                                <option value="1x de R$ <%= String.format("%.2f", valorTotal) %>">1 x R$ <%= String.format("%.2f", valorTotal) %></option>
                                <option value="2x de R$ <%= String.format("%.2f", valorTotal / 2) %>">2 x R$ <%= String.format("%.2f", valorTotal / 2) %></option>
                                <option value="3x de R$ <%= String.format("%.2f", valorTotal / 3) %>">3 x R$ <%= String.format("%.2f", valorTotal / 3) %></option>
                            </select>
                        </td>
                    </tr>
                </table>
                <br>
                <input type="submit" value=" Finalizar Compra ">
            </form>
        </center>
    </font>
</body>
</html>