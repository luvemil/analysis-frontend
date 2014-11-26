angular.module "AnalysisFrontendApp.directives", []
    .directive "d3Candlestick", ->
        restrict: "EA"
        scope: {
            candles: "="
            ema5: "="
            ema10: "="
        }
        link: (scope, element, attrs) ->
            width = element.parent()[0].offsetWidth
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
                return unless data?
                candlestick.x_scale()
                    .domain d3.extent data, candlestick.time_value()
                candlestick.y_scale()
                    .domain [
                        d3.min data, candlestick.low_value()
                        d3.max data, candlestick.high_value()
                    ]
                d3.select element[0]
                    .datum data
                    .call candlestick.draw
                d3.select element[0]
                    .select "svg"
                    .select "g"
                    .datum 1
                    .call axes.draw
            scope.$watchGroup ["ema5", "ema10"], (data) ->
                # wait for both datasets to come
                return unless data[0]? and data[1]?
                emas = [{
                    name: "ema5"
                    values: data[0]
                }, {
                    name: "ema10"
                    values: data[1]
                }]
                ema.x_scale().domain(d3.extent(data[0], ema.x_value()))
                ema.y_scale().domain(d3.extent(data[0], ema.y_value()))
                d3.select element[0]
                    .datum emas
                    .call ema.draw
