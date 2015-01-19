angular.module "AnalysisFrontendApp.controllers"
    .controller "navController", [
        "$scope"
        "$window"
        "$location"
        ($scope, $window, $location) ->
            $scope.logout = ->
                if $window.sessionStorage.token?
                    delete $window.sessionStorage.token
                $location.path "/"
            $scope.isActive = (viewLocation) ->
                viewLocation is $location.path()
            $scope.isLoggedIn = ->
                $window.sessionStorage.token?
    ]
