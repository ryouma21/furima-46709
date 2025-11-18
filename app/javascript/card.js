document.addEventListener("turbo:load", () => {
  // 購入フォームがないページでは何もしない
  const form = document.getElementById("charge-form");
  if (!form) return;

  form.addEventListener("submit", (e) => {
    e.preventDefault();
    console.log("イベント発火OK");

  // ③ PAY.JP 初期化 ---------------------------------------------------
    const publicKey = process.env.PAYJP_PUBLIC_KEY;
    const payjp = Payjp(publicKey);
    const elements = payjp.elements();

    // ④ カード入力フォームを生成 -----------------------------------------
    const numberElement = elements.create("cardNumber");
    const expiryElement = elements.create("cardExpiry");
    const cvcElement = elements.create("cardCvc");

    // ⑤ 作成したフォームをビューのdivに埋め込む ---------------------------
    numberElement.mount("#number-form");
    expiryElement.mount("#expiry-form");
    cvcElement.mount("#cvc-form");

    console.log("カード入力パーツの生成OK！");
  });
});
