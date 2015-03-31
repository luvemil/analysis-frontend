angular.module "AnalysisFrontendApp.services"
    .service "dataService", [
        "$http"
        "$window"
        "instrumentService"
        ($http, $window, instrumentService) ->
            dataService = {}
            getUser = (arg) ->
                $http.get "/api/user/findOne"
                    .success (data, status, headers, config) ->
                        arg.user = data
                    .error (data, status, headers, config) ->
                        if status is 403
                            delete $window.sessionStorage.token

            getInstruments = (arg) ->
                instrumentService.get()
                    .success (data, status, headers, config) ->
                        arg.instruments = data
                    .error (data, status, headers, config) ->
                        if status is 403
                            delete $window.sessionStorage.token

            dataService.fun = (arg) ->
                getUser arg
                getInstruments arg

            dataService
    ]
