const cartContainer = document.getElementById("cart");


async function getCart() {
  const response = await fetch("http://localhost:8080/pa3/getCartProducts");
  return await response.json();
}

async function submitForm() {
    const cartData = await getCart();

    const firstName = document.getElementById('first-name').value;
    const lastName = document.getElementById('last-name').value;
    const phoneNumber = document.getElementById('phone').value;
    const creditCard = document.getElementById('credit').value;
    const pin = document.getElementById('pin').value;
    const shippingAddress = document.getElementById('Address').value;
    const city = document.getElementById('city').value;
    const state = document.getElementById('state').value;
    const zip = document.getElementById('zip').value;

    const submitObj = {
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        creditCard: creditCard,
        pin: pin,
        shippingAddress: shippingAddress,
        city: city,
        state: state,
        zip: zip,
        products: cartData.products
    }

    const response = await fetch('http://localhost:8080/pa3/submit',{
        method: 'POST',
        headers: {
          'Accept': 'application/json',
          'Content-type':'application/json'
        },
        body: JSON.stringify(submitObj)
      });
    console.log(response);
    const ordersResponse = await fetch('http://localhost:8080/pa3/orders');
    document.write(ordersResponse.body);
    location.href = "http://localhost:8080/pa3/orders";
}

async function setOrders() {
  const cartData = await getCart();
  let total = 0;

  for (let i = 0; i < cartData.products.length; i++) {
    const prod = cartData.products[i];
    const prodDiv = document.createElement("p");
    prodDiv.className = "prodItem";

    prodDiv.innerHTML = prod.name + ' ' + (Math.round((prod.price) * 100) / 100).toString();
    total+= prod.price;
    
    cartContainer.appendChild(prodDiv);
  }

  const lineBreak = document.createElement('hr');
  cartContainer.appendChild(lineBreak);

  const tax = document.createElement('p');
  tax.innerHTML = 'Taxrate: 0';
  tax.id = "tax";
  cartContainer.appendChild(tax);

  const totalPrice = document.createElement('p');
  totalPrice.innerHTML = 'Total: $' + total.toString();
  cartContainer.appendChild(totalPrice);   
}

document.getElementById("submit-button").onclick = () => {
    submitForm();
}
setOrders();