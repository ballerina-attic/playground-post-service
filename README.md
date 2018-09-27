[![Build Status](https://travis-ci.org/ballerina-guides/playground-post-service.svg?branch=master)](https://travis-ci.org/ballerina-guides/playground-post-service)

# Ballerina Playground - HTTP POST Service

## <a name="what-you-build"></a> What you’ll build 

In this example you will build a HTTP RESTful service that accepts a HTTP post request and reply back with a 
greeting message which includes the content you posted. 

**This is a Ballerina playground example. You can try it at  [ballerina.io](https://ballerina.io).**
 
## <a name="pre-req"></a> Prerequisites
- [Ballerina Distribution](https://github.com/ballerina-lang/ballerina/blob/master/docs/quick-tour.md)
- A Text Editor or an IDE 

## <a name="developing-service"></a> Developing the service 

**This is a Ballerina playground example. You can try it at  [ballerina.io](https://ballerina.io).**
 
### <a name="invoking"></a> Invoking the RESTful service  
 
Sample Request 
```
curl -X POST -d 'Ballerina' http://localhost:9090/greeting
```
