Feature: Get response of changed password

	Background: 
		* url 'https://woapi-stg.qubeyond.com/api/v3.5'
        # * url 'https://woapi-stg.qubeyond.com/api/v3.5/'
		* header Accept = 'application/json'
        
	#	* request {userName: 'DBAdmin',password: 'DBAdmin1234!'}
	Scenario: Get token
		Given path '/account/password'
        And header Authorization = 'Bearer ' + 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJxdS5jaWQiOiIzNjQiLCJxdS5zaWQiOiI1ZTkxNzc0MGU1NWFiMTAwMDE3OTMwY2YiLCJxdS51aWQiOiI1ZGFmMGU3MDI3ODFmMDA3NDg2MmRhMGQiLCJxdS5uYW1lIjoiREJBZG1pbiIsInF1LnR5cGUiOiJTeXN0ZW0iLCJxdS5hdXRobmFtZSI6InF1IiwibmJmIjoxNTg2NTkxNTUyLCJleHAiOjE1ODY1OTY5NTIsImlzcyI6IlF1LlNlY3VyaXR5LkJlYXJlciIsImF1ZCI6IlF1LlNlY3VyaXR5LkJlYXJlciJ9._2sMEj7jv6UfjeOkhWUgh7jVVm7BTaC0i7WVjmvTsT4'
		When method POST
		Then status 200
	    * print response
        # * def expected = response



        


        
