angular.module "AnalysisFrontendApp.directives"
    .directive "d3TradeAttemptsSingleInstrument", ->
        restrict: "EA"
        scope: {
            attempts: "="
        }
        link: (scope, element, attrs) ->
            width = element.parent()[0].offsetWidth
            factor = 0.618
            height = 4 * 20
            signals = ["adr", "ema5ema10", "rsi", "stoch"]
            margin = {
                left: 0.1 * width
                right: 0.1 * width
                top: 0.05 * height
                bottom: 0.05 * height
            }

            scope.$watch "attempts", (data) ->
                return unless data?
                console.log "attempts", data

                x_scale = d3.time.scale()
                    .domain d3.extent data, (d) -> new Date(d.time)
                    .range [0, width]

                x_axis = d3.svg.axis()
                    .orient "top"
                    .scale x_scale

                y_axis = d3.svg.axis()
                    .orient "left"
                    .scale y_scale

                y_scale = d3.scale.ordinal()
                    .domain signals
                    .rangeRoundPoints [0, height]

                color_scale = d3.scale.ordinal()
                    .domain ["buy", "false", "sell", true]
                    .range ["#1a9641", "#fdae61", "#d7191c", "#1a9641"]

                rectheight = Math.floor(y_scale.range()[1] - y_scale.range()[0] - 1)
                rectwidth = Math.floor(x_scale(new Date(data[1].time)) - x_scale(new Date(data[0].time))) - 1
                console.log "rects", rectwidth, rectheight
                console.log "svg", width, height

                svg = d3.select element[0]
                    .selectAll "svg"
                    .data [data]

                g_enter = svg.enter()
                    .append "svg"
                    .append "g"

                svg
                    .attr "width", width + margin.left + margin.right
                    .attr "height", height + margin.top + margin.bottom

                g = svg.select "g"
                    .attr "transform", "translate(#{margin.left}, #{margin.top})"

                times = g.selectAll ".times"
                    .data (d) -> d

                times
                    .enter()
                    .append "g"
                    .classed "rects", true
                    .attr "transform", (d) -> "translate(#{x_scale(new Date(d.time))}, 0)"

                rects = g.selectAll ".rects"
                    .selectAll ".rect"
                    .data signals

                rects
                    .enter()
                    .append "rect"
                    .classed ".rect", true

                rects
                    .attr "width", rectwidth
                    .attr "height", rectheight
                    .attr "x", 0
                    .attr "y", y_scale
                    .attr "fill", (d, i, j) ->
                        status = times[0][j].__data__[d]
                        color_scale status

                rects.exit().remove()
                times.exit().remove()
