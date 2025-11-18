document.addEventListener("turbo:load", () => {
  // 購入フォームがないページでは何もしない
  const form = document.getElementById("charge-form");
  if (!form) return;

  // フォーム送信時にイベント発火
  form.addEventListener("submit", (e) => {
    e.preventDefault();  // デフォルトの送信を止める
    console.log("購入ボタンを押しました！（イベント発火OK）");
  });
});
