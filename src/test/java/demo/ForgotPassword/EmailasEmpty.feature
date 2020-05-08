Feature: ForgotPassword page
Background: 
  * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
  # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
  # * configure driver = { type: 'chromedriver', showDriverLog: true }
  # * configure driver = { type: 'geckodriver', showDriverLog: true }
  # * configure driver = { type: 'safaridriver', showDriverLog: true }
  # * configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }
  # * call read 'ForgotPasswordData.json'
  # * call read 'ForgotPasswordLocators.json'
    * call read ('../Jsonfiles/ForgotPasswordData.json')
  * call read ('../Jsonfiles/ForgotPasswordLocators.json')
@ResponseData
Scenario: Click on submit button without entering emailID
  Given driver 'https://webordering-sp-stg.qubeyond.com/364/forgot-password'
  And delay(30000)
  #And def searchField = waitFor(ForgotPasswordScreen.fields.Email)
  # And driver.dimensions = { x: 0, y: 0, width: 1600, height: 1200 }
  #And delay(20000)
  When click(ForgotPasswordScreen.buttons.SUBMIT)
  And delay(20000)
  * def Expected = ForgotPassword.Data5.Username_Error
  * def Actual = text(ForgotPasswordScreen.fields.EmailValidate).trim()
  And match Actual == Expected
  And delay(20000) 
 
