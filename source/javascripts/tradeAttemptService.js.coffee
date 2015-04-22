angular.module "AnalysisFrontendApp.services"
    .factory "TradeAttempts", [
        "$resource", 
        ($resource) ->
            $resource "/api/tradeattempt/find", {}, {
                "query": {
                    method: "post"
                    isArray: true
                }
            }
    ]
