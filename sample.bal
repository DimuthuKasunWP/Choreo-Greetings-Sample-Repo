import ballerina/http;

type Greeting record {
    string 'from;
    string to;
    string message;
};

service / on new http:Listener(8090) {
    resource function post .(@http:Payload json jsonObj) returns Greeting {
        Greeting greetingMessage = {"from" : "Choreo", "to" : (check jsonObj.to), "message" : "Welcome to Choreo!"};
        return greetingMessage;
    }
}
