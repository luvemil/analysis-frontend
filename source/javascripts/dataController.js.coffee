angular.module "AnalysisFrontendApp.controllers"
    .controller "dataController", [
        "$scope"
        "$http"
        "$window"
        "dataService"
        ($scope, $http, $window, dataService) ->
            dataService.fun($scope)
    ]
