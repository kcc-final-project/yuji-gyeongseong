<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../common/common-header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="/resources/css/rnd-plan/common-rnd-progress.css">
    <link rel="stylesheet" href="/resources/css/rnd-plan/common-rnd-control.css">
    <title>유지경성</title>
</head>
<body>
<div class="common-main">
    <div class="main">
        <jsp:include page="common-rnd-progress.jsp"/>

        <div id="step-content"></div>

    </div>
</div>

<jsp:include page="common-rnd-control.jsp"/>

</body>
</html>