const User = Parse.Object.extend("_User");

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