angular.module "AnalysisFrontendApp.controllers"
    .controller "authController", [
        "$scope"
        "$http"
        "$window"
        ($scope, $http, $window) ->
            $scope.user = 
                email: ""
                password: ""
            $scope.submit = ->
                $http
                    .post "/api/auth/login", $scope.user
                    .success (data, status, headers, config) ->
                        console.log data, status, headers, config
                        $window.sessionStorage.token = data.token
                    .error (data, status, headers, config) ->
                        console.log data, status, headers, config
                        delete $window.sessionStorage.token
    ]
