import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DataComponent } from './data/data.component';
import { Fromulario1Component } from './fromulario1/fromulario1.component';


const routes: Routes = [
  {path:'data',component: DataComponent},
  {path:'formulario1', component: Fromulario1Component}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
