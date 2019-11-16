import { Component, OnInit } from '@angular/core';
import { DataService } from '../services/data.service'
import { ActivatedRoute } from "@angular/router";

@Component({
  selector: 'app-data',
  templateUrl: './data.component.html',
  styleUrls: ['./data.component.css']
})
export class DataComponent implements OnInit {
  par: string;

  constructor(private fs: DataService, private route: ActivatedRoute) { 
      
  }

  ngOnInit() {
    
  }

  idBonita() {
   this.route.queryParamMap.subscribe(params => {
   this.par = params.get("id")
   console.log(params)
  })
  }

  unidades() {
    this.fs.getUnidades().subscribe(
      result => {         
          if(result.code != 200){
              console.log(result);
          }else{
              this.unidades = result.data;
          }
      },
      error => {
          console.log(<any>error);
      }
  );
  }

  tipoParticipante() {
    this.fs.getTipoParticipantes().subscribe(
      result => {           
          if(result.code != 200){
              console.log(result);
          }else{
              this.tipoParticipante = result.data;
          }
      },
      error => {
          console.log(<any>error);
      }
  );
  }
  
  tipoVideoconferencia() {
    this.fs.getTipoVideconferencia().subscribe(
      result => {           
          if(result.code != 200){
              console.log(result);
          }else{
              this.tipoVideoconferencia = result.data;
          }
      },
      error => {
          console.log(<any>error);
      }
  );
  }

}
