angular.module "AnalysisFrontendApp.controllers"
    .controller "navController", [
        "$http"
        "$scope"
        "$window"
        "$location"
        ($http, $scope, $window, $location) ->
            $scope.logout = ->
                if $window.sessionStorage.token?
                    delete $window.sessionStorage.token
                $location.path "/"
            $scope.isActive = (viewLocation) ->
                viewLocation is $location.path()
            $scope.isLoggedIn = ->
                $window.sessionStorage.token?
    ]
