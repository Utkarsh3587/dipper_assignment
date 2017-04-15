# Dipper-Asignment

## Problem Statement  

Implement a server which should be capable of doing the following:

   - Exposes a GET API as "api/request?connId=19&timeout=80" 

 This API will keep the request running for provided time on the server side. After 

the successful completion of the provided time it should return {"status":"ok"}

   - Exposes a GET API as "api/serverStatus" 

 This API returns all the running requests on the server with their time left for 

completion. E.g {"2":"15","8":"10"} where 2 and 8 are the connIds and 15 and 10 

is the time remaining for the requests to complete (in seconds).

   - Exposes a PUT API as "api/kill" with payload as {"connId":12} 

This API will finish the running request with provided connId, so that the finished 

request returns {"status":"killed"} and the current request will return 

{"status":"ok"}. If no running request found with the provided connId on the server 

then the current request should return "status":"invalid connection Id : <connId>"}

## Rails Version
5.0.2. 

## Ruby Version
2.3.1  

## Setup and Run
Follow the below steps: 
 
##Setup dipper-assigment

1. Clone the repository by running the following command:     
  
         https://github.com/Utkarsh3587/dipper_assignment.git

2. Go to project directory:
         
         cd dipper_assignment

3. Install all required gems:
         
         bundle

5. Launh rails server by :
         
         rails s

6. Start generating req 

###Example

1. [http://localhost:3000/api/request?connId=19&tiomeout=60][localhost1] to create a new request.

2. [http://localhost:3000/api/serverStatus][localhost2] to show the server status

3. **http://localhost:3000/api/kil** with payload as {"connId":"19"} to kill the ongoing request with id 19.

[localhost1]:http://localhost:3000/api/request?connId=19&tiomeout=60
[localhost2]:http://localhost:3000/api/serverStatus
