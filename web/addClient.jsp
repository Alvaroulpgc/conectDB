<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
    <sql:query var="clientes" dataSource="jdbc/sample">
        <sql:update var="id" dataSource="jdbc/sample">
            INSERT INTO CUSTOMER (CUSTOMER_ID,DISCOUNT_CODE,ZIP,NAME)
            VALUES (20, ?,'10095','Daniel San Juan Abrante')
            <sql:param value="${param.discount}"/>
        </sql:update>
    </sql:query>

    <table border="1">
        <!-- column headers -->
        <tr>
            <c:forEach var="columnName" items="${clientes.columnNames}">
                <th><c:out value="${columnName}"/></th>
                </c:forEach>
        </tr>
        <!-- column data -->
        <c:forEach var="row" items="${clientes.rowsByIndex}">
            <tr>
                <c:forEach var="column" items="${row}">
                    <td><c:out value="${column}"/></td>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
</html>
