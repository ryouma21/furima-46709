const pay = () => {
  const form = document.getElementById("charge-form");
  if (!form) return;

  // ① 公開鍵を gon から取得
  const publicKey = gon.public_key;
  const payjp = Payjp(publicKey);
  const elements = payjp.elements();

  // ② カード入力部品を作成
  const numberElement = elements.create("cardNumber");
  const expiryElement = elements.create("cardExpiry");
  const cvcElement = elements.create("cardCvc");

  // ③ ビュー上のdivと置き換える（mount）
  numberElement.mount("#number-form");
  expiryElement.mount("#expiry-form");
  cvcElement.mount("#cvc-form");

  // ④ フォーム送信イベント
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    // ⑤ トークンを作成
    payjp.createToken(numberElement).then(function(response) {

    if (response.error) {
      // alert は出さない　←ポイント
        form.submit();  // ← Rails に送る
        return;
      }

      // ⑥ token を hidden フィールドとしてフォームに追加
      const token = response.id;
      const tokenInput = document.createElement("input");
      tokenInput.setAttribute("type", "hidden");
      tokenInput.setAttribute("name", "token");
      tokenInput.setAttribute("value", token);
      form.appendChild(tokenInput);

      // ⑦ セキュリティのためフォームから実カード情報を削除
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();

      // ⑧ サーバーへ送信
      form.submit();
    });
  });
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);
