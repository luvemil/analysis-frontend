angular.module "AnalysisFrontendApp.services"
    .service "dataService", [
        "$http"
        "$window"
        "instrumentService"
        ($http, $window, instrumentService) ->
            dataService = {}
            getUser = () ->
                $http.get "/api/user/findOne"
                    .success (data, status, headers, config) ->
                        user = data
                    .error (data, status, headers, config) ->
                        if status is 403
                            delete $window.sessionStorage.token
                user
            dataService.fun = (arg) ->
                if $window.sessionStorage.token?
                    $http.get "/api/user/findOne"
                        .success (data, status, headers, config) ->
                            arg.user = data
                        .error (data, status, headers, config) ->
                            if status is 403
                                delete $window.sessionStorage.token
                instrumentService.get()
                    .success (data, status, headers, config) ->
                        arg.instruments = data
                    .error (data, status, headers, config) ->
                        if status is 403
                            delete $window.sessionStorage.token
            dataService
    ]
