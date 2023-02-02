*** Settings ***

Documentation      Example HTTPS request for robotmk
...                Make a GET request to google and check the status code

Library            RequestsLibrary

*** Variables ***

${URL}             https://google.com

*** Test Cases ***

Quick GET Request Test
  GET  ${URL}
