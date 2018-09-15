import ballerina/http;
import ballerina/io;

// Listener endpoint that a service binds to
endpoint http:Listener listener {
  port:9090
};

// Annotations decorate code.
// Change the service URL base to '/greeting'.
@http:ServiceConfig {
    basePath:"/greeting"
}
service<http:Service> greeting bind listener {

  // Decorate the 'greet' resource to accept POST requests
  @http:ResourceConfig{
    path: "/",
    methods: ["POST"]
  }
  greet (endpoint caller, http:Request request) {
    http:Response response = new;

    // 'check' operator matches the output type of the function.
    // If the return is not a 'string', then it throws an error.
    string reqPayload = check request.getPayloadAsString();
    response.setTextPayload("Hello, "+ untaint reqPayload +"!\n");
    _ = caller -> respond(response);
  }
}
