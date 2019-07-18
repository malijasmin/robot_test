*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  http://automationpractice.com/
${BROWSER}  gc

*** Test Cases ***
Sorting by price
    เข้า Web หน้าแรก
    เข้าไปยังหน้า Summer Dress
    ทำการเลือก Sort ด้วย Price จากมากไปน้อย
    ผลการทำงานต้องแสดงผล จากมากไปน้อย

*** Keywords ***
เข้า Web หน้าแรก
    Open Browser  ${URL}  browser=${BROWSER}
    Maximize Browser Window
 

เข้าไปยังหน้า Summer Dress
    Click Element  xpath://*[@id="block_top_menu"]/ul/li[2]/a
    Click Element  xpath://*[@id="categories_block_left"]/div/ul/li[3]/a

ทำการเลือก Sort ด้วย Price จากมากไปน้อย
    Click Element  xpath://*[@id="uniform-selectProductSort"]
    Click Element  xpath://*[@id="selectProductSort"]/option[8]
    Click Element  id:selectProductSort
    
ผลการทำงานต้องแสดงผล จากมากไปน้อย
    Wait Until Element Contains  xpath://*[@id="center_column"]/ul/li[1]/div/div[2]/h5/a  Printed Summer Dress
		