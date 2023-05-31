var alertas = [];
var alertasSimulados = [];


function buscarInsertsSimulados(valor_aleatorio) {
    fetch(`/medidas/buscarInsertsSimulados/${valor_aleatorio}`)
        .then(respostaSimulada => {

            if (respostaSimulada.ok) {
                respostaSimulada.json().then(respostaSimulada => {

                    console.log(`Dados recebidos: ${JSON.stringify(respostaSimulada)}`);

                    alertarSimulado(respostaSimulada, valor_aleatorio);
                });
            } else {

                console.error('Nenhum dado encontrado ou erro na API');
            }
        })
        .catch(function (error) {
            console.error(`Erro na obtenção dos dados simulados: ${error.message}`);
        });
}
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

function alertar(resposta, idSensor) {
    var temp = resposta[0].temperatura;

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

function alertarSimulado(respostaSimulada, idSensor){
    var tempSimulado = respostaSimulada[0].temperatura;

    var classe_temperatura = 'cor-alerta';

// temp Simulados

if (tempSimulado < 1 || tempSimulado > 7) {
    classe_temperatura = 'cor-alerta perigo-frio';
    grauDeAviso = 'perigo frio'
    grauDeAvisoCor = 'cor-alerta perigo-frio'
    exibirAlertaSimulado(tempSimulado, idSensor, grauDeAviso, grauDeAvisoCor)
    
} else if (tempSimulado >= 2 && tempSimulado <= 6) {
    classe_temperatura = 'cor-alerta ideal';
    grauDeAvisoCor = 'cor-alerta ideal'
    exibirAlertaSimulado(tempSimulado, idSensor, grauDeAviso, grauDeAvisoCor)
}
else if (tempSimulado < 2 || tempSimulado > 6) {

    classe_temperatura = 'cor-alerta alerta-frio';
    grauDeAviso = 'alerta frio'
    grauDeAvisoCor = 'cor-alerta alerta-frio'
    exibirAlertaSimulado(tempSimulado, idSensor, grauDeAviso, grauDeAvisoCor)
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


function exibirAlertaSimulado(tempSimulado, idSensor, grauDeAviso, grauDeAvisoCor) {
    var indice = alertasSimulados.findIndex(item => item.idSensor == 2);

    if (indice >= 0) {
        alertasSimulados[indice] = { idSensor, tempSimulado, grauDeAvisoCor }
    } else {
        alertasSimulados.push({ idSensor, tempSimulado, grauDeAvisoCor });
    }

    exibirCardsSimulados();
    
}

function removerAlerta(idSensor) {
    alertas = alertas.filter(item => item.idSensor != idSensor);
    exibirCards();
}
function removerAlertaSimulado(idSensor) {
    alertasSimulados = alertasSimulados.filter(item => item.idSensor != idSensor);
    exibirCardsSimulados();
}

function exibirCards() {
    div_sensor1.innerHTML = '';


    for (var i = 0; i < alertas.length; i++) {
        var mensagem = alertas[i];
    }
    div_sensor1.innerHTML = transformarEmDiv(mensagem);
}
function exibirCardsSimulados() {
    
    div_sensor2.innerHTML = '';

    var mensagem = alertasSimulados[0];
    
    div_sensor2.innerHTML = divInsertSimulado(mensagem);
}

function transformarEmDiv({temp, grauDeAvisoCor}) {
    return `
    <div class="cards_temperatura ${grauDeAvisoCor}" id="cards_temperatura_sensor1">
    <h5> sensor 1 </h5>
        <div id="sensor1" class="grau">
            ${temp}ºC
        </div>
    <a href="./grafico_local.html"><button>Ver alerta </button></a>
</div>`;
}

function divInsertSimulado({tempSimulado, grauDeAvisoCor}) {
    return `
    <div class="cards_temperatura ${grauDeAvisoCor}" id="cards_temperatura_sensor2">
    <h5> sensor 2</h5>
        <div id="sensor2" class="grau">
            ${tempSimulado}ºC
        </div>
    <a href="./grafico_local.html"><button>Ver alerta </button></a>
</div>`;
}