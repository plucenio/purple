const Studio = Parse.Object.extend("Studio");
const User = Parse.Object.extend("_User");

Parse.Cloud.define("get-studio", async (request) => {
    const currentUser = request.user;
    if (currentUser) {
        const query = new Parse.Query(Studio);
        query.equalTo("objectId", request.params.id);
        return (await query.first({ useMasterKey: true }));
    } else {
        throw new Parse.Error(400, "No user logged in");
    }
});
