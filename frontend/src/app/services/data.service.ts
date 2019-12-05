import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'; 
import { Observable } from 'rxjs';
import { puts } from 'util';

@Injectable({
  providedIn: 'root'
})
export class DataService {

  constructor(private http: HttpClient) { }

 
  avanzar(id,token,jsonId) {
    console.log("#### avanzar")
    console.log(id)
    console.log(token)
     return this.http.post<any>('http://localhost:3000/fechas/avanzarTask',{
       idTask: id,
       token: token,
       jsonId: jsonId
     })
  }

  getInfoDelUsuario(id,token,jsonId) {
    console.log("#### get info del usuario")
    console.log(id)
    console.log(token)
     return this.http.post<any>('http://localhost:3000/fechas/getInfoDelUsuario',{
       idTask: id,
       token: token,
       jsonId: jsonId
     })
  }
 
autenticar() {
  return this.http.get<any>('http://localhost:3000/fechas/autenticar')
 }
  getUnidades(): Observable<any> {
    return this.http.get('http://localhost:3000/unidades');
  }

  getHoraYfechaDeVideoconferencia(idVideoconferencia): Observable<any> {
    return this.http.post("http://localhost:3000/fechas/getHoraYfechaDeVideoconferencia",{
      id: idVideoconferencia
    })
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
    let fecha = new Date(form.fecha)
    fecha.setDate(fecha.getDate() + 1)
    return this.http.post("http://localhost:3000/fechas",{
        dni: form.dni,
        hash: "asassbaiusfbaisfbauibfuaibfiu",
        idRol: form.tipoParticipante,
        fecha: fecha.toLocaleDateString(),
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
      idUnidad:id,
      participantes: JSON.parse(localStorage.getItem("participantes"))
  })
  }
  finalizarVideoconferencia(id,estado): Observable<any> {
    return this.http.post('http://localhost:3000/fechas/finalizarVideoconferencia',{
      idUnidad:id,
      estado: estado,
      participantes: JSON.parse(localStorage.getItem("participantes"))
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
  localStorage.setItem("participantes",JSON.stringify(participantes));
  console.log(participantes)
  return this.http.post<any>("http://localhost:3000/fechas/confirmarVideoconferencia",{
        data: obj,
        dataP: participantes
    })
  }
}