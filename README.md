# SubdomainDB

DNSDB is a simple self-hosted API that allows you to maintain your own subdomain database. Don't run this on an unauthenticated environment. For now there is no authentication implemented.

### How to launch

```
bundle install
bundle exec rake db:migrate
rerun -- rackup --port 4000 config.ru
```

# API Documentation

## GET /api/domain/

**Response (found)**

```json
{
  "domains": [
    {
      "id": 1,
      "name": "example.com"
    },
    {
      "id": 2,
      "name": "apple.com"
    }
  ],
  "success": true
}
```

## GET /api/domain/search/le.co

**Response (found)**

```json
{
  "domains": [
    {
      "id": 8,
      "name": "nu.example.com",
      "created_at": "2018-01-04 21:15:42 UTC"
    },
    {
      "id": 12,
      "name": "pro.apple.com",
      "created_at": "2018-01-05 01:32:48 UTC"
    }
  ],
  "debug": {
    "offset": 0,
    "limit": 10
  },
  "success": true
}
```

**Response (not found)**

```json
{
  "success": false,
  "message": "No results"
}
```

### GET /api/domain/:domain

**Response (found)**

```json
{
  "domains": [
    {
      "id": 11,
      "name": "admin.apple.com",
      "created_at": "2018-01-05 01:32:48 UTC"
    },
    {
      "id": 12,
      "name": "pro.apple.com",
      "created_at": "2018-01-05 01:32:48 UTC"
    }
  ],
  "success": true
}
```

**Response (not found)**

```json
{
  "success": false,
  "message": "domain not found"
}
```

### POST /api/domain/:domain

**Request**

```json
{
  "domains" : [
    "admin.example.com",
    "test.example.com"
  ]
}
```

**Response**

```json
{
  "message" : "domains inserted",
  "success" : true
}
```

### DELETE /api/domain/:domain

**Response**

```json
{
  "message" : "Successfully deleted",
  "success" : true
}
```
