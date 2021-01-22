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

Welcome to e-Mpata secure API! You can use this API endpoints to made differents payment operations via your e-Mpata wallet.

You will found below examples with differents programmation languages like Shell, Java and JavaScript! You can view the example code in the dark right zone.

###Required steps

* Sandbox

    1. Create your partner's account <a href='https://uat.e-mpata.snedac.com/signin' target='_blank'>Here</a> to obtain your test credentials<br/>
    2. Contact us via e-mail address **support@snedac.com** to obtain your Sandbox API key

* Live

    1. Create your partner's account <a href='https://empata.snedac.com/signin' target='_blank'>Here</a> to obtain your Live credentials<br/>
    2. Contact us via e-mail address **support@snedac.com** to obtain your Live API key

<aside class="notice">
The only format supported by API to exchange data is JSON format.
</aside>

# Environment

e-Mpata offers 2 environments to his partners, a Sandbox environment to test and validate their workflow and a Live one to made a real operations.

Environment | EMPATA_SERVER_URL 
--------- | ------------------
Sandbox | https://dev.e-mpata.snedac.com/ws
Live | https://api.e-mpata.snedac.com/ws

# Supported Currency

e-Mpata deal with 02 currencies at the moment, it's required to set the currency ISO value in each operation.

Currency | ISO Value 
--------- | ------------------
Franc Congolais | CDF
Dollar US | USD

# Supported Operation Type

e-Mpata use an unique identifier for each type of operation

Operation Type | ID 
--------- | ------------------
Account to Account | 3
Cash to Wallet | 4
Cash to Cash | 14
Withdraw | 15

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
password | Yes | Your e-Mpata's account password
username | Yes | Your e-Mpata's account email

e-Mpata API expect a JWT token in all request's header made to his server, as below:

`Authorization: Bearer jwttoken`

<aside class="notice">
The generated token time to live is 05 hours.
</aside>

# Operations

## Account to Account

```shell
curl -X POST "${EMPATA_SERVER_URL}/partner/transfer" \
 -H "accept: application/json" \
 -H "Content-Type: application/json" \
 -H "Authorization: Bearer jwttoken" \ 
 -d \
 { 
   "amount": 1000,
   "date": "2021-01-11T10:01:14",
   "description": "partner test",
   "feesIn": false,
   "currency":"CDF",
   "operationType": 3,
   "receiver": "0200000003"
 }
```

> The above command returns JSON structured like this:

```json
{
    "operationId": 284,
    "reference": "G7YHVBUKRA",
    "amount": -1000,
    "fees": 0,
    "currency": "CDF",
    "description": "partner test",
    "operationDate": "2021-01-11T10:01:14.000+0000",
    "status": "SUCCESS",
    "sender": "8765343",
    "receiver": "0200000003",
    "from": null,
    "to": null,
    "operationType": {
        "operationTypeId": 3,
        "libelle": "M-Mpata vers M-Mpata",
        "category": null,
        "hasFees": null,
        "active": true
    }
}
```

This endpoint is used to made a payment (Account to Account transfer)

### HTTP Request

`POST ${EMPATA_SERVER_URL}/partner/transfer`

### Query Parameters

Parameter | Required | Type | Description
--------- | ------- | ----------------- | -------------
receiver | Yes | string | receiver’s account number/phone number (Account to credit)
operationType | Yes | int | operation type idenfier. See Operation Type Section above
amount | Yes | double | amount to pay
currency | Yes | string | payment currency iso code. Default value: CDF
feesIn | Yes | boolean | true/false (fees include in transaction amount or not)
date | Yes | Date | merchant operation date. format: yyyy-MM-ddTHH:mm:ss
description | false | string | description

## Cash to Wallet

```shell
curl -X POST "${EMPATA_SERVER_URL}/partner/transfert/external" \
 -H "accept: application/json" \
 -H "Content-Type: application/json" \
 -H "Authorization: Bearer jwttoken" \ 
 -d \
 { 
   "amount": 1000,
   "date": "2021-01-11T10:01:14",
   "description": "partner test",
   "feesIn": false,
   "currency":"CDF",
   "operationType": 4,
   "receiver": "0200000003"
 }
```

> The above command returns JSON structured like this:

```json
{
    "operationId": 285,
    "reference": "G7YHVBUKRA",
    "amount": -1000,
    "fees": 0,
    "currency": "CDF",
    "description": "partner test",
    "operationDate": "2021-01-11T10:01:14.000+0000",
    "status": "SUCCESS",
    "sender": "8765343",
    "receiver": "0200000003",
    "from": null,
    "to": null,
    "operationType": {
        "operationTypeId": 4,
        "libelle": "M-Mpata vers Autres",
        "category": null,
        "hasFees": null,
        "active": true
    }
}
```

This endpoint is used to made a Cash to mobile wallet payment

### HTTP Request

`POST ${EMPATA_SERVER_URL}/partner/transfert/external`

### Query Parameters

Parameter | Required | Type | Description
--------- | ------- | ----------------- | -------------
receiver | Yes | string | receiver’s phone number (Mobile Wallet)
operationType | Yes | int | operation type idenfier. See Operation Type Section above
amount | Yes | double | amount to pay
currency | Yes | string | payment currency iso code. Default value: CDF
feesIn | Yes | boolean | true/false (fees include in transaction amount or not)
date | Yes | Date | merchant operation date. format: yyyy-MM-ddTHH:mm:ss
description | No | string | description

## Cash to Cash

```shell
curl -X POST "${EMPATA_SERVER_URL}/partner/standard/transfert" \
 -H "accept: application/json" \
 -H "Content-Type: application/json" \
 -H "Authorization: Bearer jwttoken" \ 
 -d \
 {
	"amount": 8000,
	"date": "2021-01-11T10:01:14",
	"description": "partner test",
	"feesIn": false,
	"currency":"CDF",
	"operationType": 14,
	"receiverEmail": "receiver@test.com",
	"senderEmail": "sender@test.com",
	"receiverName": "Faly Kindu",
	"senderName": "Hassane",
	"receiverPhone": "698029075",
	"senderPhone": "675330990"
 }
```

> The above command returns JSON structured like this:

```json
{
    "operationId": 281,
    "reference": "SQWXC7NZFO",
    "amount": 8000,
    "fees": 500,
	"currency": "CDF",
    "description": "partner test",
    "operationDate": "2021-01-11T10:01:14.000+0000",
    "status": "WAITING_WITHDRAW",
    "sender": "8765343",
    "receiver": null,
	"from": {
        "id": 2,
        "name": "Hassane",
        "tel": "675330990",
        "email": "sender@test.com",
        "createdAt": "2021-01-06T10:20:16.000+0000"
    },
    "to": {
        "id": 1,
        "name": "Faly Kindu",
        "tel": "698029075",
        "email": "receiver@test.com",
        "createdAt": "2021-01-06T10:20:16.000+0000"
    },
    "operationType": {
        "operationTypeId": 14,
        "libelle": "Transfert standard",
        "category": null,
        "hasFees": null,
        "active": true
    }
}
```

This endpoint is used to send cash money to receiver.

### HTTP Request

`POST ${EMPATA_SERVER_URL}/partner/standard/transfert`

### Query Parameters

Parameter | Required | Type | Description
--------- | ------- | ----------------- | -------------
senderName | Yes | string | sender’s name
senderPhone | Yes | string | sender's phone number
senderEmail | No | string | sender's email address
receiverName | Yes | string | receiver’s name
receiverPhone | Yes | string | receiver’s phone number
receiverEmail | No | string | receiver’s email address
operationType | Yes | int | operation type identifier. See Operation Type Section above
amount | Yes | double | operation amount
currency | Yes | string | payment currency iso code. Default value is CDF
feesIn | Yes | boolean | true/false (fees included in transaction amount or not)
date | Yes | Date | merchant operation date. format: yyyy-MM-ddTHH:mm:ss
description | false | string | description

## Withdraw

```shell
curl -X GET "${EMPATA_SERVER_URL}/partner/standard/withdraw/SQWXC7NZFO" \
 -H "accept: application/json" \
 -H "Authorization: Bearer jwttoken"
```

> The above command returns JSON structured like this:

```json
{
    "operationId": 282,
    "reference": "59N0TAZOBM",
    "amount": -8000,
    "fees": 0,
	"currency": "CDF",
    "description": "partner test",
    "operationDate": "2021-01-11T22:32:10.828+0000",
    "status": "WITHDRAWN",
    "sender": "0828752889",
    "receiver": null,
	"from": {
        "id": 2,
        "name": "Hassane",
        "tel": "675330990",
        "email": "sender@test.com",
        "createdAt": "2021-01-06T10:20:16.000+0000"
    },
    "to": {
        "id": 1,
        "name": "Faly Kindu",
        "tel": "698029075",
        "email": "receiver@test.com",
        "createdAt": "2021-01-06T10:20:16.000+0000"
    },
    "operationType": {
        "operationTypeId": 15,
        "libelle": "Retrait standard",
        "category": null,
        "hasFees": null,
        "active": null
    }
}
```

This endpoint is used to get operation's details from given reference in order to pay receiver.

### HTTP Request

`GET ${EMPATA_SERVER_URL}/partner/standard/withdraw/{reference}`

### Query Parameters

Parameter | Required | Type | Description
--------- | ------- | ----------------- | -------------
reference | Yes | string | operation unique reference generated by system

## Find

```shell
curl -X GET "${EMPATA_SERVER_URL}/partner/operation/find/282" \
 -H "accept: application/json" \
 -H "Authorization: Bearer jwttoken"
```

> The above command returns JSON structured like this:

```json
{
    "operationId": 282,
    "reference": "59N0TAZOBM",
    "amount": -8000,
    "fees": 0,
	"currency": "CDF",
    "description": "partner test",
    "operationDate": "2021-01-11T22:32:10.828+0000",
    "status": "WITHDRAWN",
    "sender": "0828752889",
    "receiver": null,
	"from": {
        "id": 2,
        "name": "Hassane",
        "tel": "675330990",
        "email": "sender@test.com",
        "createdAt": "2021-01-06T10:20:16.000+0000"
    },
    "to": {
        "id": 1,
        "name": "Faly Kindu",
        "tel": "698029075",
        "email": "receiver@test.com",
        "createdAt": "2021-01-06T10:20:16.000+0000"
    },
    "operationType": {
        "operationTypeId": 15,
        "libelle": "Retrait standard",
        "category": null,
        "hasFees": null,
        "active": null
    }
}
```

This endpoint is used to get a specific operation's details that identifier is given.

### HTTP Request

`GET ${EMPATA_SERVER_URL}/partner/operation/find/{id}`

### Query Parameters

Parameter | Required | Type | Description
--------- | ------- | ----------------- | -------------
id | Yes | Long | operation unique identifier

## Find by reference

```shell
curl -X GET "${EMPATA_SERVER_URL}/partner/operation/findBy/59N0TAZOBM" \
 -H "accept: application/json" \
 -H "Authorization: Bearer jwttoken"
```

> The above command returns JSON structured like this:

```json
{
    "operationId": 282,
    "reference": "59N0TAZOBM",
    "amount": -8000,
    "fees": 0,
	"currency": "CDF",
    "description": "partner test",
    "operationDate": "2021-01-11T22:32:10.828+0000",
    "status": "WITHDRAWN",
    "sender": "0828752889",
    "receiver": null,
	"from": {
        "id": 2,
        "name": "Hassane",
        "tel": "675330990",
        "email": "sender@test.com",
        "createdAt": "2021-01-06T10:20:16.000+0000"
    },
    "to": {
        "id": 1,
        "name": "Faly Kindu",
        "tel": "698029075",
        "email": "receiver@test.com",
        "createdAt": "2021-01-06T10:20:16.000+0000"
    },
    "operationType": {
        "operationTypeId": 15,
        "libelle": "Retrait standard",
        "category": null,
        "hasFees": null,
        "active": null
    }
}
```

This endpoint is used to get a specific operation's details from given reference.

### HTTP Request

`GET ${EMPATA_SERVER_URL}/partner/operation/findBy/{reference}`

### Query Parameters

Parameter | Required | Type | Description
--------- | ------- | ----------------- | -------------
reference | Yes | string | operation unique reference generated by the system   