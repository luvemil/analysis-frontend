angular.module "AnalysisFrontendApp.controllers"
    .controller "dataController", [
        "$scope"
        "$http"
        "$window"
        "dataService"
        "instrumentService"
        ($scope, $http, $window, dataService, instrumentService) ->
            dataService.fun($scope)
    ]
