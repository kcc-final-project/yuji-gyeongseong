<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<link rel="stylesheet" href="/resources/css/rnd-plan/common-rnd.css"/>

<div class="main">

    <%-- 과제 첨부파일 --%>
    <div class="techField-info mt-5">
        <div class="header-section">
            <div class="header-section__title">
                <h5>과제 첨부파일</h5>
            </div>
        </div>
        <div class="header-section">
            <h5 class="fz14" style="margin-left: 10px">> 과제 첨부파일 내역</h5>
        </div>

        <div class="header-explain-section__info">
            <span class="material-icons ctm-icon">info</span>
            <h5 class="fz14" style="margin-left: 10px">* 과제제출 이후 원본파일을 PDF파일로 재변환합니다. PDF 변환이 완료되지 않아도 마감일시까지 필수 첨부파일
                업로드후 제출하시기 바랍니다.</h5>
        </div>

        <div class="header-explain-warn-section__info">
            <span class="material-icons ctm-icon">info</span>
            <h5 class="fz14" style="margin-left: 10px">* 과제 첨부파일 내역의 파일첨부는 주관연구개발기관에서만 등록이 가능합니다.</h5>
        </div>

        <div class="body-section">
            <table class="table table-bordered mt-2 align-middle">
                <thead>
                <tr>
                    <td class="ctm-th ctm-w3p">순번</td>
                    <td class="ctm-th ctm-w10p">문서유형</td>
                    <td class="ctm-th ctm-w5p">필수여부</td>
                    <td class="ctm-th ctm-w15p">파일명</td>
                    <td class="ctm-th ctm-w5p">크기</td>
                    <td class="ctm-th ctm-w3p">PDF</td>
                    <td class="ctm-th ctm-w10p">등록일자</td>
                    <td class="ctm-th ctm-w7p"></td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="ctm-th__sub">1</td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="연구 데이터 관리 계획서" readonly disabled
                               type="text"/>
                    </td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="선택" readonly disabled type="text"/>
                    </td>
                    <td>
                        <div class="ctm-th__with-btn ctm-td">
                            <span>20240924_연구원 구성 및 상세</span>
                            <div class="ctm-th__btn openTechFieldModal" data-bs-toggle="modal"
                                 data-bs-target="#techFieldModal">
                                <span class="material-icons ctm-icon">close</span>
                            </div>
                        </div>
                    </td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="5.6" readonly disabled type="text"/>
                    </td>
                    <td>
                        <div class="ctm-td">
                            <span class="material-icons pdf" style="color: #D67575">picture_as_pdf</span>
                        </div>
                    </td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="2024-09-24 10:45" readonly disabled
                               type="text"/>
                    </td>
                    <td>
                        <div class="ctm-td" style="display: flex; justify-content: space-around">
                            <button class="ctm-btn ctm-btn-normal ctm-w40p">수정</button>
                            <button class="ctm-btn ctm-btn-normal ctm-w40p">저장</button>
                        </div>
                    </td>

                </tr>
                <tr>
                    <td class="ctm-th__sub">2</td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="연구 데이터 관리 계획서" readonly disabled
                               type="text"/>
                    </td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="선택" readonly disabled type="text"/>
                    </td>
                    <td>
                        <div class="ctm-th__with-btn ctm-td">
                            <span>20240924_연구원 구성 및 상세</span>
                            <div class="ctm-th__btn openTechFieldModal" data-bs-toggle="modal"
                                 data-bs-target="#techFieldModal">
                                <span class="material-icons ctm-icon">close</span>
                            </div>
                        </div>
                    </td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="5.6" readonly disabled type="text"/>
                    </td>
                    <td>
                        <div class="ctm-td">
                            <span class="material-icons pdf" style="color: #D67575">picture_as_pdf</span>
                        </div>
                    </td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="2024-09-24 10:45" readonly disabled
                               type="text"/>
                    </td>
                    <td>
                        <div class="ctm-td" style="display: flex; justify-content: space-around">
                            <button class="ctm-btn ctm-btn-normal ctm-w40p">수정</button>
                            <button class="ctm-btn ctm-btn-normal ctm-w40p">저장</button>
                        </div>
                    </td>

                </tr>
                <tr>
                    <td class="ctm-th__sub">3</td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="연구 데이터 관리 계획서" readonly disabled
                               type="text"/>
                    </td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="선택" readonly disabled type="text"/>
                    </td>
                    <td>
                        <div class="ctm-th__with-btn ctm-td">
                            <span>20240924_연구원 구성 및 상세</span>
                            <div class="ctm-th__btn openTechFieldModal" data-bs-toggle="modal"
                                 data-bs-target="#techFieldModal">
                                <span class="material-icons ctm-icon">close</span>
                            </div>
                        </div>
                    </td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="5.6" readonly disabled type="text"/>
                    </td>
                    <td>
                        <div class="ctm-td">
                            <span class="material-icons pdf" style="color: #D67575">picture_as_pdf</span>
                        </div>
                    </td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="2024-09-24 10:45" readonly disabled
                               type="text"/>
                    </td>
                    <td>
                        <div class="ctm-td" style="display: flex; justify-content: space-around">
                            <button class="ctm-btn ctm-btn-normal ctm-w40p">수정</button>
                            <button class="ctm-btn ctm-btn-normal ctm-w40p">저장</button>
                        </div>
                    </td>

                </tr>
                <tr>
                    <td class="ctm-th__sub">4</td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="연구 데이터 관리 계획서" readonly disabled
                               type="text"/>
                    </td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="선택" readonly disabled type="text"/>
                    </td>
                    <td>
                        <div class="ctm-th__with-btn ctm-td">
                            <span>20240924_연구원 구성 및 상세</span>
                            <div class="ctm-th__btn openTechFieldModal" data-bs-toggle="modal"
                                 data-bs-target="#techFieldModal">
                                <span class="material-icons ctm-icon">close</span>
                            </div>
                        </div>
                    </td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="5.6" readonly disabled type="text"/>
                    </td>
                    <td>
                        <div class="ctm-td">
                            <span class="material-icons pdf" style="color: #D67575">picture_as_pdf</span>
                        </div>
                    </td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="2024-09-24 10:45" readonly disabled
                               type="text"/>
                    </td>
                    <td>
                        <div class="ctm-td" style="display: flex; justify-content: space-around">
                            <button class="ctm-btn ctm-btn-normal ctm-w40p">수정</button>
                            <button class="ctm-btn ctm-btn-normal ctm-w40p">저장</button>
                        </div>
                    </td>

                </tr>
                <tr>
                    <td class="ctm-th__sub">5</td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="연구 데이터 관리 계획서" readonly disabled
                               type="text"/>
                    </td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="선택" readonly disabled type="text"/>
                    </td>
                    <td>
                        <div class="ctm-th__with-btn ctm-td">
                            <span>20240924_연구원 구성 및 상세</span>
                            <div class="ctm-th__btn openTechFieldModal" data-bs-toggle="modal"
                                 data-bs-target="#techFieldModal">
                                <span class="material-icons ctm-icon">close</span>
                            </div>
                        </div>
                    </td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="5.6" readonly disabled type="text"/>
                    </td>
                    <td>
                        <div class="ctm-td">
                            <span class="material-icons pdf" style="color: #D67575">picture_as_pdf</span>
                        </div>
                    </td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="2024-09-24 10:45" readonly disabled
                               type="text"/>
                    </td>
                    <td>
                        <div class="ctm-td" style="display: flex; justify-content: space-around">
                            <button class="ctm-btn ctm-btn-normal ctm-w40p">수정</button>
                            <button class="ctm-btn ctm-btn-normal ctm-w40p">저장</button>
                        </div>
                    </td>

                </tr>
                <tr>
                    <td class="ctm-th__sub">6</td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="연구 데이터 관리 계획서" readonly disabled
                               type="text"/>
                    </td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="선택" readonly disabled type="text"/>
                    </td>
                    <td>
                        <input type="file" name="uploadFile" class="form-control-sm" multiple accept=".jpg,.jpeg,.png,.pdf">
                    </td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="5.6" readonly disabled type="text"/>
                    </td>
                    <td>
                        <div class="ctm-td">
                            <span class="material-icons pdf" style="color: #D67575">picture_as_pdf</span>
                        </div>
                    </td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="2024-09-24 10:45" readonly disabled
                               type="text"/>
                    </td>
                    <td>
                        <div class="ctm-td" style="display: flex; justify-content: space-around">
                            <button class="ctm-btn ctm-btn-normal ctm-w40p">수정</button>
                            <button class="ctm-btn ctm-btn-normal ctm-w40p">저장</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="ctm-th__sub">7</td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="연구 데이터 관리 계획서" readonly disabled
                               type="text"/>
                    </td>
                    <td>
                        <input class="form-control form-control-sm ctm-td" value="선택" readonly disabled type="text"/>
                    </td>
                    <td>
                        <input type="file" name="uploadFile" class="form-control" multiple>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="header-explain-warn-section__info mt-2">
            <h5 class="fz14" style="margin-left: 10px">각종 증명서 PDF 파일은 PDF 인쇄를 통해 재생성후 첨부하셔야 합니다. PDF 변환이 실패하는 경우에도 PDF
                인쇄를 통해 재생성 후 첨부하시기 바랍니다.</h5>
        </div>

    </div>

    <%-- 기관 실적 및 --%>
    <div class="techField-info mt-5">

        <div class="header-section">
            <div class="header-section__title">
                <h5>기관실적 및 신청 자격적정성, 우대사항, 기관증빙서류 정보</h5>
            </div>
        </div>


        <div class="body-section">
            <table class="table table-bordered mt-2">
                <thead>
                <tr>
                    <td class="ctm-th ctm-w20p">기관명</td>
                    <td class="ctm-th ctm-w20p">연구개발 기관역할</td>
                    <td class="ctm-th ctm-w20p">증빙서류</td>
                    <td class="ctm-th ctm-w20p">신청자격 적정성 확인서</td>
                    <td class="ctm-th ctm-w20p">우대 및 감점 확인서</td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>
                        <input class="form-control ctm-td" value="서울대학교" disabled readonly type="text">
                    </td>
                    <td>
                        <input class="form-control ctm-td" value="주관연구개발기관" disabled readonly type="text">
                    </td>
                    <td class="ctm-td">
                        <button class="ctm-btn ctm-btn-normal">첨부</button>
                    </td>
                    <td>
                        <input class="form-control ctm-td" value="작성안료" disabled readonly type="text">
                    </td>
                    <td>
                        <input class="form-control ctm-td" value="50점" disabled readonly type="text">
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

    </div>

    <%-- 연구자 연구업적 --%>
    <div class="techField-info mt-5">

        <div class="header-section">
            <div class="header-section__title">
                <h5>연구자 연구업적 및 증빙서류 정보</h5>
            </div>
        </div>


        <div class="body-section">
            <table class="table table-bordered mt-2">
                <thead>
                <tr>
                    <td class="ctm-th ">연구개발 기관명</td>
                    <td class="ctm-th ctm-w15p">연구개발 기관 역할</td>
                    <td class="ctm-th ctm-w10p">인력명</td>
                    <td class="ctm-th ctm-w10p">인력역할</td>
                    <td class="ctm-th ">증빙서류</td>
                    <td class="ctm-th ctm-w30p">파일명</td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>
                        <input class="form-control ctm-td" value="서울대학교" disabled readonly type="text">
                    </td>
                    <td>
                        <input class="form-control ctm-td" value="주관연구개발기관" disabled readonly type="text">
                    </td>
                    <td>
                        <input class="form-control ctm-td" value="윤채원" disabled readonly type="text">
                    </td>
                    <td>
                        <input class="form-control ctm-td" value="연구책임자" disabled readonly type="text">
                    </td>
                    <td>
                        <button class="ctm-btn ctm-btn-normal">첨부</button>
                    </td>
                    <td>
                        <input class="form-control ctm-td" value="[별지 제4호서식] 연구개발 최종보고서" disabled readonly type="text">
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

    </div>

</div>
