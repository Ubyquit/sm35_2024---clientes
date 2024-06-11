document.getElementById('tarjeta').addEventListener('input', function (e) {
    let input = e.target.value.replace(/\s+/g, '').replace(/[^0-9]/gi, '');
    let formattedInput = input.match(/.{1,4}/g).join(' ');
    e.target.value = formattedInput;

    // Actualiza el campo oculto con el valor sin espacios
    document.getElementById('tarjeta-hidden').value = input;
});

document.getElementById('tarjeta-form').addEventListener('submit', function () {
    // Asegúrate de que el campo oculto tenga el valor sin espacios
    let tarjetaInput = document.getElementById('tarjeta').value.replace(/\s+/g, '');
    document.getElementById('tarjeta-hidden').value = tarjetaInput;
});