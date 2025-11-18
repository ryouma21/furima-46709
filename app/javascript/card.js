document.addEventListener("turbo:load", () => {
  // 購入フォームがないページでは何もしない
  const form = document.getElementById("charge-form");
  if (!form) return;

  // フォーム送信時にイベント発火
  form.addEventListener("submit", (e) => {
    e.preventDefault();  // デフォルトの送信を止める
    console.log("購入ボタンを押しました！（イベント発火OK）");
    const cardNumber = document.getElementById("number-form");
    const cardExpiry = document.getElementById("expiry-form");
    const cardCVC = document.getElementById("cvc-form");

    console.log(cardNumber);
    console.log(cardExpiry);
    console.log(cardCVC);
  });
});
