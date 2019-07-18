*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  http://automationpractice.com/
${BROWSER}  gc

*** Keywords ***
Open
    Open Browser  ${URL}  browser=${BROWSER}
    Maximize Browser Window

Choose Menu Dresses
    Click Element  xpath://*[@id="block_top_menu"]/ul/li[2]/a