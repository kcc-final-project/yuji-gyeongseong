var rndExpensesData = window.rndExpensesData || []; // 연구 개발비 객체 저장 배열

$(document).ready(function() {
    // === 재원별 연구개발비 구성 테이블 로직 ===
    $(".research-expenses-table tbody").on("change", "tr:first-child input, tr:first-child select", function () {
        var $firstRowInput = $(this);

        // readonly 또는 disabled 상태의 입력 요소는 복사하지 않음
        if ($firstRowInput.is(':disabled') || $firstRowInput.is('[readonly]')) {
            return;
        }

        // 입력 요소의 클래스 목록을 가져와 복사 대상 결정
        var classes = $firstRowInput.attr('class').split(/\s+/);
        var targetClass = '';

        // 복사할 클래스 식별
        $.each(classes, function (index, className) {
            if (className.endsWith('-input') || className.endsWith('-select')) {
                targetClass = className;
                return false; // 첫 번째 일치하는 클래스만 사용
            }
        });

        if (targetClass === '') {
            return; // 복사할 클래스가 없으면 종료
        }

        // 입력 요소의 새로운 값 가져오기
        var newValue;
        if ($firstRowInput.is(':checkbox')) {
            newValue = $firstRowInput.is(':checked');
        } else {
            newValue = $firstRowInput.val();
        }

        // 첫 번째 행을 제외한 나머지 행들을 순회하며 동일한 클래스의 입력 요소 업데이트
        $(".research-expenses-table tbody tr").not(':first').each(function () {
            var $row = $(this);
            var $input = $row.find('.' + targetClass);

            // readonly 또는 disabled 상태의 입력 요소는 복사하지 않음
            if ($input.is(':disabled') || $input.is('[readonly]')) {
                return;
            }

            if ($firstRowInput.is(':checkbox')) {
                $input.prop('checked', newValue);
            } else {
                $input.val(newValue);
            }

            // 변경된 값에 따라 재원별 연구비 합계(A) 업데이트
            updateTotals($row);
        });

        // 연구개발비 사용 계획 테이블 업데이트
        updateTotalExpenses();
    });

    // 합산 함수 정의 (재원별)
    function updateTotals($row) {
        // 정부지원금 현금
        var govCash = parseFloat($row.find('input.gov-cash-input').val().replace(/,/g, '')) || 0;

        // 연구개발기관 부담금 현금
        var instBurdenCash = parseFloat($row.find('input.inst-burden-cash-input').val().replace(/,/g, '')) || 0;

        // 연구개발기관 부담금 현물
        var instBurdenInkind = parseFloat($row.find('input.inst-burden-inkind-input').val().replace(/,/g, '')) || 0;

        // 재원별 연구비 합계(A) 현금 = 정부지원금 현금 + 연구개발기관 부담금 현금
        var totalCash = govCash + instBurdenCash;

        // 재원별 연구비 합계(A) 현물 = 연구개발기관 부담금 현물
        var totalInkind = instBurdenInkind;

        // 소계 = 재원별 연구비 합계(A) 현금 + 재원별 연구비 합계(A) 현물
        var subtotal = totalCash + totalInkind;

        // 값 설정 (소수점 없이 정수)
        $row.find('input.total-cash-input').val(totalCash.toLocaleString('ko-KR'));
        $row.find('input.total-inkind-input').val(totalInkind.toLocaleString('ko-KR'));
        $row.find('input.total-subtotal-input').val(subtotal.toLocaleString('ko-KR'));
    }

    // 개별 입력 필드에 대한 이벤트 리스너 추가 (현금 및 현물 입력 시 합산 업데이트)
    $(".research-expenses-table tbody").on("input change", "input.gov-cash-input, input.inst-burden-cash-input, input.inst-burden-inkind-input", function () {
        var $row = $(this).closest('tr');
        updateTotals($row);

        // 연구개발비 사용 계획 테이블 업데이트
        updateTotalExpenses();
    });

    // === 비목별 연구개발비 구성 테이블 로직 ===
    $(".budget-expenses-table tbody").on("change", "tr:first-child input, tr:first-child select", function () {
        var $firstRowInput = $(this);

        // readonly 또는 disabled 상태의 입력 요소는 복사하지 않음
        if ($firstRowInput.is(':disabled') || $firstRowInput.is('[readonly]')) {
            return;
        }

        // 입력 요소의 클래스 목록을 가져와 복사 대상 결정
        var classes = $firstRowInput.attr('class').split(/\s+/);
        var targetClass = '';

        // 복사할 클래스 식별
        $.each(classes, function (index, className) {
            if (className.endsWith('-input') || className.endsWith('-select')) {
                targetClass = className;
                return false; // 첫 번째 일치하는 클래스만 사용
            }
        });

        if (targetClass === '') {
            return; // 복사할 클래스가 없으면 종료
        }

        // 입력 요소의 새로운 값 가져오기
        var newValue;
        if ($firstRowInput.is(':checkbox')) {
            newValue = $firstRowInput.is(':checked');
        } else {
            newValue = $firstRowInput.val();
        }

        // 첫 번째 행을 제외한 나머지 행들을 순회하며 동일한 클래스의 입력 요소 업데이트
        $(".budget-expenses-table tbody tr").not(':first').each(function () {
            var $row = $(this);
            var $input = $row.find('.' + targetClass);

            // readonly 또는 disabled 상태의 입력 요소는 복사하지 않음
            if ($input.is(':disabled') || $input.is('[readonly]')) {
                return;
            }

            if ($firstRowInput.is(':checkbox')) {
                $input.prop('checked', newValue);
            } else {
                $input.val(newValue);
            }

            // 변경된 값에 따라 비목별 연구비 합계(B) 업데이트
            updateBudgetTotals($row);
        });

        // 연구개발비 사용 계획 테이블 업데이트
        updateTotalExpenses();
    });

    // 비목별 연구개발비 합계(B) 업데이트 함수
    function updateBudgetTotals($row) {
        // 총 인건비 현금
        var totalLaborCash = parseFloat($row.find('input.budget-labor-cash-input').val().replace(/,/g, '')) || 0;

        // 총 인건비 현물
        var totalLaborInkind = parseFloat($row.find('input.budget-labor-inkind-input').val().replace(/,/g, '')) || 0;

        // 연구시설.장비비 현금
        var facilityCash = parseFloat($row.find('input.budget-facility-cash-input').val().replace(/,/g, '')) || 0;

        // 연구시설.장비비 현물
        var facilityInkind = parseFloat($row.find('input.budget-facility-inkind-input').val().replace(/,/g, '')) || 0;

        // 연구개발부담비 현금
        var developmentCash = parseFloat($row.find('input.budget-development-cash-input').val().replace(/,/g, '')) || 0;

        // 연구개발부담비 현물
        var developmentInkind = parseFloat($row.find('input.budget-development-inkind-input').val().replace(/,/g, '')) || 0;

        // 연구수당 현금
        var allowanceCash = parseFloat($row.find('input.budget-allowance-cash-input').val().replace(/,/g, '')) || 0;

        // 연구수당 현물
        var allowanceInkind = parseFloat($row.find('input.budget-allowance-inkind-input').val().replace(/,/g, '')) || 0;

        // 비목별 연구비 합계(B) 현금 = 총 인건비 현금 + 연구시설.장비비 현금 + 연구개발부담비 현금 + 연구수당 현금
        var totalCash = totalLaborCash + facilityCash + developmentCash + allowanceCash;

        // 비목별 연구비 합계(B) 현물 = 총 인건비 현물 + 연구시설.장비비 현물 + 연구개발부담비 현물 + 연구수당 현물
        var totalInkind = totalLaborInkind + facilityInkind + developmentInkind + allowanceInkind;

        // 비목별 연구비 합계(B) 소계 = 현금 합계 + 현물 합계
        var subtotal = totalCash + totalInkind;

        // 값 설정 (천 단위 콤마 및 소수점 없음)
        $row.find('input.budget-total-cash-input').val(totalCash.toLocaleString('ko-KR'));
        $row.find('input.budget-total-inkind-input').val(totalInkind.toLocaleString('ko-KR'));
        $row.find('input.budget-total-subtotal-input').val(subtotal.toLocaleString('ko-KR'));
    }

    // 비목별 연구개발비 구성 테이블의 개별 입력 필드에 대한 이벤트 리스너 추가
    $(".budget-expenses-table tbody").on("input change", "input.budget-labor-cash-input, input.budget-labor-inkind-input, input.budget-facility-cash-input, input.budget-facility-inkind-input, input.budget-development-cash-input, input.budget-development-inkind-input, input.budget-allowance-cash-input, input.budget-allowance-inkind-input", function () {
        var $row = $(this).closest('tr');
        updateBudgetTotals($row);

        // 연구개발비 사용 계획 테이블 업데이트
        updateTotalExpenses();
    });

    // === 연구개발비 사용 계획 테이블 업데이트 함수 ===
    function updateTotalExpenses() {
        // 연구개발비 사용 계획 테이블의 모든 행을 순회
        $(".total_expenses tbody tr").each(function (index) {
            var $totalRow = $(this);

            // 대응되는 재원별 연구개발비 구성 테이블의 행
            var $researchRow = $(".research-expenses-table tbody tr").eq(index);
            // 대응되는 비목별 연구개발비 구성 테이블의 행
            var $budgetRow = $(".budget-expenses-table tbody tr").eq(index);

            if ($researchRow.length === 0 || $budgetRow.length === 0) {
                // 대응되는 행이 없으면 건너뜀
                return;
            }

            // 재원별 연구비 합계(A) 값 가져오기
            var aCash = parseFloat($researchRow.find('input.total-cash-input').val().replace(/,/g, '')) || 0;
            var aInkind = parseFloat($researchRow.find('input.total-inkind-input').val().replace(/,/g, '')) || 0;
            var aSubtotal = parseFloat($researchRow.find('input.total-subtotal-input').val().replace(/,/g, '')) || 0;

            // 비목별 연구비 합계(B) 값 가져오기
            var bCash = parseFloat($budgetRow.find('input.budget-total-cash-input').val().replace(/,/g, '')) || 0;
            var bInkind = parseFloat($budgetRow.find('input.budget-total-inkind-input').val().replace(/,/g, '')) || 0;
            var bSubtotal = parseFloat($budgetRow.find('input.budget-total-subtotal-input').val().replace(/,/g, '')) || 0;

            // 차액(A-B) 계산
            var diffCash = aCash - bCash;
            var diffInkind = aInkind - bInkind;
            var diffSubtotal = aSubtotal - bSubtotal;

            // 연구개발비 사용 계획 테이블에 값 설정
            $totalRow.find('input.total-a-cash-input').val(aCash.toLocaleString('ko-KR'));
            $totalRow.find('input.total-a-inkind-input').val(aInkind.toLocaleString('ko-KR'));
            $totalRow.find('input.total-a-subtotal-input').val(aSubtotal.toLocaleString('ko-KR'));

            $totalRow.find('input.total-b-cash-input').val(bCash.toLocaleString('ko-KR'));
            $totalRow.find('input.total-b-inkind-input').val(bInkind.toLocaleString('ko-KR'));
            $totalRow.find('input.total-b-subtotal-input').val(bSubtotal.toLocaleString('ko-KR'));

            $totalRow.find('input.total-diff-cash-input').val(diffCash.toLocaleString('ko-KR'));
            $totalRow.find('input.total-diff-inkind-input').val(diffInkind.toLocaleString('ko-KR'));
            $totalRow.find('input.total-diff-subtotal-input').val(diffSubtotal.toLocaleString('ko-KR'));
        });
    }

    $(".standard-inquiry").click(function (){
        console.log('젭라제바레잡레ㅏㄹㅈ')
        rndExpensesData = gatherRndExpensesData();
        console.log(rndExpensesData);
    });
});

// === 데이터 수집 함수 ===
function gatherRndExpensesData() {

    // '재원별 연구개발비 구성' 테이블의 모든 행을 순회
    $(".research-expenses-table tbody tr").each(function(index) {
        var $researchRow = $(this);
        var $budgetRow = $(".budget-expenses-table tbody tr").eq(index);

        if ($researchRow.length === 0 || $budgetRow.length === 0) {
            // 대응되는 행이 없으면 건너뜀
            return;
        }

        // '재원별 연구개발비 구성' 테이블에서 값 추출
        var stageNo = parseInt($researchRow.find('td').eq(0).text()) || 0;
        var yearNo = parseInt($researchRow.find('td').eq(1).text()) || 0;

        var govermentFund = parseFloat($researchRow.find('input.gov-cash-input').val().replace(/,/g, '')) || 0;

        var instBurdenCash = parseFloat($researchRow.find('input.inst-burden-cash-input').val().replace(/,/g, '')) || 0;
        var instBurdenInkind = parseFloat($researchRow.find('input.inst-burden-inkind-input').val().replace(/,/g, '')) || 0;
        var rndCharge = instBurdenCash + instBurdenInkind;

        // '비목별 연구개발비 구성' 테이블에서 값 추출
        var laborCash = parseFloat($budgetRow.find('input.budget-labor-cash-input').val().replace(/,/g, '')) || 0;
        var laborInkind = parseFloat($budgetRow.find('input.budget-labor-inkind-input').val().replace(/,/g, '')) || 0;
        var laborCost = laborCash + laborInkind;

        var facilityCash = parseFloat($budgetRow.find('input.budget-facility-cash-input').val().replace(/,/g, '')) || 0;
        var facilityInkind = parseFloat($budgetRow.find('input.budget-facility-inkind-input').val().replace(/,/g, '')) || 0;
        var equipCost = facilityCash + facilityInkind;

        var developmentCash = parseFloat($budgetRow.find('input.budget-development-cash-input').val().replace(/,/g, '')) || 0;
        var developmentInkind = parseFloat($budgetRow.find('input.budget-development-inkind-input').val().replace(/,/g, '')) || 0;
        var rndCost = developmentCash + developmentInkind;

        var allowanceCash = parseFloat($budgetRow.find('input.budget-allowance-cash-input').val().replace(/,/g, '')) || 0;
        var allowanceInkind = parseFloat($budgetRow.find('input.budget-allowance-inkind-input').val().replace(/,/g, '')) || 0;
        var rsrchAllowance = allowanceCash + allowanceInkind;

        // RndFee 객체 생성
        var rndFee = {
            stageNo: stageNo,
            yearNo: yearNo,
            govermentFund: govermentFund,
            rndCharge: rndCharge,
            laborCost: laborCost,
            equipCost: equipCost,
            rndCost: rndCost,
            rsrchAllowance: rsrchAllowance,
            rndPlanNo: 3
        };

        rndExpensesData.push(rndFee);
    });

    return rndExpensesData;
}

// [연구개발비] AJAX 연구개발비 데이터 등록하기
async function submitRndExpensesData() {

    rndExpensesData = gatherRndExpensesData();
    const rndPlanNo = localStorage.getItem("rndPlanNo");

    const bodyData = {
        currentStep,
        rndPlanNo,
        rndExpensesData
    }

    console.log("제발요 bodyData data:", bodyData); // 데이터 확인
    try {
        const {data} = await $.ajax({
            url: "/api/v1/rnd-plans/rnd-expenses",
            type: "POST",
            contentType: "application/json",
            dataType: "json",
            data: JSON.stringify(bodyData),
        });

        currentStepFromDB = data;
    } catch (err) {
        console.log(
            "[submitRndExpensesData()] " + err.statusText + " - " + err.status,
        );
    }
}
