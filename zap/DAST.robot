*** Settings ***
Library  RoboZap  http://127.0.0.1:8090  8090
Library  REST  http://localhost:5050  proxies={"http": "http://127.0.0.1:8090", "https": "http://127.0.0.1:8090"}

*** Test Cases ***
Start Zap on my machine
    start gui zap  /Applications/ZAP_29.app/Contents/Java/

Open Target URL
    zap open url  http://localhost:5050

Set Context for Application
    ${context_id}=  zap define context  vul-flask  http://localhost:5050
    set suite variable  ${CONTEXT}  ${context_id}

# Spider target app
#     ${spider_id}=  zap start spider  vul-flask  http://localhost:5050
#     zap spider status  ${spider_id}

Authenticate to Web Service ZAP
    &{res}=  POST  /login  {"username": "admin", "password": "admin123"}
    Integer  response status  200
    set suite variable  ${TOKEN}  ${res.headers["Authorization"]}

Get Customer by ID
    [Setup]  Set Headers  { "Authorization": "${TOKEN}" }
    GET  /get/2
    Integer  response status  200

Post Fetch Customer
    [Setup]  Set Headers  { "Authorization": "${TOKEN}" }
    POST  /fetch/customer  { "id": 3 }
    Integer  response status  200

Search Customer by Username
    [Setup]  Set Headers  { "Authorization": "${TOKEN}" }
    POST  /search  { "search": "dleon" }
    Integer  response status  200


Active Scan Application
    ${scan_id}=  zap start ascan  ${CONTEXT}  http://localhost:5050
    zap scan status  ${scan_id}

ZAP Generate Report
    zap export report  ${CURDIR}/report.json  json  Test Report  Abhay Bhargav

ZAP Close
    zap shutdown