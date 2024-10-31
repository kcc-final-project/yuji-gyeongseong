<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<link rel="stylesheet" href="/resources/css/rnd-plan/common-rnd.css"/>

<div class="main">
    <h1>기본정보페이지</h1>
    <jsp:include page="basic.jsp"/>
    <h1>과제요약페이지</h1>
    <jsp:include page="task-summary.jsp"/>
    <h1>연구기관페이지</h1>
    <jsp:include page="rsrch-institution.jsp"/>
    <h1>연구개발비페이지</h1>
    <jsp:include page="rnd-expenses.jsp"/>
    <h1>첨부파일페이지</h1>
    <jsp:include page="additional-file.jsp"/>
</div>
