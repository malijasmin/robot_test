*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  http://automationpractice.com/
${BROWSER}  gc

*** Keywords ***
Choose Summer Dresses
    Click Element  xpath://*[@id="categories_block_left"]/div/ul/li[3]/a

Sort by price
    Click Element  xpath://*[@id="uniform-selectProductSort"]
    Click Element  xpath://*[@id="selectProductSort"]/option[8]
    Click Element  id:selectProductSort

Check Result
    Wait Until Element Contains  xpath://*[@id="center_column"]/ul/li[1]/div/div[2]/h5/a  Printed Summer Dress