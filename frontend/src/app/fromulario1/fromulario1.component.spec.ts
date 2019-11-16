import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Fromulario1Component } from './fromulario1.component';

describe('Fromulario1Component', () => {
  let component: Fromulario1Component;
  let fixture: ComponentFixture<Fromulario1Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Fromulario1Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Fromulario1Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
