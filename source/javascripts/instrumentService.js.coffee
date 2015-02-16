angular.module "AnalysisFrontendApp.services", []
    .service "instrumentService", [
        "$http",
        ($http) ->
            instrumentService = {}
            instrumentService.get = ->
                $http.get "/api/instrument/index", {cache: true}
            instrumentService
    ]
