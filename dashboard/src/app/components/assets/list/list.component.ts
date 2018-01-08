import { Component, OnInit } from '@angular/core';
import { HttpService } from './../../../services/http.service';

@Component({
  selector: 'app-assets-list',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.css']
})
export class AssetsListComponent implements OnInit {

  assets: Object;

  constructor(private http: HttpService) { }

  ngOnInit() {
    this.http.get('/api/domain/').subscribe(response => {
      let data = response.json();
      this.assets = data['domains'];
    }, error => {
      // logout dan.
    })
  }

}
