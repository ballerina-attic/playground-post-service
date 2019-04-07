import ballerina/http;
import ballerina/log;

// Listener endpoint that a service binds to.
listener http:Listener endpoint = new(9090);

// Annotations decorate code.
// Change the service URL base to '/greeting'.
@http:ServiceConfig {
    basePath:"/greeting"
}
service greeting on endpoint {

  // Decorate the 'greet' resource to accept POST requests.
  @http:ResourceConfig{
    path: "/",
    methods: ["POST"]
  }
  resource function greet(http:Caller caller, http:Request request)
                      returns error? {
    http:Response response = new;

    // If an error is returned from the `getPayloadAsString`
    // method, resource function gets returned with that error
    // which ultimately is sent to the caller.
    string result = check request.getTextPayload();
    response.setPayload("Hello, "+ untaint result +"!\n");
    _ = check caller->respond(response);
    return;
  }
}
