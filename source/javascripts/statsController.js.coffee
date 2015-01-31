angular.module "AnalysisFrontendApp.controllers", []
    .controller "statsController", [
        "$scope"
        "$http"
        "$location"
        ($scope, $http, $location) ->
            $scope.signals = {}
            $http.get "/api/instrument/rawdata?name=EUR_USD&granularity=M5&count=40"
                .success (res) ->
                    $scope.candles = res.candles
                .error (data, status) ->
                    if status is 403
                        $location.path "/login"
            $http.get "/api/instrument/ema5?name=EUR_USD&count=40"
                .success (res) ->
                    $scope.ema5 = res
                .error (data, status) ->
                    if status is 403
                        $location.path "/login"
            $http.get "/api/instrument/ema10?name=EUR_USD&count=40"
                .success (res) ->
                    $scope.ema10 = res
                .error (data, status) ->
                    if status is 403
                        $location.path "/login"
            $http.get "/api/instrument/rsi?name=EUR_USD&count=40"
                .success (res) ->
                    $scope.rsi = [{name: "rsi", values: res}]
                .error (data, status) ->
                    if status is 403
                        $location.path "/login"
            $http.get "/api/instrument/adr?name=EUR_USD&count=40"
                .success (res) ->
                    $scope.adr = [{name: "adr", values: res}]
                .error (data, status) ->
                    if status is 403
                        $location.path "/login"
            $http.get "/api/instrument/stoch?name=EUR_USD&count=40"
                .success (res) ->
                    $scope.stoch = res
                .error (data, status) ->
                    if status is 403
                        $location.path "/login"
            $http.get "/api/signal/adr?name=EUR_USD"
                .success (res) ->
                    $scope.signals.adr = res
                .error (data, status) ->
                    if status is 403
                        $location.path "/login"
            $http.get "/api/signal/ema5ema10?name=EUR_USD"
                .success (res) ->
                    $scope.signals.ema5ema10 = res
                .error (data, status) ->
                    if status is 403
                        $location.path "/login"
            $http.get "/api/signal/rsi?name=EUR_USD"
                .success (res) ->
                    $scope.signals.rsi = res
                .error (data, status) ->
                    if status is 403
                        $location.path "/login"
            $http.get "/api/signal/stoch?name=EUR_USD"
                .success (res) ->
                    $scope.signals.stoch = res
                .error (data, status) ->
                    if status is 403
                        $location.path "/login"
    ]
    .controller "historicalController", [
        "$scope"
        "$http"
        "$location"
        ($scope, $http, $window, $location) ->
            $scope.historical_data = ->
                console.log $scope.instrument
                console.log $scope.granularity
                $http.get "/api/instrument/historical?name=#{$scope.instrument}&granularity=#{$scope.granularity}&start=2014-06-19T15%3A47%3A40Z&end=2014-06-19T15%3A47%3A50Z"
                    .error (data, status) ->
                        if status is 403
                            $location.path "/login"
    ]
