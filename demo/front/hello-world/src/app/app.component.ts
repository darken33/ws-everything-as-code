import { Component } from '@angular/core';
import { HelloService } from './hello-api/api/hello.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent { 
  title = 'Appel de l\'api hello';
  result = this.helloService.helloUsingGET1().subscribe(helloDto => (this.title = helloDto.message!));
  constructor(private helloService: HelloService){}
}
