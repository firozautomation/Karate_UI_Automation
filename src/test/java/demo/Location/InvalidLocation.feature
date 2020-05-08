Feature: Invalid Location search page
Background: 
  * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
  # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
  # * configure driver = { type: 'chromedriver', showDriverLog: true }
  # * configure driver = { type: 'geckodriver', showDriverLog: true }
  # * configure driver = { type: 'safaridriver', showDriverLog: true }
  # * configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }
  # * call read 'LocationLocators.json'
  # * call read 'LocationDatas.json'
    * call read ('../Jsonfiles/LocationDatas.json')
  * call read ('../Jsonfiles/LocationLocators.json')
@ResponseData
Scenario: try to login to spa and search for city in location page
  Given driver 'https://webordering-sp-stg.qubeyond.com/364/login'
  And delay(20000)
  #And driver.dimensions = { x: 0, y: 0, width: 1600, height: 1200 }
  When click(LocationScreen.buttons.continueAsGuest)
  And delay(10000)
  Then waitForUrl('https://webordering-sp-stg.qubeyond.com/364/search-locations')
  And delay(10000)
  And input(LocationScreen.Editbox.StreetAddress,Locations.Address.Invalid)
  And delay(20000)
  When click(LocationScreen.fields.selectedItem)
  And delay(20000)
  When click(LocationScreen.buttons.search)
  And delay(10000)
  And match text(LocationScreen.fields.Nostore) == Locations.Address.NoStore
  And delay(10000)
