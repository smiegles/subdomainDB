import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router';

import { HttpService } from './../../../services/http.service';

@Component({
  selector: 'app-assets-view',
  templateUrl: './view.component.html',
  styleUrls: ['./view.component.css']
})
export class AssetsViewComponent implements OnInit {
  public asset: any;
  public assets: Object;

  constructor(private route: ActivatedRoute, private http: HttpService) { }

  ngOnInit() {
    this.asset = {
      name: ''
    };
    this.route.params.subscribe( (params) => {
      this.setAsset(params['name']);
      this.doSearch(params['name']);
    })
  }

  setAsset(name) {
    this.asset = {
      name: name
    }
  }

  doSearch(name) {
    this.http.get('/api/domain/' + name).subscribe(response => {
      let data = response.json();
      this.assets = data['domains'];
    }, error => {
      // logout dan.
    })
  }
}
