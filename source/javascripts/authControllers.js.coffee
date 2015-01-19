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
                        $location.path "/profile"
                    .error (data, status, headers, config) ->
                        delete $window.sessionStorage.token
            $scope.edit = ->
                console.log "EDITING"
                $http
                    .put "/api/user", $scope.user
                    .success (data, status, headers, config) ->
                        console.log "PUT GOT DATA", data
                    .error (data, status, headers, config) ->
                        console.warn "PUT GOT ERROR", data
    ]
