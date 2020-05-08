Feature: spa login
Background: 
  * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
  # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
  # * configure driver = { type: 'chromedriver', showDriverLog: true }
  # * configure driver = { type: 'geckodriver', showDriverLog: true }
  # * configure driver = { type: 'safaridriver', showDriverLog: true }
  # * configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }
  #* call read 'LoginDatas.json'
  #* call read 'LoginLocators.json'
  * call read ('../Jsonfiles/LoginDatas.json')
  * call read ('../Jsonfiles/LoginLocators.json')

@ResponseData
Scenario: try to login to spa with Invalid EmailId and Valid Password
  Given driver 'https://webordering-sp-stg.qubeyond.com/364/login'
  # 'https://webordering-sp-dev.qubeyond.com/362/login'
  
  And delay(20000)
  #Then waitForurl('https://webordering-sp-stg.qubeyond.com/364/login')
  #'https://webordering-sp-stg.qubeyond.com/364/login'

  #And driver.dimensions = { x: 0, y: 0, width: 1600, height: 1200 }

  And input(loginScreen.fields.Email,login.Data4.Username)
  And input(loginScreen.fields.password,login.Data4.Password)
  When click(loginScreen.buttons.login)
  And delay(10000)
  * print text(ErrorMessage.Errors.popup_invalidUser)
  And screenshot()
  And delay(10000)
  When click(loginScreen.buttons.popup_close)
  And delay(10000)

 
  
  
  

