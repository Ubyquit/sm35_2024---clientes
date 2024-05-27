// Funcion para saber si me aceptan

function quieresSerMiNovia($respuesta) {
    if($respuesta === 'si') {
        console.log('¡Sí! ¡Eres la mejor! 😍');
    } else {
        console.log('¡Vaya! ¡Qué pena! ¡Adiós! 😢');
    }
}

quieresSerMiNovia('si');
quieresSerMiNovia('no');
quieresSerMiNovia('quisieras');