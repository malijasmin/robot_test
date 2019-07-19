*** Setting ***
Library  SeleniumLibrary
Suite setup  เข้า SW
#Suite Teardown  Close Browser
#Test TEARDOWN  Close Browser
#เป็นการเรียกจาก Keyword ไม่ใช่ Testcase

*** Variables ***
#${URL}  https://swe-expert.boi.go.th
${URL}  http://app-vp.webhop.net:8007/SW-WEB/main.php

*** Test Cases ***
ทดสอบ Case Fail
  กรอก Username Password
  0 ทดสอบเพิ่มผู้ติดต่อ Success
  1 CheckNull
  2 Check Mail duplicate
  #3 Check Mail not same


*** Keywords ***
0 ทดสอบเพิ่มผู้ติดต่อ Success
  Click Link     ข้อมูลผู้ติดต่อ
  Click Link     เพิ่มผู้ติดต่อ
  Select From List By Value  id:name_title_ddl  1
  Input Text    id:fname_contact  ศรราม
  Input Text    id:lname_contact  เทพพิทักษ์
  Input Text    id:position_contact    เจ้าหน้าที่บริษัทฝ่ายช่างฝีมือ
  Input Text    id:tel_contact  027880000
  Input Text    id:mobile_contact  027880000
  Input Text    id:fax_contact  027880000
  Input Text    id:mail_contact    sornram@vp.com
  Input Text    id:ver_email_contact    sornram@vp.com
  Click Link    ตกลง
  Capture Page Screenshot
  Wait Until Page Contains  ศรราม เทพพิทักษ์

1 CheckNull
  Click Link     ข้อมูลผู้ติดต่อ
  Click Link     เพิ่มผู้ติดต่อ
  Click Link     ตกลง
  Wait Until Element Contains  id:name_title_ddl-error  โปรดกรอก
  Wait Until Element Contains  id:fname_contact-error  โปรดกรอก
  Wait Until Element Contains  id:lname_contact-error  โปรดกรอก
  Wait Until Element Contains  id:position_contact-error  โปรดกรอก
  Wait Until Element Contains  id:mobile_contact-error  โปรดกรอก
  Wait Until Element Contains  id:fax_contact-error  โปรดกรอก
  Wait Until Element Contains  id:mail_contact-error  โปรดกรอก
  Wait Until Element Contains  id:fname_contact-error  โปรดกรอก
  Wait Until Element Contains  id:ver_email_contact-error  โปรดกรอก
  Capture Page Screenshot
  Click Link     ยกเลิก

2 Check Mail duplicate
  Click Element    xpath://*[@id="dt_ct1"]/tbody/tr[1]/td[4]/img[1]
  ${mail} =	Get Text	id:mail_contact_db
  Click Link     ย้อนกลับ
  Click Link     เพิ่มผู้ติดต่อ
  Select From List By Value  id:name_title_ddl  1
  Input Text    id:fname_contact  ศรราม
  Input Text    id:lname_contact  เทพพิทักษ์
  Input Text    id:position_contact    เจ้าหน้าที่บริษัทฝ่ายช่างฝีมือ
  Input Text    id:tel_contact  027880000
  Input Text    id:mobile_contact  027880000
  Input Text    id:fax_contact  027880000
  Input Text    id:mail_contact    ${mail}
  Input Text    id:ver_email_contact    ${mail}
  Click Link    ตกลง
  Wait Until Element Contains  xpath://*[@id="form_wizard_1"]/div/div[2]/div[2]/div/div[2]  อีเมลผู้ติดต่อ ซ้ำแล้วในระบบ (R50175)
  Capture Page Screenshot
  Click Link     ยกเลิก



กรอก Username Password
  Input Text  name:userlogin  0105551091251
  Input Text  name:passlogin  SSupp0rt@vp
  Click Element  xpath://*[@id="submit_form"]/center/table/tbody/tr/td[3]/div/center/table/tbody/tr[1]/td[2]/a

เข้า SW
    Open Browser  ${URL}  browser=chrome
    Maximize Browser Window
