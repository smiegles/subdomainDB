# SubdomainDB

DNSDB is a simple self-hosted API that allows you to maintain your own subdomain database.
The API is still work in progress and is not functional yet.

# API Documentation

## GET /api/domain/search/le.co

__Response__

```json
[
  {
    "apple.com" : {
      "created_at" : ".."
    },
    "admin.example.com" : {
      "created_at" : ".."
    },
    "test.example.com" : {
      "created_at" : ".."
    }
  }
]
```

### GET /api/domain/:domain

__Response__

```json
[
  {
    "admin.example.com" : {
      "created_at" : ".."
    },
    "test.example.com" : {
      "created_at" : ".."
    }
  }
]
```


### POST /api/domain/:domain

__Request__

```json
{
  "domains" : [
    "admin.example.com",
    "test.example.com"
  ]
}
```

__Response__

```json
{
  "message" : "domains inserted",
  "success" : true
}
```
