
async function getOrders() {
  const response = await fetch("http://localhost:8080/pa3/getOrders");
  return await response.json();
}

async function setStars(id) {
  const starId = parseInt(id.substring(0, 1));
  const remainder = id.substring(1);

  for (let i = 0; i < 5; i++) {
    const star = document.getElementById(i.toString() + remainder);
    if (i <= starId) {
      star.style.color = "orange";
    } else {
      star.style.color = "gray";
    }
  }
  const response = await fetch(
    "http://localhost:8080/pa3/rating?id=" +
    remainder.substring(1, remainder.substring(1).indexOf(' ') + 1) +
      "&rating=" +
      (starId + 1).toString(),
    {
      method: "POST",
    }
  );
}

async function setOrders() {
  const orders = await getOrders();

  for (let i = 0; i < orders.orders.length; i++) {
    const order = orders.orders[i];

    for (let starI = 0; starI < 5; starI++) {
      const star = document.getElementById(starI + " " + order.id + " star");
      star.onclick = () => setStars(starI + " " + order.id + " star");
    }
  }
}

setOrders();
