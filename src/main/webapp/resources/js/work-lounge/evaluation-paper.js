const radios1 = document.querySelectorAll(
  'input[name="score1"], input[name="score2"], input[name="score3"], input[name="score4"], input[name="score5"], input[name="score6"], input[name="score7"], input[name="score8"], input[name="score9"], input[name="score10"]',
);
const radios2 = document.querySelectorAll(
  'input[name="score11"], input[name="score12"], input[name="score13"], input[name="score14"], input[name="score15"], input[name="score16"], input[name="score17"], input[name="score18"], input[name="score19"], input[name="score20"]',
);
const resultElement1 = document.getElementById("result1");
const resultElement2 = document.getElementById("result2");
let totalScore1 = 0;
let totalScore2 = 0;

radios1.forEach((radio) => {
  radio.addEventListener("change", () => {
    totalScore1 = 0;

    radios1.forEach((radio) => {
      if (radio.checked) {
        totalScore1 += parseInt(radio.value);
      }
    });

    resultElement1.textContent = totalScore1;
  });
});

radios2.forEach((radio) => {
  radio.addEventListener("change", () => {
    totalScore2 = 0;

    radios2.forEach((radio) => {
      if (radio.checked) {
        totalScore2 += parseInt(radio.value);
      }
    });

    resultElement2.textContent = totalScore2;
  });
});
