import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'; 
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DataService {

  constructor(private http: HttpClient) { }

 /*
  autorizar() {
    //http://localhost:8080/bonita/loginservice?username=agustin&password=123
  }
  avanzar(idTask) {
    //http://localhost:8080/API/bpm/userTask/40030/execution
  }
 */
  getUnidades(): Observable<any> {
    return this.http.get('http://localhost:3000/unidades');
  }

  getTipoParticipantes(): Observable<any> {
    return this.http.get('http://localhost:3000/tipo_participantes');
  }
  
  getTipoVideconferencia(): Observable<any> {
    return this.http.get('http://localhost:3000/tipo_videoconferencia');
  }
}