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

function alertar(resposta, idSensor) {
    var temp = resposta[0].temperatura;

    console.log(idSensor === resposta[0].temperatura)
    
    
    if(temp < 1 || temp > 7){
        var tempAtencao;
    } else if(temp >= 2 && temp <= 6){
        var tempIdeal;
    }
    else if(temp < 2 || temp > 6){
        var tempAlerta;

    }

    var limites = {
        atencao: tempAtencao,
        ideal: tempIdeal,
        alerta: tempAlerta 
    };

    if (temp == limites.atencao) {
        id_sensor1.innerHTML = `
        <div id="id_sensor1" class="cards_temperatura" id="cards_temperatura_sensor1" style="background-color: #ce292a;">
        <h5> sensor 1 </h5>
        <div id="sensor1" class="grau">
            -ºC
        </div>
`
    }
    else if (temp == limites.ideal) {
        id_sensor1.innerHTML = `
        <div id="id_sensor1" class="cards_temperatura" id="cards_temperatura_sensor1" style="background-color: #7497b3;">
        <h5> sensor 1 </h5>
        <div id="sensor1" class="grau">
            -ºC
        </div>
`
        removerAlerta(idSensor);
    }
    else if (temp == limites.alerta) {
        id_sensor1.innerHTML = `
        <div id="id_sensor1" class="cards_temperatura" id="cards_temperatura_sensor1" style="background-color: #fffb81;">
        <h5> sensor 1 </h5>
        <div id="sensor1" class="grau">
            -ºC
        </div>
`
        exibirAlerta(temp, idSensor, id_sensor1)
    }
    

    var card;

    if (idSensor == 1) {
        sensor1.innerHTML = temp + "°C";
        card = cards_temperatura_sensor1
    } else if (idSensor == 2) {
        sensor2.innerHTML = temp + "°C";
        card = card_2
    } else if (idSensor == 3) {
        sensor3.innerHTML = temp + "°C";
        card = card_3
    } else if (idSensor == 4) {
        sensor4.innerHTML = temp + "°C";
        card = card_4
    }

    card.className = classe_temperatura;
}
