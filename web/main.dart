import 'dart:html';
import 'dart:convert';
import './models/persona.dart';

void main() {
  final crud = CRUD();
  querySelector('#output').children.add(crud.create());
}

class CRUD {
  Persona persona = Persona();
  String state;
  create() {
    var location = window.location;
    print(location.href);
    // Declaracion de elementos
    DivElement divContainer = DivElement();
    FormElement form = FormElement();
    TextInputElement inputNombre = TextInputElement();
    TextInputElement inputApellidoPaterno = TextInputElement();
    TextInputElement inputApellidoMaterno = TextInputElement();
    NumberInputElement inputEdad = NumberInputElement();
    ButtonElement buttonAccept = ButtonElement();
    ButtonElement buttonCancel = ButtonElement();

    // declaracion de atributos

    form.id = 'formulario-creacion';

    inputNombre.placeholder = 'Alberto';
    inputNombre.id = 'nombre';
    inputApellidoPaterno.id = 'apellido-paterno';
    inputApellidoPaterno.placeholder = 'Rodriguez';
    inputApellidoMaterno.id = 'apellido-materno';
    inputApellidoMaterno.placeholder = 'Castro';
    inputEdad.placeholder = '32';
    buttonAccept.type = 'button';
    buttonCancel.type = 'button';
    buttonAccept.text = 'Aceptar';
    buttonCancel.text = 'Cancel';

    // se creas los hijos de los components
    divContainer.children.add(form);
    form.children.add(inputNombre);
    form.children.add(inputApellidoPaterno);
    form.children.add(inputApellidoMaterno);
    form.children.add(inputEdad);
    form.children.add(buttonAccept);
    form.children.add(buttonCancel);

    // asignacion de valores

    this.persona.nombre = inputNombre.value;
    this.persona.apellidoPaterno = inputApellidoPaterno.value;
    this.persona.apellidoMaterno = inputApellidoMaterno.value;
    this.persona.edad = inputEdad.valueAsNumber;
    // Eventos

    buttonAccept.onClick.listen((MouseEvent onData) => onClickButtonAccept(
        inputNombre.value,
        inputApellidoPaterno.value,
        inputApellidoMaterno.value,
        inputEdad.valueAsNumber));
    buttonCancel.onClick.listen((MouseEvent onData) => {print(onData)});
    return divContainer;
  }

  onClickButtonAccept(
      String nombre, String apellidoPaterno, String apellidoMaterno, num edad) {
    this.persona.nombre = nombre;
    this.persona.apellidoPaterno = apellidoPaterno;
    this.persona.apellidoMaterno = apellidoMaterno;
    this.persona.edad = edad;

    var jsonString = json.encode(this.persona.toJson());
    print(jsonString);
    print({
      this.persona.nombre,
      this.persona.apellidoPaterno,
      this.persona.apellidoMaterno,
      this.persona.edad
    });
  }

  render() {}
}
