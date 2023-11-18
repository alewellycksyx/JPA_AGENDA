<%@page import="java.util.List"%>
<%@page import="com.emergentes.entidades.Contacto"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Contactos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        a {
            text-decoration: none;
            padding: 6px 12px;
            display: inline-block;
            margin-top: 10px;
            background-color: #4CAF50;
            color: #fff;
            border: 1px solid #4CAF50;
            border-radius: 4px;
        }

        a:hover {
            background-color: #45a049;
            border: 1px solid #45a049;
        }
    </style>
</head>
<body>
    <h1>Listado de Contactos</h1>
    <a href="MainController?action=add">Nuevo Registro</a>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Correo</th>
                <th>Teléfono</th>
                <th>Editar</th>
                <th>Eliminar</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Contacto> lista = (List<Contacto>) request.getAttribute("contactos");
                for (Contacto item : lista) {
            %>
                <tr>
                    <td><%= item.getId() %></td>
                    <td><%= item.getNombre() %></td>
                    <td><%= item.getCorreo() %></td>
                    <td><%= item.getTelefono() %></td>
                    <td><a href="MainController?action=edit&id=<%= item.getId() %>">Editar</a></td>
                    <td><a href="MainController?action=delete&id=<%= item.getId() %>" onclick="return confirm('¿Está seguro?')">Eliminar</a></td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
