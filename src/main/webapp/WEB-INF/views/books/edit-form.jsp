<%--
  Created by IntelliJ IDEA.
  User: mariusz
  Date: 20.02.2021
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Edit book</title>
    <link href='<c:url value="/css/style.css"/>' rel="stylesheet" type="text/css">
</head>
<body>

<h2>Edit book</h2>
<form:form method="post" modelAttribute="book">
    <div>
        <label for="isbn">ISBN</label>
        <form:input type="text" id="isbn" path="isbn"/>
        <form:errors path="isbn"/>
    </div>
    <div>
        <label for="title">Title</label>
        <form:input type="text" id="title" path="title"/>
        <form:errors path="title"/>
    </div>
    <div>
        <label for="author">Author</label>
        <form:input type="text" id="author" path="author"/>
        <form:errors path="author"/>
    </div>
    <div>
        <label for="type">Type</label>
        <form:input type="text" id="type" path="type"/>
        <form:errors path="type"/>
    </div>
    <div>
        <label for="publisher">publisher</label>
        <form:input type="text" id="publisher" path="publisher"/>
        <form:errors path="publisher"/>
    </div>
    <div>
        <form:hidden path="id" />
        <input type="submit"/>
    </div>
    <div>
        <form:errors path="*" element="p" cssClass="cssErrors"/>
    </div>
</form:form>
</body>
</html>
