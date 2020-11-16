---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://empata.snedac.com'>Sign up to obtain your credentials</a>
  - <a href='#'>Please contact us to obtain your API key</a>

includes:
  - errors

search: true

code_clipboard: true
---

# Introduction

Welcome in Empata API! You can use this API endpoints to made differents payment operations via your Empata wallet.

You will found below examples with differents programmation languages like Shell, Java and JavaScript! You can view the example code in the dark right zone.

# Authentication

##Obtain your JWT key

> To authenticate, use this code:

```shell
curl -X POST "http://51.38.42.38:8080/ws/authenticate" -H "accept: application/json" \
 -H "Content-Type: application/json" \ 
 -d "{ \"application\": \"meowmeowmeow\", \"password\": \"mysecret\", \"username\": \"user@partner.com\"}"
```

> The code above return a JSON content structured like below:

```json
{
  "jwttoken": "seXIw2WRL5H0iLNNGzVfLPs5OF5puKuYjPRUma4GQVxIvT-659uWfVir5CNd7IOmH5ow"
}
```

Empata uses a JWT token to authorize his API access. The authenticate endpoint permit to obtain this token, to get it, you need to fill in a POST request with below parameters.

### HTTP Request

`POST http://51.38.42.38:8080/ws/authenticate`

### Query Parameters

Parameter | Rquired | Description
--------- | ------- | -----------
application | Yes | Your API Key given by Empata
password | Yes | Your Empata's account password
username | Yes | Your Empata's account email

Empata expect a JWT token in all request's header made to his server, as below:

`Authorization: Bearer jwttoken`

<aside class="notice">
The generated token time to live is 05 hours.
</aside>

# Operations

## make a transfert

```shell
curl -X POST "http://51.38.42.38:8080/ws/operation/transfer" -H "accept: application/json" \
 -H "Content-Type: application/json" -H "Authorization: Bearer jwttoken" \ 
 -d "{ \"sender\": \"string\", \"receiver\": \"string\", \"operationType\":0, \"amount\": 0,\"currency\": \"string\", \ 
 \"feesIn\": \"false\",\"date\": \"2020-11-03T13:36:03\",\"description\": \"string\"}"
```

> The above command returns JSON structured like this:

```json
{
  "jwttoken": "seXIw2WRL5H0iLNNGzVfLPs5OF5puKuYjPRUma4GQVxIvT-659uWfVir5CNd7IOmH5ow"
}
```

This endpoint is used to made a payment (Account to Account transfer)

### HTTP Request

`POST http://51.38.42.38:8080/ws/operation/transfer`

### Query Parameters

Parameter | Required | Type | Description
--------- | ------- | ----------------- | -------------
sender | Yes | string | sender’s account number/phone number (merchant)
receiver | Yes | string | receiver’s account number/phone number (your customer)
operationType | Yes | int | operation type id. value is 3
amount | Yes | double | amount to pay
currency | Yes | string | payment currency iso code. Default value: CDF
feesIn | Yes | boolean | true/false (fees include in transaction amount or not)
date | Yes | Date | merchant operation date. format: yyyy-MM-ddTHH:mm:ss
description | false | string | description

## make a deposit

```shell
curl "http://51.38.42.38:8080/ws/operation/{id}" \
  -H "Authorization: Bearer jwttoken"
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint is used to make a deposit a E-mpata user account.

### HTTP Request

`POST http://51.38.42.38:8080/ws/operation/transfer`

### Query Parameters

Parameter | Required | Type | Description
--------- | ------- | ----------------- | -------------
sender | Yes | string | sender’s account number/phone number (merchant)
account | Yes | string | receiver’s account number/phone number (your customer)
operationType | Yes | int | operation type id. value is 1
amount | Yes | double | deposit amount
currency | Yes | string | payment currency iso code. Default value: CDF
feesIn | Yes | boolean | true/false (fees include in transaction amount or not)
date | Yes | Date | merchant operation date. format: yyyy-MM-ddTHH:mm:ss
description | false | string | description

## Delete a Specific Kitten

```shell
curl "http://example.com/api/kittens/2" \
  -X DELETE \
  -H "Authorization: meowmeowmeow"
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "deleted" : ":("
}
```

This endpoint deletes a specific kitten.

### HTTP Request

`DELETE http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to delete

