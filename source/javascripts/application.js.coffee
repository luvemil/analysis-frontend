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
    "$rootScope"
    "$window"
    ($routeProvider, $locationProvider, $httpProvider, $rootScope, $window) ->
        $routeProvider
            .when '/welcome', {templateUrl: 'views/welcome.html', controller: 'welcomeController'} 
            .when '/login', {templateUrl: 'views/login.html', controller: 'sessionsController'} 
            .when '/signup', {templateUrl: 'views/signup.html', controller: 'registrationsController'} 
            .when '/plots', {templateUrl: 'views/plots.html', controller: 'statsController'} 

        $locationProvider.html5Mode false
        $httpProvider.interceptors.push 'authInterceptorFactory' 
        $rootScope.isLoggedIn = ->
            $window.sessionStorage.token?
]
