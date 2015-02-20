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
                        $location.path "/profile"
                    .error (data, status, headers, config) ->
                        $scope.showerror = true
                        delete $window.sessionStorage.token
    ]
    .controller "registrationsController", [
        "$scope"
        "$http"
        "$window"
        "$location"
        "instrumentService"
        ($scope, $http, $window, $location, instrumentService) ->
            if $window.sessionStorage.token?
                $http.get "/api/user/findOne"
                    .success (data, status, headers, config) ->
                        $scope.user = data
                        $scope.selected = data.favorites or []
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
                $scope.user.favorites = $scope.selected
                $http
                    .put "/api/user/update", $scope.user
                    .success (data, status, headers, config) ->
                        $scope.showsuccess = true
                    .error (data, status, headers, config) ->
                        if status is 403
                            delete $window.sessionStorage.token
            instrumentService.get()
                .success (data, status, headers, config) ->
                    $scope.instruments = data
                .error (data, status, headers, config) ->
                    if status is 403
                        delete $window.sessionStorage.token

            $scope.toggleSelection = (name) ->
                index = $scope.selected.indexOf name
                if index > -1
                    $scope.selected.splice(index, 1)
                else
                    $scope.selected.push(name)
    ]
