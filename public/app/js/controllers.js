'use strict';

var futureMeControllers = angular.module('futureMeControllers', []);

futureMeControllers.controller('industriesCtrl', [
  '$scope', '$http',
  function($scope, $http) {
    $http.get("/industries").success(function(response){
      $scope.industries = response;   
    });
  }]);






