const pay = () => {
  Payjp.setPublicKey("pk_test_73d1171f47cd7dbf0a5a82dd")
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("shopping_address[number]"),
      cvc: formData.get("shopping_address[CVC]"),
      exp_month: formData.get("shopping_address[exp_month]"),
      exp_year: `20${formData.get("shopping_address[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("shopping_address_number").removeAttribute("name");
      document.getElementById("shopping_address_cvc").removeAttribute("name");
      document.getElementById("shopping_address_exp_month").removeAttribute("name");
      document.getElementById("shopping_address_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);