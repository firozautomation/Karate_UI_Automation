Feature: Get response from Basket_validation_API and validate

	Background: 
		* url 'https://woapi-stg.qubeyond.com/api/v3.5'
        # * url 'https://woapi-stg.qubeyond.com/api/v3.5/'
		* header Accept = 'application/json'
    	* request {userName: 'satish@mailinator.com',password: 'Satish@1234'}
		
	Scenario: Get token
		Given path '/basket/validations/items'
        And header Authorization = 'Bearer ' + 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJxdS5jaWQiOiIzNjQiLCJxdS50eXBlIjoiSHVtYW4iLCJhdXRoLm5hbWUiOiJxdSIsInF1LnNpZCI6IjVlOWRjNTBkY2Q4MzRhMDAwMWYyZTgwNCIsInF1LnVpZCI6IjVlOTlhOTdhNGI1NzBjMDAwMTk5MTMyYSIsInF1Lm5hbWUiOiJzYXRpc2hAbWFpbGluYXRvci5jb20iLCJuYmYiOjE1ODczOTc5MDEsImV4cCI6MTU4NzM5OTEwMSwiaXNzIjoiUXUuU2VjdXJpdHkuQmVhcmVyIiwiYXVkIjoiUXUuU2VjdXJpdHkuQmVhcmVyIn0.p_M4D-VONhJJpPo-GtON1GXllKj0qQfCOc_SbeYgnnI'
        #And params ({"orderChannelId":314,"orderTypeId":234,"locationId":262,"orderDateTime":"2020-04-20T12:16:00-04:00","basketItems":[{"basketItemId":"b90af658-4ba5-41c8-ab4b-f14cfd0d0c41","basketItems":{"9869-10337-10437-10438":{"title":"Size","description":"Size","price":0,"basePrice":0,"defaultState":0,"menuItemPath":"9869-10337-10437-10438","quantity":1},"9869-10337-10437-10438-9901":{"title":"Small","description":"Small","price":0,"basePrice":0,"defaultState":1,"menuItemPath":"9869-10337-10437-10438-9901","quantity":1,"note":""}},"menuItemType":1,"title":"coffee","description":"coffee","price":5,"basePrice":5,"defaultState":0,"menuItemPath":"9869-10337-10437","quantity":1,"note":"","UIModifiers":[{"title":"Small","description":"Small","price":0,"basePrice":0,"defaultState":1,"menuItemPath":"9869-10337-10437-10438-9901","quantity":1,"note":""}]},{"basketItemId":"a481d1fa-05cd-46ae-8457-2cb1808368b9","basketItems":{"9869-10337-10437-10438":{"title":"Size","description":"Size","price":0,"basePrice":0,"defaultState":0,"menuItemPath":"9869-10337-10437-10438","quantity":1},"9869-10337-10437-10438-9901":{"title":"Small","description":"Small","price":0,"basePrice":0,"defaultState":1,"menuItemPath":"9869-10337-10437-10438-9901","quantity":1,"note":""}},"menuItemType":1,"title":"coffee","description":"coffee","price":5,"basePrice":5,"defaultState":0,"menuItemPath":"9869-10337-10437","quantity":1,"note":"","UIModifiers":[{"title":"Small","description":"Small","price":0,"basePrice":0,"defaultState":1,"menuItemPath":"9869-10337-10437-10438-9901","quantity":1,"note":""}]}]})
		When method POST
		Then status 200
	    * print response



        


        
