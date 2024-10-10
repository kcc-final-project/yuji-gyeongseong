const academicData = [
    {
        id: 1,
        degreeType: "학사",
        degreeDate: "2024-09-25",
        degreeCountry: "대한민국",
        degreeInstitutionName: "서울대학교",
        majorName: "컴퓨터공학",
        majorCategory: "공학계열",
        detailMajor: "컴퓨터학과"
    },
    {
        id: 2,
        degreeType: "석사",
        degreeDate: "2022-06-15",
        degreeCountry: "대한민국",
        degreeInstitutionName: "카이스트",
        majorName: "전자공학",
        majorCategory: "공학계열",
        detailMajor: "컴퓨터학과"
    }
];

const careerData = [
    {
        id: 1,
        workInstitutionName: "kcc 정보통신",
        employmentType: "정규직",
        workDepartment: "개발 1팀",
        workStartDate: "2024-10-09",
        workEndDate: "2024-10-09"
    },
    {
        id: 2,
        workInstitutionName: "삼성전자",
        employmentType: "인턴",
        workDepartment: "개발 2팀",
        workStartDate: "2024-05-19",
        workEndDate: "2024-09-17"
    }
];

function renderAcademicDetails() {
    const academicDetailsContainer = document.getElementById("academicDetails");
    academicData.forEach(data => {
        const academicHTML = `
                <hr>
                <div class="list">
                    <div class="field">
                        <label>학력구분</label>
                        <div class="value">${data.degreeType}</div>
                    </div>
                    <div class="field">
                        <label>취득연월</label>
                        <div class="value">${data.degreeDate}</div>
                    </div>
                </div>
                <div class="list">
                    <div class="field">
                        <label>취득국가</label>
                        <div class="value">${data.degreeCountry}</div>
                    </div>
                    <div class="field">
                        <label>취득기관명</label>
                        <div class="value">${data.degreeInstitutionName}</div>
                    </div>
                </div>
                <div class="list">
                    <div class="field">
                        <label>전공명</label>
                        <div class="value">${data.majorName}</div>
                    </div>
                    <div class="field">
                        <label>학력구분</label>
                        <div class="value">${data.majorCategory}</div>
                        <div class="value">${data.detailMajor}</div>
                    </div>
                </div>
            `;
        academicDetailsContainer.insertAdjacentHTML("beforeend", academicHTML);
    });
}

function renderCareerDetails() {
    const careerDetailsContainer = document.getElementById("careerDetails");
    careerData.forEach(data => {
        const careerHTML = `
                <hr>
                <div class="list">
                    <div class="field">
                        <label>근무기관명</label>
                        <div class="value">${data.workInstitutionName}</div>
                    </div>
                </div>
                <div class="list">
                    <div class="field">
                        <label>근무부서</label>
                        <div class="value">${data.workDepartment}</div>
                    </div>
                    <div class="field">
                        <label>고용형태</label>
                        <div class="value">${data.employmentType}</div>
                    </div>
                </div>
                <div class="list">
                    <div class="field">
                        <label>근무시작일</label>
                        <div class="value">${data.workStartDate}</div>
                    </div>
                    <div class="field">
                        <label>근무종료일</label>
                        <div class="value">${data.workEndDate}</div>
                    </div>
                </div>
            `;
        careerDetailsContainer.insertAdjacentHTML("beforeend", careerHTML);
    });

    document.getElementById("registerButton").addEventListener("click", function() {
        Swal.fire({
            title: "후보단 등록을 하시겠습니까 ?",
            text: "정보가 올바른지 확인해주세요 !",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#2e406a",
            cancelButtonColor: "#dddbdb",
            confirmButtonText: "신청",
            cancelButtonText: "취소"
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: "신청되었습니다!",
                    text: "평가위원단 후보 등록에 성공하셨습니다.",
                    icon: "success",
                    confirmButtonColor: "#2e406a"
                });
            }
        });
    });
}

document.addEventListener("DOMContentLoaded", function() {
    renderAcademicDetails();
    renderCareerDetails();
});