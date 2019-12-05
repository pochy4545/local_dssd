import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { DataService } from '../services/data.service'
import { ActivatedRoute } from '@angular/router';
import { puts } from 'util';

@Component({
  selector: 'app-fromulario1',
  templateUrl: './fromulario1.component.html',
  styleUrls: ['./fromulario1.component.css']
})
export class Fromulario1Component implements OnInit {
  contacto: FormGroup;
  submitted = false;
  titulo = 'Registro de Videoconferencia';
  unidads: any;
  tipoVideoc: any;
  tipoParti: any;
  par: string;
  horarios: unknown[] = null;
  internos;
  abogados;
  procuradores;
  jueces; 

  horariosCustom:any;
  token: Object;
  constructor(private fs: DataService,private formBuilder: FormBuilder, private route: ActivatedRoute) { }

   ngOnInit() {
       localStorage.setItem("cancelado","false");
       this.idBonita();
       this.unidades();
       this.tipoVideoconferencia();
       this.tipoParticipante();
       this.contacto = this.formBuilder.group({
           dni: ['', Validators.required],         
           unidad: ['', Validators.required],
           tipoParticipante: ['', Validators.required],
           fecha: ['', Validators.required],
           hora: ['', Validators.required],
           numeroCausa: ['', Validators.required],
           interno: ['', Validators.required],
           abogado: ['', Validators.required],
           procurador: ['', Validators.required],
           juez: ['', Validators.required],
           mensaje: ['', [Validators.required, Validators.minLength(6)]]
       });


       this.horariosCustom = this.formBuilder.group(
         {custom:[Validators.required]}
       )
       this.getParticipanteVideoconferencia()

   }

   get f() { return this.contacto.controls; }

   onSubmit() {
       this.submitted = true;
       if (this.contacto.invalid) {
           return;
       }
       alert('Mensaje Enviado !')
   }

   unidades() {
    this.fs.getUnidades().subscribe(
      result => {         
            this.unidads = Array.from(result);;
          //  console.log(this.unidads);
      },
      error => {
         //console.log(<any>error);
      }
  );
  }
  
  
  tipoVideoconferencia() {
    this.fs.getTipoVideconferencia().subscribe(
      result => {           
              this.tipoVideoc = Array.from(result);
           //   console.log(result);
          
      },
      error => {
      //    console.log(<any>error);
      }
  );
  }
  
  tipoParticipante() {
    this.fs.getTipoParticipantes().subscribe(
      result => {           
              this.tipoParti = Array.from(result);
              console.log(result);
      },
      error => {
        //  console.log(<any>error);
      }
  );
  }
  
  idBonita() {
    this.route.queryParamMap.subscribe(params => {
    this.par = params.get("id")
    localStorage.setItem("idBonita",this.par)
    console.log("######## id bonita:")
    console.log(params)
   })
   }

   cargarHorarios() {
    this.fs.getHorarios(this.contacto.value).subscribe(
      result => {           
              this.horarios = result;
              console.log("#### carga de horarios")
              console.log(this.horarios)
      },
      error => {
          console.log(<any>error);
      }
  );

   }
   confirmarVideoconferencia() {
     //registrar en cloud y backend
     this.fs.confirmarVideoconferencia(this.contacto.value, this.horariosCustom.value).subscribe(
       x=> {
         console.log(x)
         localStorage.setItem('idVideoconferencia', x);
       }
     )
     //verification 

     //setear y avanzar proceso  en bonita
     this.autorizacion()
     
   }

   getParticipanteVideoconferencia() {
    
    this.fs.getParticipanteVideoconferencia().subscribe(
      result => {           
        console.log("me intereza")
              console.log(result)
              this.internos = result.filter(  x => { return x.tipo_participante == 1})
              this.abogados = result.filter(  x => { return x.tipo_participante == 2})
              this.procuradores =result.filter(  x => { return x.tipo_participante == 4})
              this.jueces = result.filter(  x => { return x.tipo_participante == 3})
              
      },
      error => {
          console.log(<any>error);
      }
  );
   }
   autorizacion(){
     this.fs.autenticar().subscribe(
       result => {

         localStorage.setItem("token", result.token)
         localStorage.setItem("jsonId", result.jsonId)
         console.log("token final")
         console.log(localStorage.getItem("token"))
         console.log(localStorage.getItem("jsonId"))
         this.fs.getInfoDelUsuario(this.par, localStorage.getItem("token"), localStorage.getItem("jsonId")).subscribe(result => {
          console.log("info del usuario ###################")
          console.log(result.user_id)
          localStorage.setItem("userId",result.user_id);
        })
         this.fs.avanzar(this.par, localStorage.getItem("token"), localStorage.getItem("jsonId")).subscribe(result => {
          console.log(result)
        })
       }
     )
    return
   }
   

}
