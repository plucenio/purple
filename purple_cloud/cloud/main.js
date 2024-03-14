require('./user.js')

Parse.Cloud.define("hello", (request) => {
	return ("Hello world!!!");
});


