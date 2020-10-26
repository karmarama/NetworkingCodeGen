#Networking Codegen

This repository contains templates for generating Networking compatible code using Swagger CodeGen tool

*petstore.yaml* and the *SwaggerClient* folder of generated code are examples to illustrate the code produced

The *.swagger-codegen-ignore* file excludes some of the default swift 5 generated files that are not needed when using Networking

To run the tool, first install swagger codegen by using `'brew install swagger-codegen'` or by following the instructions at
`https://github.com/swagger-api/swagger-codegen`

Then run command: 

`swagger-codegen generate -i petstore.yaml -t NetworkingTemplate -l swift5 -o .`

