app = angular.module "AnalysisFrontendApp", [
    "ngRoute"
    "validation.match"
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
            .when '/profile', {templateUrl: 'views/edit.html', controller: 'registrationsController'} 
            .when '/login', {templateUrl: 'views/login.html', controller: 'sessionsController'} 
            .when '/signup', {templateUrl: 'views/signup.html', controller: 'registrationsController'} 
            .when '/plots', {templateUrl: 'views/plots.html', controller: 'statsController'} 
            .when '/historical', {templateUrl: 'views/historical.html', controller: 'historicalController'}

        $locationProvider.html5Mode false
        $httpProvider.interceptors.push 'authInterceptorFactory' 
]
