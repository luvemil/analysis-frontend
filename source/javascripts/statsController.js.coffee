angular.module "AnalysisFrontendApp.controllers", []
    .controller "statsController", [
        "$scope"
        "$http"
        ($scope, $http) ->
            $http.get "http://localhost:1337/api/instrument/rawdata?name=EUR_USD&granularity=M5&count=40"
                .success (res) ->
                    $scope.candles = res.candles
            $http.get "http://localhost:1337/api/instrument/ema5?name=EUR_USD&count=40"
                .success (res) ->
                    $scope.ema5 = res
            $http.get "http://localhost:1337/api/instrument/ema10?name=EUR_USD&count=40"
                .success (res) ->
                    $scope.ema10 = res
            $http.get "http://localhost:1337/api/instrument/rsi?name=EUR_USD&count=40"
                .success (res) ->
                    $scope.rsi = res
            $http.get "http://localhost:1337/api/instrument/adr?name=EUR_USD&count=40"
                .success (res) ->
                    $scope.adr = res
            $http.get "localhost:1337/api/instrument/stoch?name=EUR_USD&count=20"
                .success (res) ->
                    $scope.stoch = res
    ]
