Feature: Get response and match the response 

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
		Given url 'https://woapi-stg.qubeyond.com/api/v3.5/account'
		And header Authorization = authorizationHeader
		When method DELETE
		Then status 200
	    * print response



        


        
