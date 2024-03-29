var database = require("../database/config");

function buscarUltimasMedidas(limite_linhas) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top ${limite_linhas}
        dht11_temperatura as temperatura, 
        dht11_umidade as umidade,  
                        momento,
                        FORMAT(momento, 'HH:mm:ss') as historico_grafico
                    from medida
                    where fk_aquario = ${idAquario}
                    order by id desc`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select 
        temperatura as temperatura, 
                        horario,
                        DATE_FORMAT(horario,'%H:%i:%s') as historico_grafico
                    from historico
                    where fkSensor = 1
                    `;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal() {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top 1
        dht11_temperatura as temperatura, 
        dht11_umidade as umidade,  
                        CONVERT(varchar, momento, 108) as momento_grafico, 
                        fk_aquario 
                        from medida where fk_aquario = ${idAquario} 
                    order by id desc`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select 
        temperatura as temperatura, 
                        DATE_FORMAT(horario,'%H:%i:%s') as momento_grafico, 
                        fkSensor 
                        from historico where fkSensor = 1 
                        order by idHistorico desc
                        `;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

//Valores simulados

function insertSimulados(valor_aleatorio) {

    var instrucao = `
        INSERT INTO historico(temperaturaSimulada, horario, fkSensor) VALUES ('${valor_aleatorio}', now(), 2);
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);

    return database.executar(instrucao);


}

function buscarInsertsSimulados(){
    instrucaoSql = ''

    instrucaoSql = `select 
    temperaturaSimulada as temperaturaSimulada, 
                    DATE_FORMAT(horario,'%H:%i:%s') as momento_grafico, 
                    fkSensor
                    from historico where fkSensor = 2 
                    order by idHistorico desc
                    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);


}
module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    insertSimulados,
    buscarInsertsSimulados
}
