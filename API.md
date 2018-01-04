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

| Key | Value | Explanation | Default |
| --- | --- | --- | --- |
| domains | `Array` | An array with all the domains to add. ` | [] |
| overwrite | `Boolean` | if a domain already exists, update the created_at date. | false |


__Request__

```json
{
  "domains" : [
    "admin.example.com",
    "test.example.com"
  ],
  "overwrite" : true
}
```

__Response__

```json
{
  "message" : "domains inserted",
  "success" : true
}
```
