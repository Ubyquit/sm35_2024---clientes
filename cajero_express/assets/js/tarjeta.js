document.getElementById('tarjeta').addEventListener('input', function (e) {
    let input = e.target.value.replace(/\s+/g, '').replace(/[^0-9]/gi, '');
    let formattedInput = input.match(/.{1,4}/g).join(' ');
    e.target.value = formattedInput;
});