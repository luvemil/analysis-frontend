angular.module "AnalysisFrontendApp.directives"
    .directive "favorites", ->
        restrict: "E"
        scope: {
            instruments: "="
            current: "="
        }
        link: (scope, element, attrs) ->
            scope.$watch "instruments", (data) ->
                if not data?
                    return
                item = d3.select element[0]
                    .selectAll "input"
                    .data data
                item
                    .enter()
                    .append "input"
                    .attr "type", "checkbox"
                    .attr "ng-value", (d) -> d.instrument
                    .text (d) -> d.displayName
                    #.property "checked", (d) ->
                        #d.instrument in user.favorites
                item.exit().remove()
