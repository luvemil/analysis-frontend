angular.module "AnalysisFrontendApp.directives", ["d3"]
    .directive "d3Candlebars", [
        "d3Factory",
        (d3Factory) ->
            restrict: "EA"
            scope: {
                data: "="
            }
            link: (scope, element, attrs) ->

    ]
