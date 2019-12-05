import { Component, OnInit } from '@angular/core';
import { DataService } from '../services/data.service'
import { ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-formulario3',
  templateUrl: './formulario3.component.html',
  styleUrls: ['./formulario3.component.css']
})
export class Formulario3Component implements OnInit {
  contacto: FormGroup;
  estados: any;
  iniciada: boolean;
  display: boolean;
  constructor(private fs: DataService,private formBuilder: FormBuilder, private route: ActivatedRoute) { }
  ngOnInit() {
    this.idBonita()
    if(localStorage.getItem("cancelado")== "true"){
       this.display = false
       this.autorizacion()
    } else {
      this.display = true
    }
    this.getEstadoFinalizarVideoconferencia()
    this.contacto = this.formBuilder.group({
      estado: ['', Validators.required]})

  }

  idBonita() {
    this.route.queryParamMap.subscribe(params => {
    localStorage.setItem("idBonita3",params.get("id"))
    console.log("######## id bonita:")
    console.log(params)
   })
  }

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
          this.autorizacion()
        },
        error =>  {
          console.log(<any> error);
        }
      )
    }
    autorizacion(){
      this.fs.avanzar(localStorage.getItem("idBonita3"), localStorage.getItem("token"), localStorage.getItem("jsonId")).subscribe(result => {
       console.log(result)
       
     })
}
}
