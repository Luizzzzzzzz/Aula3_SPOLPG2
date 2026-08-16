<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.URLDecoder" %>
<%
    if (session.getAttribute("usuarioLogado") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head><title>Compra Realizada</title></head>
<body bgcolor="#F0F4F8">
    <font face="Arial, Helvetica, sans-serif">
        <table width="100%" border="0">
            <tr>
                <td align="right">
                    <a href="LogoutServlet"><font color="red">Sair (Logout)</font></a>
                </td>
            </tr>
        </table>

        <center>
            <font color="#008800" size="5"><b>Compra realizada com sucesso!</b></font>
            <br><br>
            
            <h3>Resumo dos Produtos</h3>
            <table border="1" cellpadding="10" cellspacing="0" bordercolor="#336699" bgcolor="#FFFFFF" width="60%">
                <tr bgcolor="#E0E0E0">
                    <th>Imagem</th>
                    <th>Descrição</th>
                    <th>Preço</th>
                </tr>
                <%
                    double totalFinal = 0;
                    Cookie[] cookies = request.getCookies();
                    if (cookies != null) {
                        for (Cookie c : cookies) {
                            if (c.getName().startsWith("prod_")) {
                                String val = URLDecoder.decode(c.getValue(), "UTF-8");
                                String[] pt = val.split("\\|");
                                totalFinal += Double.parseDouble(pt[2]);
                %>
                <tr>
                    <td align="center"><img src="<%= pt[0] %>" width="80" height="80"></td>
                    <td align="center"><%= pt[1] %></td>
                    <td align="center">R$ <%= pt[2] %></td>
                </tr>
                <%          }
                        }
                    }
                %>
                <tr bgcolor="#336699">
                    <td colspan="2" align="right"><b><font color="#FFFFFF">Total da Compra:</font></b></td>
                    <td align="center"><b><font color="#FFFFFF">R$ <%= String.format("%.2f", totalFinal) %></font></b></td>
                </tr>
            </table>

            <br>
            <h3>Dados do Pagamento</h3>
            <table border="1" cellpadding="10" cellspacing="0" bordercolor="#336699" bgcolor="#FFFFFF" width="40%">
                <tr>
                    <td><b>Forma:</b></td>
                    <td><%= request.getAttribute("pagamento") %></td>
                </tr>
                <tr>
                    <td><b>Parcelamento:</b></td>
                    <td><%= request.getAttribute("parcelamento") %></td>
                </tr>
            </table>
            <br>
            <a href="index.jsp">Voltar ao Início</a>
        </center>
    </font>
</body>
</html>