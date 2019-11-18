import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { FormulariojuezComponent } from './formulariojuez.component';

describe('FormulariojuezComponent', () => {
  let component: FormulariojuezComponent;
  let fixture: ComponentFixture<FormulariojuezComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FormulariojuezComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FormulariojuezComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
