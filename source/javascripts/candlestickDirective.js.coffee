angular.module "AnalysisFrontendApp.directives", []
    .directive "d3Candlestick", ->
        restrict: "EA"
        scope: {
            data: "="
        }
        link: (scope, element, attrs) ->
            #width = element[0].clientWidth
            width = 800
            factor = 0.618
            height = width * factor
            candlestick = new d3.chart.Candlestick
            candlestick
                .width width
                .height height
            d3.select element[0]
                .datum scope.data.candles
                .call candlestick.draw
