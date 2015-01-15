app = angular.module "AnalysisFrontendApp", [
    "ngRoute"
    "AnalysisFrontendApp.directives"
    "AnalysisFrontendApp.controllers"
]

app.config [
    "$routeProvider"
    "$locationProvider"
    ($routeProvider, $locationProvider) ->
        $routeProvider
            .when '/login', {templateUrl: 'views/auth.html', controller: 'authController'} 

        $locationProvider.html5Mode false
]
