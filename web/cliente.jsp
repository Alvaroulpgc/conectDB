<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : cliente
    Created on : 23-feb-2016, 11:17:22
    Author     : alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Clientes</h1>
    </body>
    <sql:query var="result" dataSource="jdbc/sample">
        SELECT CUSTOMER_ID,NAME,EMAIL,PHONE FROM CUSTOMER
    </sql:query>
    <sql:query var="ziptable" dataSource="jdbc/sample">
        SELECT ZIP_CODE FROM MICRO_MARKET
    </sql:query>
    <sql:query var="discounttable" dataSource="jdbc/sample">
        SELECT DISCOUNT_CODE FROM DISCOUNT_CODE
    </sql:query>

    <!--sacar nombres en un desplegable-->
    <form action="cliente_detalle.jsp">
        <select name="cliente">
            <c:forEach var="row" items="${result.rowsByIndex}">
                <option value="${row[0]}">${row[1]}</option>
            </c:forEach>
        </select>
        <input type="submit">
    </form>
    <form action="addClient.jsp">
        Nombre <input type="text">Correo <input type="text"><br>
        Codigo Postal<select name="zip">
            <c:forEach var="row" items="${ziptable.rowsByIndex}">
                <option value="${row[1]}">${row[0]}</option>
            </c:forEach>
        </select>
        Descuento <select name="discount"><br>
            <c:forEach var="row" items="${discounttable.rowsByIndex}">
                <option value="${row[1]}">${row[0]}</option>
            </c:forEach>
        </select>
        <input type="submit" value="Añadir">
    </form>
    <%--<sql:update var="id" dataSource="jdbc/sample">--%>
    <!--INSERT INTO CUSTOMER (CUSTOMER_ID,DISCOUNT_CODE,ZIP,NAME)-->
    <!--VALUES (3424,'H','10099','Daniel San Juan Abrante')-->
    <%--</sql:update>--%>
    <table border="1">
        <!-- column headers -->
        <tr>
            <c:forEach var="columnName" items="${result.columnNames}">
                <th><c:out value="${columnName}"/></th>
                </c:forEach>
        </tr>
        <!-- column data -->
        <c:forEach var="row" items="${result.rowsByIndex}">
            <tr>
                <c:forEach var="column" items="${row}">
                    <td><c:out value="${column}"/></td>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>


</html>
