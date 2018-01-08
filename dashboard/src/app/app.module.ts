import { AngularFontAwesomeModule } from 'angular-font-awesome';
import { RouterModule, Routes } from '@angular/router';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpModule} from '@angular/http';

// services
import { HttpService } from './services/http.service';


// components
import { AppComponent } from './app.component';
import { NavigationComponent } from './components/navigation/navigation.component';

import { AssetsListComponent } from './components/assets/list/list.component';
import { AssetsViewComponent } from './components/assets/view/view.component';
import { SearchComponent } from './components/search/search.component';

const appRoutes: Routes = [
 { path : '', component : AssetsListComponent },
 { path : 'search', component : SearchComponent },
 { path : 'asset/:name', component: AssetsViewComponent}
];

@NgModule({
  declarations: [
    AppComponent,
    AssetsListComponent,
    AssetsViewComponent,
    NavigationComponent,
    SearchComponent
  ],
  imports: [
    AngularFontAwesomeModule,
    BrowserModule,
    RouterModule.forRoot(
      appRoutes
    ),
    HttpModule
  ],
  providers: [HttpService],
  bootstrap: [AppComponent]
})
export class AppModule { }
