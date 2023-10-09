import ballerina/http;

type Greeting record {
    string 'from;
    string to;
    string message;
};

service / on new http:Listener(8090) {
    resource function post message(@http:Payload json jsonObj) returns Greeting|error {
        string receiver = check jsonObj.receiver.ensureType(string);
        Greeting greetingMessage = {"from" : "Choreo", "to" : receiver, "message" : "Welcome to Choreo!"};
        return greetingMessage;
    }
}
