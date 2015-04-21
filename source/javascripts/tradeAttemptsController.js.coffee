angular.module "AnalysisFrontendApp.controllers"
    .controller "tradeAttemptsController", [
        "$scope"
        "instrumentService"
        "TradeAttempts"
        ($scope, instrumentService, TradeAttempts) ->
            $scope.attempts = TradeAttempts.query()
    ]
