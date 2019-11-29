import { Component, OnInit } from '@angular/core';
import { DataService } from '../services/data.service'
import { ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-formulario2',
  templateUrl: './formulario2.component.html',
  styleUrls: ['./formulario2.component.css']
})
export class Formulario2Component implements OnInit {
  contacto: FormGroup;
  estados: any;
  iniciada: boolean;
  constructor(private fs: DataService,private formBuilder: FormBuilder, private route: ActivatedRoute) { }
  ngOnInit() {
    this.idBonita()
    this.contacto = this.formBuilder.group({
      estado: ['', Validators.required]})

  }
  idBonita() {
    this.route.queryParamMap.subscribe(params => {
    localStorage.setItem("idBonita2",params.get("id"))
    console.log("######## id bonita:")
    console.log(params)
   })
  }
   
  iniciarVideoconferencia(){
    this.fs.getHoraYfechaDeVideoconferencia(localStorage.getItem('idVideoconferencia')).subscribe(
      result => {      
        let ok = false
        console.log("hora y fecha de videoconferencia");
        console.log(result)
        if(new Date(result.fecha) >= new Date) {
        this.fs.iniciarVideoconferencia(localStorage.getItem('idVideoconferencia')).subscribe(
          result => {      
                console.log("iniciar vdeoconferencia") 
                this.iniciada =true    
                console.log(result);
                this.autorizacion()
          },
          error => {
              console.log(<any>error);
          })
        }
    },
    error => {
        console.log(<any>error);
      
    })  
  }
    
  cancelarVideoconferencia(){
    this.fs.cancelarVideoconferencia(localStorage.getItem('idVideoconferencia')).subscribe(
      result => {       
             console.log("cancelar videoconferencia")    
             console.log(result)
             this.autorizacion()
             localStorage.setItem("cancelado", "true") 
      },
      error => {
          console.log(<any>error);
      }

    )}

    autorizacion(){
          this.fs.avanzar(localStorage.getItem("idBonita2"), localStorage.getItem("token"), localStorage.getItem("jsonId")).subscribe(result => {
           console.log(result)
         })
    }
}
