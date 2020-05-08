Feature: spa login as guest
Background: 
  * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
  # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
  # * configure driver = { type: 'chromedriver', showDriverLog: true }
  # * configure driver = { type: 'geckodriver', showDriverLog: true }
  # * configure driver = { type: 'safaridriver', showDriverLog: true }
  # * configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }
  #* call read 'LoginLocators.json'
  * call read ('../Jsonfiles/LoginDatas.json')
  * call read ('../Jsonfiles/LoginLocators.json')
@ResponseData
Scenario: try to login to spa
    and then do a location search
  Given driver 'https://webordering-sp-stg.qubeyond.com/364/login'
  And delay(20000)
  #And driver.dimensions = { x: 0, y: 0, width: 1600, height: 1200 }
  When click(loginScreen.buttons.continueAsGuest)
  And delay(10000)
  Then waitForUrl('https://webordering-sp-stg.qubeyond.com/364/search-locations')
  And delay(10000)
  And input(loginScreen.fields.Location,login.Locations.Value)
  And delay(20000)
  When click(locationSearchScreen.fields.selectedItem)
  And delay(20000)
  When click(loginScreen.buttons.search)
  And delay(10000)
  When click(locationSearchScreen.fields.selectedStore)
  And delay(10000)
  Then waitForUrl('https://webordering-sp-stg.qubeyond.com/364/menu-category')
  And delay(10000)
