angular.module "AnalysisFrontendApp.controllers"
    .controller "sidebarController", [
        "$http"
        "$scope"
        "$window"
        "$location"
        "instrumentService"
        ($http, $scope, $window, $location, instrumentService) ->
            instrumentService.get()
                .success (data, status, headers, config) ->
                    $scope.instruments = data
                .error (data, status, headers, config) ->
                    if status is 403
                        delete $window.sessionStorage.token
    ]
