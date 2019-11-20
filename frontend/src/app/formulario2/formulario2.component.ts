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
    this.getEstadoFinalizarVideoconferencia()
    this.contacto = this.formBuilder.group({
      estado: ['', Validators.required]})

  }
  iniciarVideoconferencia(){
    this.fs.iniciarVideoconferencia(localStorage.getItem('idVideoconferencia')).subscribe(
      result => {      
            console.log("iniciar vdeoconferencia") 
            this.iniciada =true    
            console.log(result);
      },
      error => {
          console.log(<any>error);
      }

    )}
  cancelarVideoconferencia(){
    this.fs.cancelarVideoconferencia(localStorage.getItem('idVideoconferencia')).subscribe(
      result => {       
             console.log("cancelar videoconferencia")    
             console.log(result) 
      },
      error => {
          console.log(<any>error);
      }

    )}

    getEstadoFinalizarVideoconferencia() {
      this.fs.getEstadoDeVideoconferencia().subscribe(
        result => {        
               console.log("get estado finalizar videoconferencia")   
               console.log(result)
               this.estados= result 
        },
        error => {
            console.log(<any>error);
        }
  
      )}

    finalizarVideoconferencia() {
      console.log(this.contacto.value)
      this.fs.finalizarVideoconferencia(localStorage.getItem('idVideoconferencia'),this.contacto.value).subscribe(
        result => {
          console.log("finalizar videoconferencia")
          console.log(result)
        },
        error =>  {
          console.log(<any> error);
        }
      )
    }
}
