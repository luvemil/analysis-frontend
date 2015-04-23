angular.module "AnalysisFrontendApp.services"
    .factory "TradeAttempts", [
        "$resource", 
        ($resource) ->
            $resource "/api/tradeattempt/find", {}, {
                "query": {
                    method: "post"
                    transformResponse: [
                        angular.fromJson
                        (data) -> data.map (d) ->
                            d.time = new Date d.time
                            d
                        (data) -> _.groupBy data, "instrument"
                    ]
                }
            }
    ]
