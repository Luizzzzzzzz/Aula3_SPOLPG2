<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head><title>Autenticação</title></head>
<body bgcolor="#F0F4F8">
    <center>
        <br><br><br>
        <font face="Arial, Helvetica, sans-serif">
            <table border="1" cellpadding="20" cellspacing="0" bordercolor="#336699" bgcolor="#FFFFFF">
                <tr>
                    <td align="center" bgcolor="#336699">
                        <b><font color="#FFFFFF" size="4">Autenticação Necessária</font></b>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <form action="LoginServlet" method="POST">
                            <table border="0" cellpadding="5">
                                <tr>
                                    <td><b>Usuário:</b></td>
                                    <td><input type="text" name="username"></td>
                                </tr>
                                <tr>
                                    <td><b>Senha:</b></td>
                                    <td><input type="password" name="password"></td>
                                </tr>
                            </table>
                            <br>
                            <input type="submit" value=" Entrar ">
                        </form>
                        <% if(request.getParameter("erro") != null) { %>
                            <br><font color="red">Usuário ou senha incorretos!</font>
                        <% } %>
                    </td>
                </tr>
            </table>
        </font>
    </center>
</body>
</html>