angular.module "AnalysisFrontendApp.controllers", []
    .controller "statsController", [
        "$scope"
        "$http"
        "$location"
        ($scope, $http, $location) ->
            $scope.signals = {}
            $http.get "/api/instrument/rawdata?name=EUR_USD&granularity=M5&count=40"
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
                    $http.post "/api/instrument/adr", $scope.candles
                        .success (res) ->
                            $scope.adr = [{name: "adr", values: res}]
                        .error (data, status) ->
                            if status is 403
                                $location.path "/login"
                    $http.post "/api/instrument/stoch", $scope.candles
                        .success (res) ->
                            $scope.stoch = res
                        .error (data, status) ->
                            if status is 403
                                $location.path "/login"
            #$http.get "/api/signal/adr?name=EUR_USD"
                #.success (res) ->
                    #$scope.signals.adr = res
                #.error (data, status) ->
                    #if status is 403
                        #$location.path "/login"
            #$http.get "/api/signal/ema5ema10?name=EUR_USD"
                #.success (res) ->
                    #$scope.signals.ema5ema10 = res
                #.error (data, status) ->
                    #if status is 403
                        #$location.path "/login"
            #$http.get "/api/signal/rsi?name=EUR_USD"
                #.success (res) ->
                    #$scope.signals.rsi = res
                #.error (data, status) ->
                    #if status is 403
                        #$location.path "/login"
            #$http.get "/api/signal/stoch?name=EUR_USD"
                #.success (res) ->
                    #$scope.signals.stoch = res
                #.error (data, status) ->
                    #if status is 403
                        #$location.path "/login"
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
