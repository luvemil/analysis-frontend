angular.module "AnalysisFrontendApp.controllers", []
    .controller "statsController", [
        "$scope"
        "$http"
        ($scope, $http) ->
            $http.get "/api/instrument/rawdata?name=EUR_USD&granularity=M5&count=40"
                .success (res) ->
                    console.log "candles", res.candles
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
    ]
