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