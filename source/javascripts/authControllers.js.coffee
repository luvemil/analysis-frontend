angular.module "AnalysisFrontendApp.controllers"
    .controller "sessionsController", [
        "$scope"
        "$http"
        "$window"
        "$location"
        ($scope, $http, $window, $location) ->
            $scope.user = 
                email: ""
                password: ""
            $scope.new = ->
                $http
                    .post "/api/auth/login", $scope.user
                    .success (data, status, headers, config) ->
                        $window.sessionStorage.token = data.token
                        $location.path "/plots"
                    .error (data, status, headers, config) ->
                        delete $window.sessionStorage.token
    ]
    .controller "registrationsController", [
        "$scope"
        "$http"
        "$window"
        "$location"
        ($scope, $http, $window, $location) ->
            $scope.user = 
                email: ""
                password: ""
            $scope.new = ->
                $http
                    .post "/api/user/create", $scope.user
                    .success (data, status, headers, config) ->
                        $window.sessionStorage.token = data.token
                        $location.path "/plots"
                    .error (data, status, headers, config) ->
                        delete $window.sessionStorage.token
    ]
