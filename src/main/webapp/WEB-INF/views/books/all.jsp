<%--
  Created by IntelliJ IDEA.
  User: mariusz
  Date: 20.02.2021
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Book List</title>
    <link href='<c:url value="/css/style.css"/>' rel="stylesheet" type="text/css">
</head>
<body>

<h2>Book list</h2>
<table border="1">
    <thead>
        <th>ISBN</th>
        <th>Title</th>
        <th>Author</th>
        <th>Type</th>
        <th>Publisher</th>
        <th>Edit</th>
        <th>Delete</th>
    </thead>
    <tbody>
    <c:forEach items="${books}" var="book">
        <tr>
            <td><c:out value="${book.isbn}"/></td>
            <td><c:out value="${book.title}"/></td>
            <td><c:out value="${book.author}"/></td>
            <td><c:out value="${book.type}"/></td>
            <td><c:out value="${book.publisher}"/></td>
            <td><a href="/admin/books/edit/${book.id}">Edit</a></td>
            <td><a href="/admin/books/delete/${book.id}">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>


