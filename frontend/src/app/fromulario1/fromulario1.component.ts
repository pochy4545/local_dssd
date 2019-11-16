import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { DataService } from '../services/data.service'
import { ActivatedRoute } from '@angular/router';

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
  horarios: unknown[];
  constructor(private fs: DataService,private formBuilder: FormBuilder, private route: ActivatedRoute) { }

   ngOnInit() {
       this.idBonita();
       this.unidades();
       this.tipoVideoconferencia();
       this.tipoParticipante();
       this.contacto = this.formBuilder.group({
           nombre: ['', Validators.required],   
           apellido: ['', Validators.required],
           dni: ['', Validators.required],         
           unidad: ['', Validators.required],
           tipoVideoconferencia: ['', Validators.required],
           tipoParticipante: ['', Validators.required],
           fecha: ['', Validators.required],
           hora: ['', Validators.required],
           numeroCausa: ['', Validators.required],
           mensaje: ['', [Validators.required, Validators.minLength(6)]]
       });
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
             // console.log(result);
      },
      error => {
        //  console.log(<any>error);
      }
  );
  }
  
  idBonita() {
    this.route.queryParamMap.subscribe(params => {
    this.par = params.get("id")
    //console.log(params)
   })
   }

   cargarHorarios() {
    this.fs.getHorarios(this.contacto.value).subscribe(
      result => {           
              this.horarios = Array.from(result);
              console.log(result);
      },
      error => {
          console.log(<any>error);
      }
  );
   }

}
