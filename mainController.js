'use strict';

var em1060 = angular.module('em1060', ['ngRoute', 'ngMaterial', 'ngResource', 'ngCookies']);

/* Enable linking to specific photo on page, like: #/photos/user_id?scrollTo=photo_id
* thanks to http://stackoverflow.com/questions/14712223/how-to-handle-anchor-hash-linking-in-angularjs
 em1060.run(function($rootScope, $location, $anchorScroll, $timeout) {
     //when the route is changed scroll to the proper element.
     $rootScope.$on('$routeChangeSuccess', function(newRoute, oldRoute) {
         $timeout(function(){
             if($location.hash()){
                 $anchorScroll();
             }
         }, 500);
     });
 });*/



/**********
 * Routes *
 **********/

em1060.config(['$routeProvider', '$locationProvider',
    function ($routeProvider, $locationProvider) {
        $routeProvider.
            when('/preface', {
                templateUrl: 'components/static/preface.html'
            }).

            otherwise({
                redirectTo: '/preface'
            });
    }
]);


/*******************
 * Main controller *
 *******************/

em1060.controller('MainController', ['$scope', '$rootScope', '$location', '$mdDialog', '$cookies',
    function ($scope,$rootScope, $location,$mdDialog, $cookies) {
        $scope.main = {};
        $scope.main.title = 'Home';

    }]);
