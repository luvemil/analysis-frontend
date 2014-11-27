angular.module "AnalysisFrontendApp.controllers", []
    .controller "statsController", [
        "$scope"
        "$http"
        ($scope, $http) ->
            $scope.signals = {}
            $http.get "/api/instrument/rawdata?name=EUR_USD&granularity=M5&count=40"
                .success (res) ->
                    $scope.candles = res.candles
            $http.get "/api/instrument/ema5?name=EUR_USD&count=40"
                .success (res) ->
                    $scope.ema5 = res
            $http.get "/api/instrument/ema10?name=EUR_USD&count=40"
                .success (res) ->
                    $scope.ema10 = res
            $http.get "/api/instrument/rsi?name=EUR_USD&count=40"
                .success (res) ->
                    $scope.rsi = [{name: "rsi", values: res}]
            $http.get "/api/instrument/adr?name=EUR_USD&count=40"
                .success (res) ->
                    $scope.adr = [{name: "adr", values: res}]
            $http.get "/api/instrument/stoch?name=EUR_USD&count=40"
                .success (res) ->
                    $scope.stoch = res
            $http.get "/api/signal/adr?name=EUR_USD"
                .success (res) ->
                    $scope.signals.adr = res
            $http.get "/api/signal/ema5ema10?name=EUR_USD"
                .success (res) ->
                    $scope.signals.ema5ema10 = res
            $http.get "/api/signal/rsi?name=EUR_USD"
                .success (res) ->
                    $scope.signals.rsi = res
            $http.get "/api/signal/stoch?name=EUR_USD"
                .success (res) ->
                    $scope.signals.stoch = res
    ]
