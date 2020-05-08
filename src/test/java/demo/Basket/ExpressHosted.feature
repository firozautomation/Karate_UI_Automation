Feature: Merge
Background: 
  * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
  # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
  # * configure driver = { type: 'chromedriver', showDriverLog: true }
  # * configure driver = { type: 'geckodriver', showDriverLog: true }
  # * configure driver = { type: 'safaridriver', showDriverLog: true }
  # * configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }
  # * call read 'BasketLocators.json'
  * call read ('../Jsonfiles/BasketDatas.json')
  * call read ('../Jsonfiles/BasketLocators.json')
  
@ResponseData
Scenario: Proceed as Guest
  Given driver 'https://webordering-sp-stg.qubeyond.com/364/login'
  #'https://webordering-sp-stg.qubeyond.com/364/login'

  # And driver.dimensions = { x: 0, y: 0, width: 1600, height: 1200 } 
  And waitForUrl('https://webordering-sp-stg.qubeyond.com/364/login')
  

  When click(loginScreen.buttons.continueAsGuest)
  # And delay(10000)
  Then waitForUrl('https://webordering-sp-stg.qubeyond.com/364/search-locations')
  And delay(3000)
  And input(loginScreen.fields.Locationedit, Basket.Address.location)
  And delay(20000)
  When click(locationSearchScreen.fields.selectedItem)
  And delay(10000)
  When click(loginScreen.buttons.search)
  And delay(8000)
  When click(locationSearchScreen.fields.selectedStore)
  And delay(5000)
  Then waitForUrl('https://webordering-sp-stg.qubeyond.com/364/menu-category')
  And delay(3000)
  #Click on Beverage
  When click(Menu.Beverage)
  # And delay(3000)
  #click on bottled water
  Then click(Menu.Bottle)
  And delay(2000)
  # And click("//button[@id='addButton']")
  And click(Menu.AddToBag)
  # And waitForUrl('https://webordering-sp-stg.qubeyond.com/364/menu-category')
  And delay(5000)
  #Basket ICON
  And click(Menu.BasketIcon)
 # Then click("//*[@id='myorder']/span")
  And delay(3000)
  And screenshot()
  #checkout button
  When click(Menu.CheckoutBtn)
 And delay(10000)
 Given select("//select[@name='dateTime'][2]", '10:30 AM')
#  * scroll(Menu.MakePaymentBtn)

#APIs 
  Given url 'https://auth-stg.qubeyond.com/api/v3.5/token'
  And request {userName: 'DBAdmin',password: 'DBAdmin1234!'}
		# Given path '/token'
		When method POST
		Then status 200
		* def authToken = response.token
		* print "Access Token: " + authToken
	* def authorizationHeader =  'Bearer ' + authToken

Given url 'https://woapi-stg.qubeyond.com/api/v3.5/order-channels'
# And path '/order-channels'
And header Authorization = authorizationHeader
When method GET
Then status 200
# * print "Found orderchannel: " 
Given url 'https://woapi-stg.qubeyond.com/api/v3.5/order-types'
And header Authorization = authorizationHeader
When method GET
Then status 200
# * print "Found orderType: " 

#OrderDate Time
* def orderDateTimeFn =
    """
    function() {
        var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
        var JavaDate = Java.type('java.util.Date');
        var TimeZone = Java.type('java.util.TimeZone');
        var sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
        sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
        return sdf.format(new JavaDate());
		// return temp.toString();
    } 
    """
* def orderDateTime = call orderDateTimeFn {}
* print "OrderDateTime: " + orderDateTime
# * print "OrderDateTime: " + <orderDateTime>

# Create Basket
Given url 'https://woapi-stg.qubeyond.com/api/v3.5/basket'
And header Authorization = authorizationHeader
And request {"orderChannelId": 314, "orderTypeId": 234, "locationId": 260, "orderDateTime": #(orderDateTime)}
When method POST
Then status 200
  
# Add item to basket
Given url 'https://woapi-stg.qubeyond.com/api/v3.5/basket/items'
And header Authorization = authorizationHeader
And request {"IsFavorite":false,"menuItemPath":"9869-12062-12063","FavoriteTag":"","note":"","quantity":1,"basketItems":[],"portionId":186}
When method POST
Then status 200
And def basketResponse = response
And print 'BasketResponse:' +basketResponse
		
# Get Basket
Given url 'https://woapi-stg.qubeyond.com/api/v3.5/basket'
And header Authorization = authorizationHeader
And param orderChannelId = '314'
And param orderTypeId = '234'
And param locationId = '260'
When method GET
Then status 200
* print "STARTS"
* print "Amount Due: "+response.amountDue
* print "Tips Total: "+response.tipsTotal
* print "Tax: " +response.taxesTotal
* def baseAmount = (1 * response.amountDue) - (1 * response.taxesTotal)
* print "Base amount: "+baseAmount

# * def APIact =  response.amountDue
#   And match APIact == UI
#   And delay(20000) 


 # Review Order Page
 #subtotal
  # * def Expected = '$10.00'
  * def expSubTot = +baseAmount
  * def actSubTot = text(OrderPage.SubTotal).trim()
  * def ST = actSubTot.replaceAll("\\$","")
  * def subTot = ST | 0
  * print subTot
  And match subTot == expSubTot
  And delay(20000) 
#Tax
  # * def Expected = '$0.50'
  * def expTax = +response.taxesTotal
  * def actTax = text(OrderPage.Tax).trim()
  * def TX = actTax.replaceAll("\\$","")
  * def tax = parseFloat(TX)
  * print tax
  And match tax == expTax
  And delay(20000) 
#Order total
  # * def Expected = '$10.50'
  * def expOrderTot = +response.amountDue
  * def actOT = text(OrderPage.OrderTotal).trim()
  * def OT = actOT.replaceAll("\\$","")
  * def OrdTot = parseFloat(OT)
  * print OrdTot
  And match OrdTot == expOrderTot
  And delay(10000) 

#click on make payment button
 When click(Menu.MakePaymentBtn)
 And delay(10000)

#  #Handle Pop up
#   * print text("//div[@class='alert-description-container']/p")
#   And delay(10000)
#   When click("//button[text()='close']")
Then waitForUrl('https://webordering-sp-stg.qubeyond.com/364/make-payment-screen')

#Offline credit radiobutton
* click("//app-make-payment-screen/div/div/div[2]/div[1]/ion-grid/div[2]/ion-row/ion-col[2]/fieldset/div/label/div/div/span[2]")
And delay(10000)
* click("//app-make-payment-screen/div/div/div[2]/div[1]/ion-grid/div[2]/ion-row[2]/ion-col/ion-row/ion-col/div/fieldset/div/label/div[1]/div/span[2]")
And delay(20000)
And switchFrame('#iframeURLID')
When input(ExpressHosted.cardnumer, Basket.ExpressHosted.CardNumber)
Given select("//select[@class='selectOption'][1]", '12')
Given select("//select[@class='selectOption'][2]", '30')
When input(ExpressHosted.CVVnumber, Basket.ExpressHosted.CVVNumber)
* click(ExpressHosted.processTrans)
And switchFrame(null)
* delay(10000)
* scroll(Menu.PayNowBtn)
And input(Menu.FnameEdit,Basket.Address.Fname)
And input(Menu.LnameEdit, Basket.Address.Lname)
And input(Menu.MobNum, Basket.Address.Mob)
And input(Menu.Email, Basket.Address.Email)
And delay(10000)
And click(Menu.PayNowBtn)
And delay(20000)
Then waitForUrl('https://webordering-sp-dev.qubeyond.com/362/order-confirmation')
And delay(20000)

