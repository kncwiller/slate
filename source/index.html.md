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
  "account": {
    "accountId": 0,
    "accountType": {
      "accountTypeId": 0,
      "libelle": "string"
    },
    "activationCode": "string",
    "active": true,
    "country": "string",
    "createDate": "2020-11-16T15:24:11.700Z",
    "currency": "string",
    "expire": "2020-11-16T15:24:11.700Z",
    "idNational": "string",
    "msisdn": "string",
    "nomEntreprise": "string",
    "numero": "string",
    "pin": "string",
    "rccm": "string",
    "solde": 0,
    "soldeEntreprise": 0,
    "updateDate": "2020-11-16T15:24:11.700Z",
    "user": {
      "actif": true,
      "activationCode": "string",
      "address": "string",
      "blacklist": true,
      "creationDate": "2020-11-16T15:24:11.700Z",
      "email": "string",
      "firstName": "string",
      "lastLogin": "2020-11-16T15:24:11.700Z",
      "lastName": "string",
      "msisdn": "string",
      "nickName": "string",
      "nombre": 0,
      "pays": "string",
      "platform": "string",
      "profil": "User",
      "raisonSocial": "string",
      "secondaryAddress": "string",
      "userId": 0
    }
  },
  "administrator": "string",
  "amount": 0,
  "arrivee": "string",
  "bulk": true,
  "bulkId": "string",
  "bulkPayment": 0,
  "codeSms": "string",
  "depart": "string",
  "description": "string",
  "entreprise": {
    "accountId": 0,
    "accountType": {
      "accountTypeId": 0,
      "libelle": "string"
    },
    "activationCode": "string",
    "active": true,
    "country": "string",
    "createDate": "2020-11-16T15:24:11.700Z",
    "currency": "string",
    "expire": "2020-11-16T15:24:11.700Z",
    "idNational": "string",
    "msisdn": "string",
    "nomEntreprise": "string",
    "numero": "string",
    "pin": "string",
    "rccm": "string",
    "solde": 0,
    "soldeEntreprise": 0,
    "updateDate": "2020-11-16T15:24:11.700Z",
    "user": {
      "actif": true,
      "activationCode": "string",
      "address": "string",
      "blacklist": true,
      "creationDate": "2020-11-16T15:24:11.700Z",
      "email": "string",
      "firstName": "string",
      "lastLogin": "2020-11-16T15:24:11.700Z",
      "lastName": "string",
      "msisdn": "string",
      "nickName": "string",
      "nombre": 0,
      "pays": "string",
      "platform": "string",
      "profil": "User",
      "raisonSocial": "string",
      "secondaryAddress": "string",
      "userId": 0
    }
  },
  "fees": 0,
  "guestReceiver": {
    "createdAt": "2020-11-16T15:24:11.700Z",
    "email": "string",
    "id": 0,
    "name": "string",
    "tel": "string"
  },
  "guestSender": {
    "createdAt": "2020-11-16T15:24:11.700Z",
    "email": "string",
    "id": 0,
    "name": "string",
    "tel": "string"
  },
  "operationDate": "2020-11-16T15:24:11.700Z",
  "operationId": 0,
  "operationType": {
    "libelle": "string",
    "operationTypeId": 0
  },
  "other": {
    "accountId": 0,
    "accountType": {
      "accountTypeId": 0,
      "libelle": "string"
    },
    "activationCode": "string",
    "active": true,
    "country": "string",
    "createDate": "2020-11-16T15:24:11.700Z",
    "currency": "string",
    "expire": "2020-11-16T15:24:11.700Z",
    "idNational": "string",
    "msisdn": "string",
    "nomEntreprise": "string",
    "numero": "string",
    "pin": "string",
    "rccm": "string",
    "solde": 0,
    "soldeEntreprise": 0,
    "updateDate": "2020-11-16T15:24:11.700Z",
    "user": {
      "actif": true,
      "activationCode": "string",
      "address": "string",
      "blacklist": true,
      "creationDate": "2020-11-16T15:24:11.700Z",
      "email": "string",
      "firstName": "string",
      "lastLogin": "2020-11-16T15:24:11.700Z",
      "lastName": "string",
      "msisdn": "string",
      "nickName": "string",
      "nombre": 0,
      "pays": "string",
      "platform": "string",
      "profil": "User",
      "raisonSocial": "string",
      "secondaryAddress": "string",
      "userId": 0
    }
  },
  "receiver": "string",
  "reference": "string",
  "status": "string"
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
curl -X POST "http://51.38.42.38:8080/ws/operation/deposit" -H "accept: application/json" \
 -H "Content-Type: application/json" -H "Authorization: Bearer jwttoken" \ 
 -d "{ \"sender\": \"string\", \"account\": \"string\", \"operationType\":0, \"amount\": 0,\"currency\": \"string\", \ 
 \"feesIn\": \"false\",\"date\": \"2020-11-03T13:36:03\",\"description\": \"string\"}"
```

> The above command returns JSON structured like this:

```json
{
  "account": {
    "accountId": 0,
    "accountType": {
      "accountTypeId": 0,
      "libelle": "string"
    },
    "activationCode": "string",
    "active": true,
    "country": "string",
    "createDate": "2020-11-16T15:24:11.700Z",
    "currency": "string",
    "expire": "2020-11-16T15:24:11.700Z",
    "idNational": "string",
    "msisdn": "string",
    "nomEntreprise": "string",
    "numero": "string",
    "pin": "string",
    "rccm": "string",
    "solde": 0,
    "soldeEntreprise": 0,
    "updateDate": "2020-11-16T15:24:11.700Z",
    "user": {
      "actif": true,
      "activationCode": "string",
      "address": "string",
      "blacklist": true,
      "creationDate": "2020-11-16T15:24:11.700Z",
      "email": "string",
      "firstName": "string",
      "lastLogin": "2020-11-16T15:24:11.700Z",
      "lastName": "string",
      "msisdn": "string",
      "nickName": "string",
      "nombre": 0,
      "pays": "string",
      "platform": "string",
      "profil": "User",
      "raisonSocial": "string",
      "secondaryAddress": "string",
      "userId": 0
    }
  },
  "administrator": "string",
  "amount": 0,
  "arrivee": "string",
  "bulk": true,
  "bulkId": "string",
  "bulkPayment": 0,
  "codeSms": "string",
  "depart": "string",
  "description": "string",
  "entreprise": {
    "accountId": 0,
    "accountType": {
      "accountTypeId": 0,
      "libelle": "string"
    },
    "activationCode": "string",
    "active": true,
    "country": "string",
    "createDate": "2020-11-16T15:24:11.700Z",
    "currency": "string",
    "expire": "2020-11-16T15:24:11.700Z",
    "idNational": "string",
    "msisdn": "string",
    "nomEntreprise": "string",
    "numero": "string",
    "pin": "string",
    "rccm": "string",
    "solde": 0,
    "soldeEntreprise": 0,
    "updateDate": "2020-11-16T15:24:11.700Z",
    "user": {
      "actif": true,
      "activationCode": "string",
      "address": "string",
      "blacklist": true,
      "creationDate": "2020-11-16T15:24:11.700Z",
      "email": "string",
      "firstName": "string",
      "lastLogin": "2020-11-16T15:24:11.700Z",
      "lastName": "string",
      "msisdn": "string",
      "nickName": "string",
      "nombre": 0,
      "pays": "string",
      "platform": "string",
      "profil": "User",
      "raisonSocial": "string",
      "secondaryAddress": "string",
      "userId": 0
    }
  },
  "fees": 0,
  "guestReceiver": {
    "createdAt": "2020-11-16T15:24:11.700Z",
    "email": "string",
    "id": 0,
    "name": "string",
    "tel": "string"
  },
  "guestSender": {
    "createdAt": "2020-11-16T15:24:11.700Z",
    "email": "string",
    "id": 0,
    "name": "string",
    "tel": "string"
  },
  "operationDate": "2020-11-16T15:24:11.700Z",
  "operationId": 0,
  "operationType": {
    "libelle": "string",
    "operationTypeId": 0
  },
  "other": {
    "accountId": 0,
    "accountType": {
      "accountTypeId": 0,
      "libelle": "string"
    },
    "activationCode": "string",
    "active": true,
    "country": "string",
    "createDate": "2020-11-16T15:24:11.700Z",
    "currency": "string",
    "expire": "2020-11-16T15:24:11.700Z",
    "idNational": "string",
    "msisdn": "string",
    "nomEntreprise": "string",
    "numero": "string",
    "pin": "string",
    "rccm": "string",
    "solde": 0,
    "soldeEntreprise": 0,
    "updateDate": "2020-11-16T15:24:11.700Z",
    "user": {
      "actif": true,
      "activationCode": "string",
      "address": "string",
      "blacklist": true,
      "creationDate": "2020-11-16T15:24:11.700Z",
      "email": "string",
      "firstName": "string",
      "lastLogin": "2020-11-16T15:24:11.700Z",
      "lastName": "string",
      "msisdn": "string",
      "nickName": "string",
      "nombre": 0,
      "pays": "string",
      "platform": "string",
      "profil": "User",
      "raisonSocial": "string",
      "secondaryAddress": "string",
      "userId": 0
    }
  },
  "receiver": "string",
  "reference": "string",
  "status": "string"
}
```

This endpoint is used to make a deposit a E-mpata user account.

### HTTP Request

`POST http://51.38.42.38:8080/ws/operation/deposit`

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

