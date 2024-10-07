<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../common/common-header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="/resources/css/rnd-plan/rnd-plan-basic.css">
    <title>유지경성</title>
</head>
<body>
<div class="common-main">
    <div class="main">
        <h4>(신청용) 연구개발계획서</h4>
        <div class="multi-step-progress-bar">

        </div>
        <%-- 과제정보 --%>
        <div class="task-info">
            <div class="task-info-header">
                <div class="task-info__title">
                    <h5>과제정보</h5>
                </div>
                <div class="task-info__log">
                    <div class="ctm-btn ctm-btn-outline">
                        <span class="material-icons ctm-icon">history_2</span>진행내역 조회
                    </div>
                </div>
            </div>
            <div class="task-info-body">
                <table class="table table-bordered mt-3">
                    <thead>
                    <tr class="table">
                        <td class="ctm-th ctm-w">과제명</td>
                        <td class="ctm-th">연구개발기관</td>
                        <td class="ctm-th">연구 책임자</td>
                        <td class="ctm-th">연구개발 과제번호</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><input class="form-control ctm-td" disabled readonly type="text"></td>
                        <td><input class="form-control ctm-td" disabled readonly type="text"></td>
                        <td><input class="form-control ctm-td" disabled readonly type="text"></td>
                        <td><input class="form-control ctm-td" disabled readonly type="text"></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>
</body>
</html>