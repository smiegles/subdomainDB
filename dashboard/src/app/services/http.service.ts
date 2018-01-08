import { Injectable } from '@angular/core';
import { Http, Headers, RequestOptions } from '@angular/http';

@Injectable()
export class HttpService {

  constructor(public http:Http) { }

  get (path:string, options:object = { data: '' }) {
    return this.http.get(path);
  }

  post (path:string, body:object, options:object = { data: '' }) {
    return this.http.post(path, body);
  }

  put (path:string, body:object, options:object = { data: '' }) {
    return this.http.put(path, body);
  }

  delete (path:string, options:object = { data: '' }) {
    return this.http.delete(path);
  }
}
