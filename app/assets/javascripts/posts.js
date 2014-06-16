
// we are defining a varialbe postApp that will allow us t use angular in the app.
var postApp = angular.module('post-app', ['ngPost', 'mm.foundation']).config(
	['$httpProvider', function($httpProvider) {
	var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
	var defaults = $httpProvider.defaults.headers;
		defaults.common["X-CSRF-TOKEN"] = authToken;
		defaults.patch = defaults.patch || {};
		defaults.patch['Content-Type'] = 'application/json';
		defaults.common['Accept'] = 'application/json';
}]);

resourceApp.factory('Post', ['$post', function($post) {
	return $post('/posts/:id',
		{id: '@id'},
		{update: { method: 'PATCH'}});
}]);