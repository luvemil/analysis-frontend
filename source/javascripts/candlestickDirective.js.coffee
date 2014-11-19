angular.module "AnalysisFrontendApp.directives", []
    .directive "d3Candlestick", ->
        restrict: "EA"
        scope: {
            data: "="
        }
        link: (scope, element, attrs) ->
            console.log scope.data
            width = element[0].clientWidth
            factor = 0.618
            height = width * factor
            candlestick = new d3.chart.Candlestick
            candlestick
                .width width
                .height height
            d3.select element[0]
                .datum scope.data
                .call candlestick.draw
