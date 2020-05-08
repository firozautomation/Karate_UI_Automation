Feature: spa Deleted Account verification
Background: 
  * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
  # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
  # * configure driver = { type: 'chromedriver', showDriverLog: true }
  # * configure driver = { type: 'geckodriver', showDriverLog: true }
  # * configure driver = { type: 'safaridriver', showDriverLog: true }
  # * configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }
  # * call read 'DeleteAccountData.json'
  # * call read 'DeleteAccountLocators.json'
  * call read ('../Jsonfiles/DeleteAccountData.json')
  * call read ('../Jsonfiles/DeleteAccountLocators.json')
  
@ResponseData
Scenario: try to login to spa with delted account credentials

  Given driver 'https://webordering-sp-stg.qubeyond.com/364/login'
  #And def editbox=waitFor(loginScreen.fields.Email)
   #And driver.dimensions = { x: 0, y: 0, width: 1600, height: 1200 }
  And delay(10000)
  And input(DeleteAccount.fields.Email,Account.Data.Username)
  And input(DeleteAccount.fields.password,Account.Data.Password)
  When click(DeleteAccount.buttons.login)
  And delay(10000)
  * print text(ErrorMessage.Errors.PopUpMessage)  

  
  
  

