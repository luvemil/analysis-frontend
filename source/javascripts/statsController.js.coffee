angular.module "AnalysisFrontendApp.controllers", []
    .controller "statsController", [
        "$scope"
        "$http"
        "$location"
        "$routeParams"
        "instrumentService"
        ($scope, $http, $location, $routeParams, instrumentService) ->
            $scope.signals = {}
            name = $routeParams.instrument
            instrumentService.get()
                .success (data, status, headers, config) ->
                    $scope.instrument = $.grep(data, (d) -> d.instrument is name)[0]
                .error (data, status, headers, config) ->
                    console.warn error
                    $location.path "/login"
            $http.get "/api/instrument/rawdata?name=#{name}&granularity=D&count=40"
                .error (data, status) ->
                    if status is 403
                        $location.path "/login"
                .success (res) ->
                    $http.post "/api/instrument/adr", res
                        .success (adr) ->
                            $scope.adr = [{name: "adr", values: adr}]
                        .error (data, status) ->
                            if status is 403
                                $location.path "/login"
                    $http.post "/api/signal/adr", res
                        .success (res) ->
                            $scope.signals.adr = res
                        .error (data, status) ->
                            if status is 403
                                $location.path "/login"
            $http.get "/api/instrument/rawdata?name=#{$routeParams.instrument}&granularity=M5&count=40"
                .error (data, status) ->
                    if status is 403
                        $location.path "/login"
                .success (res) ->
                    $scope.candles = res
                    $http.post "/api/instrument/ema5", $scope.candles
                        .success (res) ->
                            $scope.ema5 = res
                        .error (data, status) ->
                            if status is 403
                                $location.path "/login"
                    $http.post "/api/instrument/ema10", $scope.candles
                        .success (res) ->
                            $scope.ema10 = res
                        .error (data, status) ->
                            if status is 403
                                $location.path "/login"
                    $http.post "/api/instrument/rsi", $scope.candles
                        .success (res) ->
                            $scope.rsi = [{name: "rsi", values: res}]
                        .error (data, status) ->
                            if status is 403
                                $location.path "/login"
                    $http.post "/api/instrument/stoch", $scope.candles
                        .success (res) ->
                            $scope.stoch = res
                        .error (data, status) ->
                            if status is 403
                                $location.path "/login"
                    $http.post "/api/signal/ema5ema10", $scope.candles
                        .success (res) ->
                            $scope.signals.ema5ema10 = res
                        .error (data, status) ->
                            if status is 403
                                $location.path "/login"
                    $http.post "/api/signal/rsi", $scope.candles
                        .success (res) ->
                            $scope.signals.rsi = res
                        .error (data, status) ->
                            if status is 403
                                $location.path "/login"
                    $http.post "/api/signal/stoch", $scope.candles
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
            $('input[name="daterange"]').daterangepicker({timePicker: true}, (start, end, label) ->
                $scope.start = start.toISOString()
                $scope.end = end.toISOString()
            )
            $scope.historical_data = ->
                $http.get "/api/instrument/historical?name=#{$scope.instrument}&granularity=#{$scope.granularity}&start=#{$scope.start}&end=#{$scope.end}"
                    .error (data, status) ->
                        if status is 403
                            $location.path "/login"
                    .success (data, status) ->
                        a = document.createElement('a')
                        a.href = 'data:attachment/json;charset=utf-8,' + encodeURI(data)
                        a.target = '_blank'
                        a.download = 'filename.json'
                        document.body.appendChild(a)
                        a.click()
    ]
