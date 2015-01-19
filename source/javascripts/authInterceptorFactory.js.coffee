angular.module "AnalysisFrontendApp.factories", []
    .factory "authInterceptorFactory", [
        "$rootScope"
        "$q"
        "$window"
        ($rootScope, $q, $window) ->
            request: (config) ->
                config.headers or= {}
                if $window.sessionStorage.token?
                    config.headers.access_token = $window.sessionStorage.token
                return config
            response: (response) ->
                if response.status is 401
                    #not logged in
                else
                    return response or $q.when response
    ]
