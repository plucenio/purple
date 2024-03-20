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
    if (request.params.name == null) throw new Parse.Error(400, "Missing name");
    if (request.params.email == null) throw new Parse.Error(400, "Missing email");
    if (request.params.username == null) throw new Parse.Error(400, "Missing username");
    if (request.params.password == null) throw new Parse.Error(400, "Missing password");
    if (request.params.confirmedPassword == null) throw new Parse.Error(400, "Missing password");
    if (request.params.phone == null) throw new Parse.Error(400, "Missing phone");
    if (request.params.password != request.params.confirmedPassword) throw new Parse.Error(400, "Passwords don't match");
    const user = new User();
    user.set("name", request.params.name);
    user.set("username", request.params.username);
    user.set("email", request.params.username);
    user.set("password", request.params.password);
    user.set("phone", request.params.phone);
    await user.signUp(null, { useMasterKey: true });
    return true;
});

Parse.Cloud.define("log-in", async (request) => {
    if (request.params.username == null) throw new Parse.Error(400, "Missing username");
    if (request.params.password == null) throw new Parse.Error(400, "Missing password");
    const user = new User();
    user.set("username", request.params.username);
    user.set("password", request.params.password);
    return (await user.logIn(request.params.username, request.params.password));
});

Parse.Cloud.define("log-out", async (request) => {
    const currentUser = request.user;
    if (currentUser) {
        await Parse.User.logOut();
        console.log('User logged out');
    } else {
        throw new Parse.Error(400, "No user logged in");
    }
});
