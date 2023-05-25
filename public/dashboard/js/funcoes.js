function validarSessao() {
    // aguardar();

    var cep = sessionStorage.CEP_ENDERECO;
    var bairro = sessionStorage.BAIRRO_ENDERECO;
    var numero = sessionStorage.NUMERO_ENDERECO;
    var complemento = sessionStorage.COMPLEMENTO_ENDERECO;

   
    
 
    var b_cep = document.getElementById("b_cep");
    var b_bairro = document.getElementById("b_bairro");
    var b_numero = document.getElementById("b_numero");
    var b_complemento = document.getElementById("b_complemento");
 
    if (cep != null && bairro != null && numero != null && complemento != null) {
        // window.alert(`Seja bem-vindo, ${nome}!`);
        b_cep.innerHTML = cep;
        b_bairro.innerHTML = bairro;
        b_numero.innerHTML = numero;
        b_complemento.innerHTML = complemento;

        // finalizarAguardar();
    } else {
        window.location = "../login.html";
    }
}

function limparSessao() {
    // aguardar();
    sessionStorage.clear();
    // finalizarAguardar();
    window.location = "../login.html";
}

// carregamento (loading)
function aguardar() {
    var divAguardar = document.getElementById("div_aguardar");
    divAguardar.style.display = "flex";
}

function finalizarAguardar(texto) {
    var divAguardar = document.getElementById("div_aguardar");
    divAguardar.style.display = "none";

    var divErrosLogin = document.getElementById("div_erros_login");
    if (texto) {
        divErrosLogin.style.display = "flex";
        divErrosLogin.innerHTML = texto;
    }
}


// modal
function mostrarModal() {
    var divModal = document.getElementById("div_modal");
    divModal.style.display = "flex";
}

function fecharModal() {
    var divModal = document.getElementById("div_modal");
    divModal.style.display = "none";
}
