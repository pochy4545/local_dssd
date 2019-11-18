import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DataComponent } from './data/data.component';
import { Fromulario1Component } from './fromulario1/fromulario1.component';
import { Formulario2Component } from './formulario2/formulario2.component';
import { Formulario3Component } from './formulario3/formulario3.component';
import { FormulariojuezComponent } from './formulariojuez/formulariojuez.component';


const routes: Routes = [
  {path:'data',component: DataComponent},
  {path:'formulario1', component: Fromulario1Component},
  {path:'formulario2', component: Formulario2Component},
  {path:'formulario3', component: Formulario3Component},
  {path:'formulariojuez', component: FormulariojuezComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
