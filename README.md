# SubdomainDB

DNSDB is a simple self-hosted API that allows you to maintain your own subdomain database.

__The API is still work in progress and is not functional yet.__

### TODO

- [ ] Implement a database.
- [ ] Add authentication.
- [ ] Create `./install.rb`.
- [ ] Create and implement `/api/domain/:domain` endpoint.
- [ ] Implement `/api/domain/search/:search` functionality.

### Development


```
bundle install

rerun -- rackup --port 4000 config.ru
```

### API documentation
The API documentation (draft) is available [here](./API.md).
