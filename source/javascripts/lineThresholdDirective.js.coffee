angular.module "AnalysisFrontendApp.directives", []
    .directive "d3LineThreshold", ->
        restrict: "EA"
        scope: {
            line: "="
            threshold: "="
        }
        link: (scope, element, attrs) ->
            width = element.parent()[0].offsetWidth
            factor = 0.618
            height = width * factor
            line = new d3.chart.Line()
                .width width
                .height height
                .margin {
                    left: 100
                    top: 20
                    bottom: 100
                    right: 100
                }
                .x_scale d3.time.scale()
                .x_value (d) -> new Date d.time
                .y_value (d) -> d.value
            axes = new d3.chart.Axes()
                .x_scale line.x_scale()
                .y_scale line.y_scale()
            scope.$watch "line", (data) ->
                console.log "data changed", data
                return unless data?
                line.x_scale()
                    .domain d3.extent data[0].values, line.x_value()
                line.y_scale()
                    .domain [0, 200]
                d3.select element[0]
                    .datum data
                    .call line.draw
                d3.select element[0]
                    .select "svg"
                    .select "g"
                    .datum 1
                    .call axes.draw

                g = d3.select element[0]
                    .select "svg"
                    .select "g"
                    .selectAll "g.thresholds"
                    .data [scope.threshold]

                g
                    .enter()
                    .append "g"
                    .classed "thresholds", true

                g.exit().remove()

                thresholds = g
                    .selectAll ".threshold"
                    .data (d) -> d

                thresholds.enter()
                    .append "line"
                    .classed "threshold", true
                    .attr "x1", 0
                    .attr "x2", line.width()
                    .attr "y1", (d) -> line.y_scale()(d)
                    .attr "y2", (d) -> line.y_scale()(d)

                thresholds.exit().remove()
