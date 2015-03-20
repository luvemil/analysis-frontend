angular.module "AnalysisFrontendApp.services"
    .service "dataService", [
        "$http"
        "$window"
        "instrumentService"
        ($http, $window, instrumentService) ->
            dataService = {}
            getUser = () ->
                user = ""
                $http.get "/api/user/findOne"
                    .success (data, status, headers, config) ->
                        user = data
                    .error (data, status, headers, config) ->
                        if status is 403
                            delete $window.sessionStorage.token
                user
            dataService.fun = (arg) ->
                arg.user = getUser()
                instrumentService.get()
                    .success (data, status, headers, config) ->
                        arg.instruments = data
                    .error (data, status, headers, config) ->
                        if status is 403
                            delete $window.sessionStorage.token
            dataService
    ]
