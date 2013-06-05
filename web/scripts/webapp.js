// define the module we're working with
    var app = angular.module('xebot-panels', ['xebot-panels-controllers']);
 
    // define the ctrl
    function statCtrl($scope) {
 
        // the last received msg
        $scope.msg = {};
 
        // handles the callback from the received event
        var handleCallback = function (msg) {
            $scope.$apply(function () {
                $scope.msg = JSON.parse(msg.data)
            });
        }
 
        var source = new EventSource('/hubot/panels');
        source.addEventListener('message', handleCallback, false);
    }