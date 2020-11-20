---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://empata.snedac.com/signin'>Sign up to obtain your credentials</a>
  - <a href='#'>Please contact us to obtain your API key</a>

includes:
  - errors

search: true

code_clipboard: true
---

# Introduction

Welcome in e-Mpata secure API! You can use this API endpoints to made differents payment operations via your e-Mpata wallet.

You will found below examples with differents programmation languages like Shell, Java and JavaScript! You can view the example code in the dark right zone.

###Required steps

1. Sandbox

1.1. Create your partner's account <a href='https://uat.e-mpata.snedac.com/signin' target='_blank'>Here</a> to obtain your test credentials
1.2. Contact us via e-mail address <b>christopher.osei@hologram.cd</b> to obtain your Sandbox API key

2. Live

2.1. Create your partner's account <a href='https://empata.snedac.com/signin' target='_blank'>Here</a> to obtain your Live credentials
2.2. Contact us via e-mail address <b>christopher.osei@hologram.cd</b> to obtain your Live API key

<aside class="notice">
The only format supported by API to exchange data is JSON format.
</aside>

# Environment

e-Mpata offers 2 environments to his partners, a Sandbox environment to test and validate their workflow and a Live one to made a real operations.

Environment | EMPATA_SERVER_URL 
--------- | ------------------
Sandbox | https://uat.e-mpata.snedac.com/ws
Live | https://empata.snedac.com/ws

# Authentication

##Obtain your JWT key

> To authenticate, use this code:

```shell
curl -X POST "${EMPATA_SERVER_URL}/authenticate" \
 -H "accept: application/json" \
 -H "Content-Type: application/json" \ 
 -d \
 { 
	"application": "meowmeowmeow", 
	"password": "mysecret",
	"username": "user@partner.com"
 }
```

> The code above return a JSON content structured like below:

```json
{
  "jwttoken": "seXIw2WRL5H0iLNNGzVfLPs5OF5puKuYjPRUma4GQVxIvT-659uWfVir5CNd7IOmH5ow"
}
```

e-Mpata uses a JWT token to authorize his API access. The authenticate endpoint permit to obtain this token, to get it, you need to fill in a POST request with below parameters.

### HTTP Request

`POST ${EMPATA_SERVER_URL}/ws/authenticate`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
application | Yes | Your API Key given by e-Mpata
password | Yes | Your e-Mmpata's account password
username | Yes | Your e-Mpata's account email

e-Mpata API expect a JWT token in all request's header made to his server, as below:

`Authorization: Bearer jwttoken`

<aside class="notice">
The generated token time to live is 05 hours.
</aside>

# Operations

## make a transfert

```shell
curl -X POST "${EMPATA_SERVER_URL}/partner/transfer" \
 -H "accept: application/json" \
 -H "Content-Type: application/json" \
 -H "Authorization: Bearer jwttoken" \ 
 -d \
 { 
	"sender": "string",
	"receiver": "string",
	"operationType":0,
	"amount": 0,
	"currency": "string",
	"feesIn":false,
	"date": "2020-11-03T13:36:03",
	"description": "string"
 }
```

> The above command returns JSON structured like this:

```json
{
    "operationId": 235,
    "reference": "Z99G4VSEI0",
    "amount": 200,
    "fees": 10,
    "description": "test usd",
    "operationDate": "2020-10-29T05:14:07.000+0000",
    "status": "SUCCESS",
    "sender": "9876543",
    "receiver": "0200000001",
    "operationType": {
        "operationTypeId": 3,
        "libelle": "M-Mpata vers M-Mpata"
    }
}
```

This endpoint is used to made a payment (Account to Account transfer)

### HTTP Request

`POST ${EMPATA_SERVER_URL}/partner/transfer`

### Query Parameters

Parameter | Required | Type | Description
--------- | ------- | ----------------- | -------------
sender | Yes | string | sender's account number/phone number (Account to debit)
receiver | Yes | string | receiver’s account number/phone number (Account to credit)
operationType | Yes | int | operation type id. value is 3
amount | Yes | double | amount to pay
currency | Yes | string | payment currency iso code (CDF, USD). Default value: CDF
feesIn | Yes | boolean | true/false (fees include in transaction amount or not)
date | Yes | Date | merchant operation date. format: yyyy-MM-ddTHH:mm:ss
description | false | string | description

## make a deposit

```shell
curl -X POST "${EMPATA_SERVER_URL}/partner/deposit" \
 -H "accept: application/json" \
 -H "Content-Type: application/json" \
 -H "Authorization: Bearer jwttoken" \ 
 -d \
 { 
	"sender": "string",
	"receiver": "string",
	"operationType":0,
	"amount": 0,
	"currency": "string",
	"feesIn":false,
	"date": "2020-11-03T13:36:03",
	"description": "string"
 }
```

> The above command returns JSON structured like this:

```json
{
    "operationId": 235,
    "reference": "Z99G4VSEI0",
    "amount": 200,
    "fees": 10,
    "description": "test usd",
    "operationDate": "2020-10-29T05:14:07.000+0000",
    "status": "SUCCESS",
    "sender": "9876543",
    "receiver": "0200000001",
    "operationType": {
        "operationTypeId": 1,
        "libelle": "Dépot"
    }
}
```

This endpoint is used to make a deposit a E-mpata user account.

### HTTP Request

`POST ${EMPATA_SERVER_URL}/partner/deposit`

### Query Parameters

Parameter | Required | Type | Description
--------- | ------- | ----------------- | -------------
sender | Yes | string | sender’s account number/phone number
receiver | Yes | string | receiver’s account number/phone number (Account to credit)
operationType | Yes | int | operation type id. value is 1
amount | Yes | double | deposit amount
currency | Yes | string | payment currency iso code(CDF, USD). Default value: CDF
feesIn | Yes | boolean | true/false (fees include in transaction amount or not)
date | Yes | Date | merchant operation date. format: yyyy-MM-ddTHH:mm:ss
description | false | string | description

