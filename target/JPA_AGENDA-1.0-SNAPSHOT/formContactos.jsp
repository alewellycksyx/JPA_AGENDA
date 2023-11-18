<%@page import="com.emergentes.entidades.Contacto"%>
<%
    Contacto contacto= (Contacto)request.getAttribute("contacto");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Contactos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            color: #333;
        }

        form {
            max-width: 400px;
            margin: 20px auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        td {
            padding: 10px;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Registro de contactos</h1>
    <form action="MainController" method="post">
        <input type="hidden" name="id" value="<%= contacto.getId()%>">
        
        <table>
            <tr>
                <td>NOMBRE</td>
                <td><input type="text" name="nombre" value="<%= contacto.getNombre()%>"></td>
            </tr>
            
            <tr>
                <td>CORREO</td>
                <td><input type="text" name="correo" value="<%= contacto.getCorreo()%>"></td>
            </tr>
            
            <tr>
                <td>TELEFONO</td>
                <td><input type="text" name="telefono" value="<%= contacto.getTelefono()%>"></td>
            </tr>
            
            <tr>
                <td></td>
                <td><input type="submit"></td>
            </tr>
        </table>
    </form>
</body>
</html>
