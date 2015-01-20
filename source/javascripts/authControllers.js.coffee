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
            $scope.showerror = false
            $scope.new = ->
                $http
                    .post "/api/auth/login", $scope.user
                    .success (data, status, headers, config) ->
                        $window.sessionStorage.token = data.token
                        $location.path "/plots"
                    .error (data, status, headers, config) ->
                        $scope.showerror = true
                        delete $window.sessionStorage.token
    ]
    .controller "registrationsController", [
        "$scope"
        "$http"
        "$window"
        "$location"
        ($scope, $http, $window, $location) ->
            if $window.sessionStorage.token?
                $http.get "/api/user/findOne"
                    .success (data, status, headers, config) ->
                        $scope.user = data
                    .error (data, status, headers, config) ->
                        if status is 403
                            delete $window.sessionStorage.token
            else
                $scope.user = 
                    email: ""
                    password: ""
            $scope.showerror = false
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
                    .put "/api/user/update", $scope.user
                    .success (data, status, headers, config) ->
                        $scope.showsuccess = true
                        console.log "PUT GOT DATA", data
                    .error (data, status, headers, config) ->
                        console.warn "PUT GOT ERROR", data
    ]
