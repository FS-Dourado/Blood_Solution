var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

router.get("/", function (req, res) {
    usuarioController.testar(req, res);
});

router.get("/listar", function (req, res) {
    usuarioController.listar(req, res);
});

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    usuarioController.cadastrar(req, res);
})


router.post("/cadastrar_lote", function (req, res) {
    usuarioController.cadastrar_lote(req, res);
})


router.post("/cadastrar_funcionario", function (req, res) {
    usuarioController.cadastrar_funcionario(req, res);
})

router.post("/cadastrar_local", function (req, res) {
    usuarioController.cadastrar_local(req, res);
})

router.post("/autenticar", function (req, res) {
    usuarioController.entrar(req, res);
});

router.post("/verificar_email", function (req, res) {
    usuarioController.verificar_email(req, res);
});

router.post("/cadastrar_lote", function (req, res){
    usuarioController.cadastrar_lote(req, res);
});

router.get("/lotes", function (req, res) {
    usuarioController.lotes(req, res);
});


module.exports = router;