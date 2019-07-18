*** Settings ***
#Library  SeleniumLibrary
Resource  ./pages/welcome.robot
Resource  ./pages/catelog.robot

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
    welcome.Open
 

เข้าไปยังหน้า Summer Dress
    welcome.Choose Menu Dresses
    catelog.Choose Summer Dresses

ทำการเลือก Sort ด้วย Price จากมากไปน้อย
    catelog.Sort by price
    
ผลการทำงานต้องแสดงผล จากมากไปน้อย
    catelog.Check Result
		