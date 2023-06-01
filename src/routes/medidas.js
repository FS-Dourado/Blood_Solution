var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas/:idSensor", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

router.get("/tempo-real/:idSensor", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})
router.post("/insertSimulados", function (req, res) {
    medidaController.insertSimulados(req, res);
});
router.get("/buscarInsertsSimulados/:valor_aleatorio", function (req, res) {
    medidaController.buscarInsertsSimulados(req, res);
});
module.exports = router;