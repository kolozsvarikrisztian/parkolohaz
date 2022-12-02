async function velemenyKuldes() {
    let name = document.getElementById("name");
    let email = document.getElementById("email");
    let phone = document.getElementById("phone");
    let message = document.getElementById("message");

    if (!name.value || !email.value || !phone.value || !message.value) {
        alert("Kérjük, minden mezőt töltsön ki az űrlapon!");
        return;
    }

    body = JSON.stringify({
        name: name.value,
        email: email.value,
        phone: phone.value,
        message: message.value
    })


    let response = await fetch('api/kapcsolat', {
        method: 'POST',
        body: body,
        headers: {
            'Content-Type': 'application/json'
        }
    });

    if (response.status != 200) {
        return;
    }
    alert("Munkatársunk hamarosan keresni fogja önt!")

    name.value = "";
    email.value = "";
    phone.value = "";
    message.value = "";
}

let szamlalo = 0;
function novel() {
    szamlalo += 1;
    document.getElementById('szamlalo').innerHTML = szamlalo;
}

setInterval(novel, 500);

window.onload = novel;



























// let szamlalo = 0;

// function szamlaloIndulas() {
//     setInterval(() => {
//         szamlalo++;
//         let szamlaloSzoveg = document.getElementById('szamlalo');
//         szamlaloSzoveg.textContent = szamlalo;
//     }, 500, window );
// }

// window.onload = function () {
//     szamlaloIndulas();
// };