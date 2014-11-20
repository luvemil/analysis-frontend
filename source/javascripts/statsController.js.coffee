angular.module "AnalysisFrontendApp.controllers", []
    .controller "statsController", [
        "$scope"
        ($scope) ->
            $scope.rawdata = {
                "instrument" : "EUR_USD",
                "granularity" : "M5",
                "candles" : [
                    {
                        "time" : "2014-11-19T07:20:00.000000Z",
                        "openMid" : 1.24074,
                        "highMid" : 1.24077,
                        "lowMid" : 1.240525,
                        "closeMid" : 1.240645,
                        "volume" : 104,
                        "complete" : true
                    },
                    {
                        "time" : "2014-11-19T07:25:00.000000Z",
                        "openMid" : 1.24065,
                        "highMid" : 1.240725,
                        "lowMid" : 1.240545,
                        "closeMid" : 1.24059,
                        "volume" : 65,
                        "complete" : true
                    },
                    {
                        "time" : "2014-11-19T07:30:00.000000Z",
                        "openMid" : 1.240605,
                        "highMid" : 1.24061,
                        "lowMid" : 1.240515,
                        "closeMid" : 1.24061,
                        "volume" : 55,
                        "complete" : true
                    },
                    {
                        "time" : "2014-11-19T07:35:00.000000Z",
                        "openMid" : 1.24061,
                        "highMid" : 1.24061,
                        "lowMid" : 1.240395,
                        "closeMid" : 1.240435,
                        "volume" : 54,
                        "complete" : true
                    },
                    {
                        "time" : "2014-11-19T07:40:00.000000Z",
                        "openMid" : 1.240445,
                        "highMid" : 1.240585,
                        "lowMid" : 1.240415,
                        "closeMid" : 1.240415,
                        "volume" : 86,
                        "complete" : true
                    },
                    {
                        "time" : "2014-11-19T07:45:00.000000Z",
                        "openMid" : 1.240415,
                        "highMid" : 1.240465,
                        "lowMid" : 1.240235,
                        "closeMid" : 1.24032,
                        "volume" : 108,
                        "complete" : true
                    },
                    {
                        "time" : "2014-11-19T07:50:00.000000Z",
                        "openMid" : 1.240315,
                        "highMid" : 1.240325,
                        "lowMid" : 1.240145,
                        "closeMid" : 1.240145,
                        "volume" : 104,
                        "complete" : true
                    },
                    {
                        "time" : "2014-11-19T07:55:00.000000Z",
                        "openMid" : 1.24015,
                        "highMid" : 1.240415,
                        "lowMid" : 1.24015,
                        "closeMid" : 1.240355,
                        "volume" : 137,
                        "complete" : true
                    },
                    {
                        "time" : "2014-11-19T08:00:00.000000Z",
                        "openMid" : 1.240355,
                        "highMid" : 1.240435,
                        "lowMid" : 1.24029,
                        "closeMid" : 1.24038,
                        "volume" : 96,
                        "complete" : true
                    },
                    {
                        "time" : "2014-11-19T08:05:00.000000Z",
                        "openMid" : 1.24038,
                        "highMid" : 1.24038,
                        "lowMid" : 1.24022,
                        "closeMid" : 1.2403,
                        "volume" : 118,
                        "complete" : true
                    },
                    {
                        "time" : "2014-11-19T08:10:00.000000Z",
                        "openMid" : 1.24031,
                        "highMid" : 1.240415,
                        "lowMid" : 1.24026,
                        "closeMid" : 1.24034,
                        "volume" : 63,
                        "complete" : true
                    },
                    {
                        "time" : "2014-11-19T08:15:00.000000Z",
                        "openMid" : 1.24033,
                        "highMid" : 1.240345,
                        "lowMid" : 1.240305,
                        "closeMid" : 1.240315,
                        "volume" : 20,
                        "complete" : true
                    },
                    {
                        "time" : "2014-11-19T08:20:00.000000Z",
                        "openMid" : 1.24032,
                        "highMid" : 1.24081,
                        "lowMid" : 1.24032,
                        "closeMid" : 1.240715,
                        "volume" : 102,
                        "complete" : true
                    },
                    {
                        "time" : "2014-11-19T08:25:00.000000Z",
                        "openMid" : 1.24072,
                        "highMid" : 1.24126,
                        "lowMid" : 1.24065,
                        "closeMid" : 1.24125,
                        "volume" : 88,
                        "complete" : true
                    },
                    {
                        "time" : "2014-11-19T08:30:00.000000Z",
                        "openMid" : 1.241245,
                        "highMid" : 1.2413,
                        "lowMid" : 1.24116,
                        "closeMid" : 1.241225,
                        "volume" : 51,
                        "complete" : true
                    },
                    {
                        "time" : "2014-11-19T08:35:00.000000Z",
                        "openMid" : 1.241225,
                        "highMid" : 1.241235,
                        "lowMid" : 1.241145,
                        "closeMid" : 1.2412,
                        "volume" : 79,
                        "complete" : true
                    },
                    {
                        "time" : "2014-11-19T08:40:00.000000Z",
                        "openMid" : 1.241195,
                        "highMid" : 1.241195,
                        "lowMid" : 1.24104,
                        "closeMid" : 1.24114,
                        "volume" : 35,
                        "complete" : true
                    },
                    {
                        "time" : "2014-11-19T08:45:00.000000Z",
                        "openMid" : 1.24114,
                        "highMid" : 1.24122,
                        "lowMid" : 1.24104,
                        "closeMid" : 1.24121,
                        "volume" : 64,
                        "complete" : true
                    },
                    {
                        "time" : "2014-11-19T08:50:00.000000Z",
                        "openMid" : 1.241205,
                        "highMid" : 1.24124,
                        "lowMid" : 1.24114,
                        "closeMid" : 1.24122,
                        "volume" : 45,
                        "complete" : true
                    },
                    {
                        "time" : "2014-11-19T08:55:00.000000Z",
                        "openMid" : 1.241245,
                        "highMid" : 1.241305,
                        "lowMid" : 1.241055,
                        "closeMid" : 1.241055,
                        "volume" : 66,
                        "complete" : false
                    }
                ]
            }

            $scope.rawdata.stats = [
                { 
                    "name": "ema5"
                    "values": [
                        {
                            "time": "2014-11-19T07:40:00.000000Z",
                            "value": 1.240539
                        },
                        {
                            "time": "2014-11-19T07:45:00.000000Z",
                            "value": 1.240466
                        },
                        {
                            "time": "2014-11-19T07:50:00.000000Z",
                            "value": 1.240359
                        },
                        {
                            "time": "2014-11-19T07:55:00.000000Z",
                            "value": 1.24035766666667
                        },
                        {
                            "time": "2014-11-19T08:00:00.000000Z",
                            "value": 1.24036511111111
                        },
                        {
                            "time": "2014-11-19T08:05:00.000000Z",
                            "value": 1.24034340740741
                        },
                        {
                            "time": "2014-11-19T08:10:00.000000Z",
                            "value": 1.24034227160494
                        },
                        {
                            "time": "2014-11-19T08:15:00.000000Z",
                            "value": 1.24033318106996
                        },
                        {
                            "time": "2014-11-19T08:20:00.000000Z",
                            "value": 1.24046045404664
                        },
                        {
                            "time": "2014-11-19T08:25:00.000000Z",
                            "value": 1.24072363603109
                        },
                        {
                            "time": "2014-11-19T08:30:00.000000Z",
                            "value": 1.24089075735406
                        },
                        {
                            "time": "2014-11-19T08:35:00.000000Z",
                            "value": 1.24099383823604
                        },
                        {
                            "time": "2014-11-19T08:40:00.000000Z",
                            "value": 1.24104255882403
                        },
                        {
                            "time": "2014-11-19T08:45:00.000000Z",
                            "value": 1.24109837254935
                        },
                        {
                            "time": "2014-11-19T08:50:00.000000Z",
                            "value": 1.2411389150329
                        },
                        {
                            "time": "2014-11-19T08:55:00.000000Z",
                            "value": 1.24110261002193
                        }
                    ]
                }
            ]
    ]
