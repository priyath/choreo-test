import ballerinax/covid19;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        covid19:Client covid19Endpoint = check new ({});
        covid19:CovidCountry[] getAllCountriesStatusResponse = check covid19Endpoint->getAllCountriesStatus();
        return getAllCountriesStatusResponse.toJsonString();
    }
}
