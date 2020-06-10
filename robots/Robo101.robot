*** Settings ***
Library  OperatingSystem
Library  Screenshot
Library  Collections
Library  DateTime


*** Test Cases ***

Creating a Simple File and Appending to it
    create file  test.txt
    append to file  test.txt  hello world. This is my first attempt at test automation

Take a screenshot of my screen
    take screenshot  name=hello.jpg  width=800px

File grep
    grep file  test.txt  hello