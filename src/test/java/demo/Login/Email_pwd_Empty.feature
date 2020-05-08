Feature: spa login
Background: 
  * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
  # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
  # * configure driver = { type: 'chromedriver', showDriverLog: true }
  # * configure driver = { type: 'geckodriver', showDriverLog: true }
  # * configure driver = { type: 'safaridriver', showDriverLog: true }
  # * configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }
  # * call read 'LoginDatas.json'
  # * call read 'LoginLocators.json'
  * call read ('../Jsonfiles/LoginDatas.json')
  * call read ('../Jsonfiles/LoginLocators.json')
@ResponseData
Scenario: try to login to spa with Email and password as empty
  Given driver 'https://webordering-sp-stg.qubeyond.com/364/login'
  #* waitUntil("document.readyState == 'complete'")
 # * waitForText('//span[@id='forgotPassword']', ' Forgot Your Password? ')
    
  #Then waitForUrl('https://webordering-sp-stg.qubeyond.com/364/login')
  #And def editbox=waitFor(loginScreen.fields.Email)
  # And driver.dimensions = { x: 0, y: 0, width: 1600, height: 1200 }
  And delay(20000)
  And input(loginScreen.fields.Email,login.Data1.Username)
  And input(loginScreen.fields.password,login.Data1.Password)
  When click(loginScreen.buttons.login)
  
  And delay(10000)
  * def Expected = login.Data7.Username_Error
  * def Actual = text(ErrorMessage.Errors.EmailValidate).trim()
  And match Actual == Expected
  And delay(20000)
  * def Expected = login.Data7.Password_Error
  * def Actual = text(ErrorMessage.Errors.PasswordValidate).trim()
  And match Actual == Expected
  And delay(20000)


 
