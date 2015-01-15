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
            .when '/welcome', {templateUrl: 'views/welcome.html', controller: 'welcomeController'} 
            #.when '/login', {templateUrl: 'views/auth.html', controller: 'authController'} 
            .when '/plots', {templateUrl: 'views/plots.html', controller: 'statsController'} 

        $locationProvider.html5Mode false
]
