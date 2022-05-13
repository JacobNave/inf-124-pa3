let params = new URLSearchParams(window.location.search);
const id = params.get("id");
document.getElementById("add_button").onclick = async () => {
  const response = await fetch("http://localhost:8080/pa3/add?id=" + id, {
    method: "POST",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
    },
  });
};
