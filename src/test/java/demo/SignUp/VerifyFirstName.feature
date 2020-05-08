Feature: Verify required fields
Background: 
  * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
  # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
  # * configure driver = { type: 'chromedriver', showDriverLog: true }
  # * configure driver = { type: 'geckodriver', showDriverLog: true }
  # * configure driver = { type: 'safaridriver', showDriverLog: true }
  # * configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }
  # * call read 'SignUpDatas.json'
  # * call read 'SignUpLocators.json'
  * call read ('../Jsonfiles/SignUpDatas.json')
  * call read ('../Jsonfiles/SignUpLocators.json')
@ResponseData
Scenario: try to do SignUp without entering any datas to sign up form
  Given driver 'https://webordering-sp-stg.qubeyond.com/364/signup'
  Then waitForUrl('https://webordering-sp-stg.qubeyond.com/364/signup')
  # And driver.dimensions = { x: 0, y: 0, width: 1600, height: 1200 }
  And delay(20000)
  When click(SignUpscreen.buttons.Create)
  And delay(10000)
  * def Expected = SignUp.Validation.FNameError
  * def Actual = text(SignUpscreen.RequiredFields.FirstName).trim()
  And match Actual == Expected
  And delay(20000)
  
