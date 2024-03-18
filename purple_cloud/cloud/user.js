const User = Parse.Object.extend("_User");

Parse.Cloud.define("get-user", async (request) => {
    if (request.params.username != null) {
        const query = new Parse.Query(User);
        query.equalTo("username", request.params.username);
        return (await query.first({ useMasterKey: true }));
    }
    else {
        throw new Parse.Error(400, "Missing username or password");
    }
});

Parse.Cloud.define("sign-up", async (request) => {
    if (request.params.username == null) throw new Parse.Error(400, "Missing username");
    if (request.params.password == null) throw new Parse.Error(400, "Missing password");
    const user = new User();
    user.set("username", request.params.username);
    user.set("email", request.params.username);
    user.set("password", request.params.password);
    return (await user.signUp(null, { useMasterKey: true }));
});

Parse.Cloud.define("log-in", async (request) => {
    if (request.params.username == null) throw new Parse.Error(400, "Missing username");
    if (request.params.password == null) throw new Parse.Error(400, "Missing password");
    const user = new User();
    user.set("username", request.params.username);
    user.set("password", request.params.password);
    return (await user.logIn(request.params.username, request.params.password));
});
