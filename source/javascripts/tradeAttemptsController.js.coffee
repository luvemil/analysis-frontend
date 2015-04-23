angular.module "AnalysisFrontendApp.controllers"
    .controller "tradeAttemptsController", [
        "$scope"
        "TradeAttempts"
        ($scope, TradeAttempts) ->
            $scope.attempts = TradeAttempts.query {
                time:
                    ">": new Date "October 13, 1981"
                    "<": new Date "October 14, 1981"
            }
    ]
