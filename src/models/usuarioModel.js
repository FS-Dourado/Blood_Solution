var database = require("../database/config")

function listar() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
        SELECT * FROM usuario;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function entrar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucao = `
        SELECT usuario.*,
        empresa.nome AS empresa FROM usuario JOIN empresa
	    ON fkEmpresa = idEmpresa
        WHERE email = '${email}' AND senha = '${senha}';

    `;


    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucao
function cadastrar(nome, email, senha, cpf) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha, cpf);

    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
        INSERT INTO lote (qtdBolsa, tipoSanguineo, validade) VALUES ('${qtdBolsaVar}', '${tipo_sangueVar}', '${validadeVar}');
    `;


    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function cadastrar_funcionario(nome, email, senha, fkEmpresa) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar_funcionario():", nome, email, senha, fkEmpresa);

    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
        INSERT INTO usuario (nome, email, senha, tipo, fkEmpresa) VALUES ('${nome}', '${email}', '${senha}', 'Funcionario', ${fkEmpresa});
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}
    function cadastrar_local(nome, cep, bairro, numero, complemento, fkEmpresa) {
        console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar_local():", nome, cep, bairro, numero, complemento, fkEmpresa);
    
        // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
        //  e na ordem de inserção dos dados.
        var instrucao = `
            INSERT INTO local_empresa (nome, cep, bairro, numero, complemento, fkEmpresa) VALUES ('${nome}', '${cep}', '${bairro}', '${numero}', '${complemento}', ${fkEmpresa});
                
        `;
        console.log("Executando a instrução SQL: \n" + instrucao);
        return database.executar(instrucao);
    }
    
    function verificar_email(email) {
        var instrucao = `SELECT * FROM usuario WHERE email = '${email}'`;
        console.log("Executando verificação de e-mail: \n" + instrucao);
        return database.executar(instrucao);
    }
    
    function cadastrar_lote(bolsas, tipoSangue, validade){
        var instrucao = `INSERT INTO lote(qtdBolsa, tipoSanguineo, validade) VALUES 
        ('${bolsas}', '${tipoSangue}', '${validade}' )`
    
        return database.executar(instrucao);
    }

    function lotes(){
        var instrucao = `
        SELECT lote.qtdBolsa, lote.tipoSanguineo, lote.validade FROM lote JOIN local_empresa on fkLocal = idLocal;
        `;

        return database.executar(instrucao);
    }

    function ver_lotes(){
        var instrucao = `
        SELECT * FROM lote;
        `;

        return database.executar(instrucao);
    }

    function deletar_lotes(deletar){
        var instrucao = `
        DELETE FROM lote WHERE idLote = '${deletar}';
        `;

        return database.executar(instrucao);
    }
module.exports = {
    entrar,
    listar,
    cadastrar_funcionario,
    cadastrar_local,
    verificar_email,
    cadastrar_lote,
    lotes,
    ver_lotes,
    deletar_lotes
};