angular.module "AnalysisFrontendApp.services"
    .service "dataService", [
        "$http"
        "$window"
        "$location"
        "instrumentService"
        ($http, $window, $location, instrumentService) ->
            dataService = {}
            instrumentService.get()
                .success (data, status, headers, config) ->
                    dataService.instruments = data
                .error (data, status, headers, config) ->
                    if status is 403
                        delete $window.sessionStorage.token
            dataService
    ]
