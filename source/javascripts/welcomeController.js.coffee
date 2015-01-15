angular.module "AnalysisFrontendApp.controllers"
    .controller "welcomeController", [
        "$scope"
        ($scope) ->
            console.log "welcome controller"
            $scope.message = "Welcome to the Welcome Controller"
    ]
