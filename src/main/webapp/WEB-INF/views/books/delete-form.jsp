<%--
  Created by IntelliJ IDEA.
  User: mariusz
  Date: 20.02.2021
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Delete book</title>
    <link href='<c:url value="/css/style.css"/>' rel="stylesheet" type="text/css">
</head>
<body>

<h2>Are you sure to delete book?</h2>
<form:form method="post" modelAttribute="book">
    <table>
        <thead>
            <th>ISBN</th>
            <th>Title</th>
            <th>Author</th>
            <th>Type</th>
            <th>Publisher</th>
        </thead>
        <tbody>
            <tr>
                <td>${book.isbn}</td>
                <td>${book.title}</td>
                <td>${book.author}</td>
                <td>${book.type}</td>
                <td>${book.publisher}</td>
            </tr>
        </tbody>
    </table>

    <form:hidden path="id"/>
    <br />
    <div>
        <input type="submit" name="deleteBtn" value="no" ></input>
        <input type="submit" name="deleteBtn" value="yes" ></input>
    </div>
</form:form>

</body>
</html>
