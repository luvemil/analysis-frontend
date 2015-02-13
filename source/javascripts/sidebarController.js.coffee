angular.module "AnalysisFrontendApp.controllers"
    .controller "sidebarController", [
        "$http"
        "$scope"
        "$window"
        "$location"
        ($http, $scope, $window, $location) ->
            $http.get "/api/instrument/index"
                .success (data, status, headers, config) ->
                    $scope.instruments = data
                .error (data, status, headers, config) ->
                    if status is 403
                        delete $window.sessionStorage.token
    ]
