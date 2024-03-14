const User = Parse.Object.extend("_User");

Parse.Cloud.define("hello", (request) => {
	return ("Hello world!!!");
});

Parse.Cloud.define("list-users", async (request) => {
	const query = new Parse.Query(User);
	return (await query.find({ useMasterKey: true })).map(function (u) {
		u = u.toJSON();
		return {
			username: u.username,
			email: u.email
		};
	});
});

/* Parse Server 2.x
* Parse.Cloud.define("hello", function(request, response){
* 	response.success("Hello world!");
* });
*/

// To see it working, you only need to call it through SDK or REST API.
// Here is how you have to call it via REST API:

/** curl -X POST \
* -H "X-Parse-Application-Id: 6CG5d345xurtrv4RuCflZTXgLCmA03p95ARYKdGt" \
* -H "X-Parse-REST-API-Key: 9Ai5yTF23pKwmBmQO8DQrGQh2RDaKMhITIhOcszh" \
* -H "Content-Type: application/json" \
* -d "{}" \
* https://parseapi.back4app.com/functions/hello
*/

// If you have set a function in another cloud code file, called "test.js" (for example)
// you need to refer it in your main.js, as you can see below:

/* require("./test.js"); */
