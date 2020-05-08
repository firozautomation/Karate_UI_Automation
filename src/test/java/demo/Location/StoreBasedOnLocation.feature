Feature: Get response and match the response contains store id

	Background: 
         Given url 'https://auth-stg.qubeyond.com/api/v3.5/token'
         And request {userName: 'DBAdmin',password: 'DBAdmin1234!'}
		# Given path '/token'
		When method POST
		Then status 200
		* def authToken = response.token
		* print "Access Token: " + authToken
	* def authorizationHeader =  'Bearer ' + authToken

	Scenario: Get token
		Given url 'https://woapi-stg.qubeyond.com/api/v3.5/locations'
		And header Authorization = authorizationHeader
        And params ({ OrderChannelId: 314, OrderTypeId: 233 ,Longitude : -77.4743196, Latitude : 38.98614329999999})
		When method GET
		Then status 200
		#* def newToken = response.token
		* print response
		* print response[1].item.locationId
		* print response[1].item.marketingName
        #* match response contains { marketingName: 'Pugazh store' }
	    # * match response[1].item.marketingName contains  'Richard's Coffee Shack'
		# * match response[1].item.postalCode contains  20878

        * match response[1].item.locationId contains  275
		


        
