import ballerina/http;
import ballerina/log;

// Listener endpoint that a service binds to
listener http:Listener ep = new(9090);

// Annotations decorate code.
// Change the service URL base to '/greeting'.
@http:ServiceConfig {
    basePath:"/greeting"
}
service greeting on ep {

  // Decorate the 'greet' resource to accept POST requests
  @http:ResourceConfig{
    path: "/",
    methods: ["POST"]
  }
  resource function greet (http:Caller caller, http:Request request) {
    http:Response response = new;

    // Return result can either be a string or an error.
    var result = request.getPayloadAsString();
    if (result is string) {
      response.setPayload("Hello, "+ untaint result +"!\n");
      var errDetail = caller->respond(response);
      handleError(errDetail);
    } else if (result is error) {
      log:printError(result.reason(), err = result);
    }
  }
}

function handleError(error? result) {
  if (result is error) {
    log:printError(result.reason(), err = result);
  }
}
