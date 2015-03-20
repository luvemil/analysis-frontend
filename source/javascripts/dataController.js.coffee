angular.module "AnalysisFrontendApp.controllers"
    .controller "dataController", [
        "$scope"
        "$http"
        "$window"
        "dataService"
        "instrumentService"
        ($scope, $http, $window, dataService, instrumentService) ->
            if $window.sessionStorage.token?
                $http.get "/api/user/findOne"
                    .success (data, status, headers, config) ->
                        $scope.user = data
                    .error (data, status, headers, config) ->
                        if status is 403
                            delete $window.sessionStorage.token
            instrumentService.get()
                .success (data, status, headers, config) ->
                    $scope.instruments = data
                .error (data, status, headers, config) ->
                    if status is 403
                        delete $window.sessionStorage.token
    ]
