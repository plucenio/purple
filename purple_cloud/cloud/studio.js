const Studio = Parse.Object.extend("Studio");
const User = Parse.Object.extend("_User");

Parse.Cloud.define("get-studio", async (request) => {
    const currentUser = request.user;
    if (currentUser) {
        const queryStudio = new Parse.Query(Studio);
        const studio = currentUser.get("studio");
        if (studio == null) return null;
        return queryStudio.get(studio.toJSON().objectId, { useMasterKey: true });
    } else {
        throw new Parse.Error(400, "No user logged in");
    }
});

Parse.Cloud.define("create-studio", async (request) => {
    const currentUser = request.user;
    if (currentUser) {
        if (request.params.cnpj == null) throw new Parse.Error(400, "Missing cnpj");
        if (request.params.name == null) throw new Parse.Error(400, "Missing name");
        if (request.params.email == null) throw new Parse.Error(400, "Missing email");
        if (request.params.phone == null) throw new Parse.Error(400, "Missing phone");
        const studio = new Studio();
        studio.set("cnpj", request.params.cnpj);
        studio.set("name", request.params.name);
        studio.set("email", request.params.email);
        studio.set("phone", request.params.phone);
        const newStudio = await studio.save(null, { useMasterKey: true });
        return newStudio;
    } else {
        throw new Parse.Error(400, "No user logged in");
    }
});
