require('./user.js')
require('./studio.js')

Parse.Cloud.define("hello", (request) => {
	return ("Hello world!!!");
});


