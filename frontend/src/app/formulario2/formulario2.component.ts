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

  constructor(private fs: DataService,private formBuilder: FormBuilder, private route: ActivatedRoute) { }
  ngOnInit() {
  }
  confirmar(){

  }
  cancelar(){

  }
}
