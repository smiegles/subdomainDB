import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import {NgForm} from '@angular/forms';

import { HttpService } from './../../services/http.service';

@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.css']
})
export class SearchComponent implements OnInit {

  assets: Object;

  constructor(private http: HttpService) { }

  ngOnInit() {}

  onKey(event: any) {
    this.doSearch(event.target.value)
  }

  doSearch(search) {
    this.http.get('/api/domain/search/' + search).subscribe(response => {
      let data = response.json();
      this.assets = data['domains'];
    }, error => {
      // logout dan.
    })
  }
}
