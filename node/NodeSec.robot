*** Settings ***
Library  RoboNodeJSScan
Library  RoboGit
Library  OperatingSystem

*** Variables ***
${GIT_URL}  https://github.com/we45/Cut-The-Funds-NodeJS.git

*** Test Cases ***
Clone the source code from Github
    create directory  code
    clone repository from url  ${GIT_URL}  code/

Run NodeJSScan against my codebase
    create directory  results
    run nodejsscan against source  ${CURDIR}/code  ${CURDIR}/results

Delete code directory
    remove directory  ${CURDIR}/code  recursive=True