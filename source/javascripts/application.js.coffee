app = angular.module "AnalysisFrontendApp", [
    "ngRoute"
    "AnalysisFrontendApp.directives"
    "AnalysisFrontendApp.controllers"
    "AnalysisFrontendApp.factories"
]

app.config [
    "$routeProvider"
    "$locationProvider"
    "$httpProvider"
    ($routeProvider, $locationProvider, $httpProvider) ->
        $routeProvider
            .when '/welcome', {templateUrl: 'views/welcome.html', controller: 'welcomeController'} 
            .when '/login', {templateUrl: 'views/login.html', controller: 'authController'} 
            .when '/plots', {templateUrl: 'views/plots.html', controller: 'statsController'} 

        $locationProvider.html5Mode false
        $httpProvider.interceptors.push 'authInterceptor' 
]


