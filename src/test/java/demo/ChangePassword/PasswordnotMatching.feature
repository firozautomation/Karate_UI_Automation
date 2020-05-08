Feature: spa Changepassword validation
Background: 
  * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
  # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
  # * configure driver = { type: 'chromedriver', showDriverLog: true }
  # * configure driver = { type: 'geckodriver', showDriverLog: true }
  # * configure driver = { type: 'safaridriver', showDriverLog: true }
  # * configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }
  # * call read 'ChngPasswordLocators.json'
  # * call read 'ChngPasswordData.json'
    * call read ('../Jsonfiles/ChngPasswordData.json')
  * call read ('../Jsonfiles/ChngPasswordLocators.json')
@ResponseData
Scenario: In change password page enter old password as valid and New as valid and confirm password as invalid

  Given driver 'https://webordering-sp-stg.qubeyond.com/364/login'
  # 'https://webordering-sp-stg.qubeyond.com/364/login'
  And delay(20000)
  #And driver.dimensions = { x: 0, y: 0, width: 1600, height: 1200 }
  And input(loginScreen.fields.Email,login.Data.Username)
  And input(loginScreen.fields.password,login.Data.Password)
  When click(loginScreen.buttons.login)
  And delay(10000)
  Then waitForUrl('https://webordering-sp-stg.qubeyond.com/364/search-locations')
  And delay(10000)
  And input(loginScreen.fields.Location,login.Data.location)
  And delay(20000)
  When click(locationSearchScreen.fields.selectedItem)
  And delay(20000)
  When click(loginScreen.buttons.search)
  And delay(10000)
  When click(locationSearchScreen.fields.selectedStore)
  And delay(10000)
  Then waitForUrl('https://webordering-sp-stg.qubeyond.com/364/menu-category')
  And delay(20000)
  When click(Changepswrd.Profile.profileIcon)
  And delay(20000)
  Then waitForUrl('https://webordering-sp-stg.qubeyond.com/364/dashboard')
  And delay(20000)
  When click(Changepswrd.Profile.PreferenceTab)
  And delay(10000)
  When click(Changepswrd.Profile.Change_Password)
  And delay(20000)
  And input(ChangepswrdForm.Password.CurrentPassword,PasswordFormData.FormData.Currentpassword)
  And input(ChangepswrdForm.Password.NewPassword,PasswordFormData.FormData.Newpassword)
  And input(ChangepswrdForm.Password.ConfirmPassword,PasswordFormData.FormData.Confirmpassword)
  When click(ChangepswrdForm.Password.SAVEButton)
  And delay(20000)
  * def Expected = Validations.Messages.PasswordNotmathing
  * def Actual = text(ChangepswrdForm.ErrorMessages.Validations.confirmpassword).trim()
  And match Actual == Expected
  And delay(20000)

