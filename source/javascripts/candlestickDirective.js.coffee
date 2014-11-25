angular.module "AnalysisFrontendApp.directives", []
    .directive "d3Candlestick", ->
        restrict: "EA"
        scope: {
            candles: "="
            ema5: "="
            ema10: "="
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
            ema = new d3.chart.Line()
                .width candlestick.width()
                .height candlestick.height()
                .margin candlestick.margin()
                .x_scale candlestick.x_scale()
                .y_scale candlestick.y_scale()
                .x_value (d) -> new Date d.time
                .y_value (d) -> d.value
            axes = new d3.chart.Axes()
                .x_scale candlestick.x_scale()
                .y_scale candlestick.y_scale()
            scope.$watch "candles", (data) ->
                console.log "candles", data
                unless data?
                    return
                d3.select element[0]
                    .datum data
                    .call candlestick.draw
                d3.select element[0]
                    .select "svg"
                    .select "g"
                    .datum 1
                    .call axes.draw
            scope.$watchGroup ["ema5", "ema10"], (data) ->
                unless data?
                    return
                emas = [{
                    name: "ema5"
                    values: data[0]
                }, {
                    name: "ema10"
                    values: data[1]
                }]
                console.log emas
                console.log "ema range", ema.x_scale().range()
                console.log "ema domain", ema.x_scale().domain()
                ema.x_scale().domain(d3.extent(data[0], ema.x_value()))
                ema.y_scale().domain(d3.extent(data[0], ema.y_value()))
                d3.select element[0]
                    .datum emas
                    .call ema.draw
                console.log ema.color_scale().domain()
