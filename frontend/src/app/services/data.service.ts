import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'; 
import { Observable } from 'rxjs';
import { puts } from 'util';

@Injectable({
  providedIn: 'root'
})
export class DataService {

  constructor(private http: HttpClient) { }

 
  avanzar(id,token) {
    console.log("#### avanzar")
    console.log(id)
    console.log(token)
     return this.http.post<any>('http://localhost:3000/fechas/avanzarTask',{
       idTask: id,
       token: token
     })
    //http://localhost:8080/API/bpm/userTask/40030/execution
  
  }
 
autenticar() {
  return this.http.get('http://localhost:3000/fechas/autenticar')
 }
  getUnidades(): Observable<any> {
    return this.http.get('http://localhost:3000/unidades');
  }

  getEstadoDeVideoconferencia(): Observable<any> {
    return this.http.get('http://localhost:3000/estado_videoconferencia')
  }

  getTipoParticipantes(): Observable<any> {
    return this.http.get('http://localhost:3000/tipo_participantes');
  }
  getParticipanteVideoconferencia(): Observable<any> {
    return this.http.get('http://localhost:3000/participante_videoconferencia');
  }
  getTipoVideconferencia(): Observable<any> {
    return this.http.get('http://localhost:3000/tipo_videoconferencia');
  }

  getHorarios(form): Observable<any> {
    console.log(form)
    return this.http.post("http://localhost:3000/fechas",{
        dni: form.dni,
        hash: "asassbaiusfbaisfbauibfuaibfiu",
        idRol: form.tipoParticipante,
        fecha: "12/12/2019",
        hora: form.hora,
        id_unidad: form.unidad
    })

  }

  iniciarVideoconferencia(id): Observable<any>{
    return this.http.post("http://localhost:3000/fechas/iniciarVideoconferencia",{
        idUnidad:id
    })

  }

  cancelarVideoconferencia(id): Observable<any>{
    return this.http.post("http://localhost:3000/fechas/cancelarVideoconferencia",{
      idUnidad:id
  })
  }
  finalizarVideoconferencia(id,estado): Observable<any> {
    return this.http.post('http://localhost:3000/fechas/finalizarVideoconferencia',{
      idUnidad:id,
      estado: estado
    });
  }

  confirmarVideoconferencia(formulario, horarios){
    let obj
    console.log("formulario")
    console.log(formulario)
   if(!!horarios.id){
      
       obj = {fecha: horarios.attributes.fecha,
              tipoParticipante: formulario.tipoParticipante,
              hora: horarios.attributes.hora,
              unidad: horarios.idUnidad,
              numeroCausa: formulario.numeroCausa,
              motivo: formulario.mensaje}  //FALTA SOLICITANTE Y PARTICIPANTES
    }
  else{
      obj = {fecha: formulario.fecha,
      tipoParticipante: formulario.tipoParticipante,
      hora: formulario.hora,
      unidad: formulario.unidad,
      numeroCausa: formulario.numeroCausa,
      motivo: formulario.mensaje}

  }
  
  let participantes=[formulario.juez,formulario.procurador,formulario.interno,formulario.abogado]
  console.log(participantes)
  return this.http.post<any>("http://localhost:3000/fechas/confirmarVideoconferencia",{
        data: obj,
        dataP: participantes
    })
  }
}