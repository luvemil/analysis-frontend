angular.module "AnalysisFrontendApp.controllers", []
    .controller "marcoController", [
        "$scope"
        "$http"
        "$location"
        "$routeParams"
        "instrumentService"
        ($scope, $http, $location, $routeParams, instrumentService) ->
            $scope.signals = {}
            name = $routeParams.instrument
            instrumentService.get()
                .error (data, status, headers, config) ->
                    console.warn error
                    $location.path "/login"
                .success (data, status, headers, config) ->
                    $scope.instrument = $.grep(data, (d) -> d.instrument is name)[0]
                    $http.get "/api/instrument/rawdata?name=#{name}&granularity=D&count=40"
                        .error (data, status) ->
                            if status is 403
                                $location.path "/login"
                        .success (res) ->
                            $http.post "/api/instrument/adr", {candles: res, pip: $scope.instrument.pip}
                                .success (adr) ->
                                    $scope.adr = [{name: "adr", values: adr}]
                                .error (data, status) ->
                                    if status is 403
                                        $location.path "/login"
                            $http.post "/api/signal/adr", {candles: res, pip: $scope.instrument.pip}
                                .success (res) ->
                                    $scope.signals.adr = res
                                .error (data, status) ->
                                    if status is 403
                                        $location.path "/login"
            $http.get "/api/instrument/rawdata?name=#{name}&granularity=M5&count=40"
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