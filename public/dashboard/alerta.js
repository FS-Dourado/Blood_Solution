var alertas = [];

function obterdados(idSensor) {
    fetch(`/medidas/tempo-real/${idSensor}`)
        .then(resposta => {

            if (resposta.ok) {
                resposta.json().then(resposta => {

                    console.log(`Dados recebidos: ${JSON.stringify(resposta)}`);

                    alertar(resposta, idSensor);
                });
            } else {

                console.error('Nenhum dado encontrado ou erro na API');
            }
        })
        .catch(function (error) {
            console.error(`Erro na obtenção dos dados do aquario p/ gráfico: ${error.message}`);
        });

}

function insertSimulados(valor_aleatorio) {
    fetch(`/medidas/insertSimulados`)
        .then(resposta => {

            if (resposta.ok) {
                resposta.json().then(resposta => {

                    console.log(`Dados recebidos: ${JSON.stringify(resposta)}`);

                    alertar(resposta, valor_aleatorio);
                });
            } else {

                console.error('Nenhum dado encontrado ou erro na API');
            }
        })
        .catch(function (error) {
            console.error(`Erro na obtenção dos dados simulados: ${error.message}`);
        });
}


function alertar(resposta, idSensor) {
    var temp = resposta[0].temperatura;
    var tempSimulado = resposta[0].valor_aleatorio;
    
    var classe_temperatura = 'cor-alerta';

    
    var grauDeAviso ='';


    if (temp < 1 || temp > 7) {
        classe_temperatura = 'cor-alerta perigo-frio';
        grauDeAviso = 'perigo frio'
        grauDeAvisoCor = 'cor-alerta perigo-frio'
        exibirAlerta(temp, idSensor, grauDeAviso, grauDeAvisoCor)
        
    } else if (temp >= 2 && temp <= 6) {
        classe_temperatura = 'cor-alerta ideal';
        grauDeAvisoCor = 'cor-alerta ideal'
        exibirAlerta(temp, idSensor, grauDeAviso, grauDeAvisoCor)
    }
    else if (temp < 2 || temp > 6) {

        classe_temperatura = 'cor-alerta alerta-frio';
        grauDeAviso = 'alerta frio'
        grauDeAvisoCor = 'cor-alerta alerta-frio'
        exibirAlerta(temp, idSensor, grauDeAviso, grauDeAvisoCor)
    }

}

function exibirAlerta(temp, idSensor, grauDeAviso, grauDeAvisoCor) {
    var indice = alertas.findIndex(item => item.idSensor == idSensor);

    if (indice >= 0) {
        alertas[indice] = { idSensor, temp, grauDeAvisoCor }
    } else {
        alertas.push({ idSensor, temp, grauDeAvisoCor });
    }

    exibirCards();
    
}

function removerAlerta(idSensor) {
    alertas = alertas.filter(item => item.idSensor != idSensor);
    exibirCards();
}
 
function exibirCards() {
    div_sensor.innerHTML = '';

    for (var i = 0; i < alertas.length; i++) {
        var mensagem = alertas[i];
        div_sensor.innerHTML += transformarEmDiv(mensagem);
    }
}

function transformarEmDiv({ idSensor, temp, grauDeAvisoCor }) {
    return `
    <div class="cards_temperatura ${grauDeAvisoCor}" id="cards_temperatura_sensor${idSensor}">
    <h5> sensor ${idSensor} </h5>
        <div id="sensor${idSensor}" class="grau">
            ${temp}ºC
        </div>
    <a href="./grafico_local.html"><button>Ver alerta </button></a>
</div>`;
}
