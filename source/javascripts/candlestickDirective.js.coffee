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
            candlestick = new d3.chart.Candlestick()
                .width width
                .height height
                .margin {
                    left: 100
                    top: 20
                    bottom: 100
                    right: 100
                }
                .x_scale d3.time.scale()
            d3.select element[0]
                .datum scope.data.candles
                .call candlestick.draw
            line = new d3.chart.Line()
                .width candlestick.width()
                .height candlestick.height()
                .margin candlestick.margin()
                .x_scale candlestick.x_scale()
                .y_scale candlestick.y_scale()
                .x_value (d) -> new Date d.time
                .y_value (d) -> d.value
            d3.select element[0]
                .datum scope.data.stats
                .call line.draw
            axes = new d3.chart.Axes()
                .x_scale candlestick.x_scale()
                .y_scale candlestick.y_scale()
            d3.select element[0]
                .select "svg"
                .select "g"
                .datum 1
                .call axes.draw
