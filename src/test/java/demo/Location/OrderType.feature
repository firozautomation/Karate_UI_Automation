Feature: Get response and match the response contains Ordertype id

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
		Given url 'https://woapi-stg.qubeyond.com/api/v3.5/order-types'
        And header Authorization = authorizationHeader
		When method GET
		Then status 200
	    * print response
        # * def expected = response

        *  print response[0].title
        *  match response[0].id == 230
        *  print response[2].title
        *  match response[2].id == 234
		





        
