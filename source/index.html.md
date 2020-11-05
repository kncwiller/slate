---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - java
  - javascript

toc_footers:
  - <a href='https://empata.snedac.com'>Inscrivez vous pour obtenir vos paramètres d'authentification</a>
  - <a href='#'>Veuillez nous contacter pour obtenir votre clé API</a>

includes:
  - errors

search: true

code_clipboard: true
---

# Introduction

Bienvenue dans l'APi Empata! Vous pouvez utiliser les endpoints de l'API Empata pour faire réaliser différents types d'opérations de paiement via votre porte feuille électronique.

Vous trouverez ci-dessous des exemples avec différents langages de programmation Shell, Java, and JavaScript! Vous pouvez voir le code exemple dans la zone noire à droite.

# Authentication

> To authorize, use this code:

```java
code java
```

```shell
# With shell, you can just pass the correct header with each request
curl -X POST "http://51.38.42.38:8080/ws/authenticate" -H "accept: application/json" -H "Content-Type: application/json" -d "{ \"application\": \"meowmeowmeow\", \"password\": \"mysecret\", \"username\": \"user@partner.com\"}"
```

```javascript
code javascript
```

> Make sure to replace `meowmeowmeow` with your API key.

Empata utilise un token JWT pour autoriser l'accès à son API. le endpoint authenticate permet d'obtenir ledit token, pour ce faire vous devez fournir les paramètres ci-dessus dans une requète POST.

le username et password (correspondent à l'adresse mail et le mot de passe avec lesquels vous avez créer votre compte sur le site <a href='https://empata.snedac.com'>empata.snedac.com</a>)

Empata attends la clé JWT dans l'entete Authorization de toutes les requetes vers le serveur, comme ci-dessous:

`Authorization: Bearer jwttoken`

<aside class="notice">
You must replace <code>meowmeowmeow</code> with your personal API key.
</aside>

# Kittens

## Get All Kittens

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get()
```

```shell
curl "http://example.com/api/kittens" \
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let kittens = api.kittens.get();
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/api/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Get a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/2" \
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
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

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

## Delete a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.delete(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.delete(2)
```

```shell
curl "http://example.com/api/kittens/2" \
  -X DELETE \
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.delete(2);
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

