/*
NOTA IMPORTANTE
EN DART NO PODEMOS DECLARAR LOS NOMBRES DE LAS VARIABLES CON LA PRIMERA LETRA EN MAYUSCULA
YA QUE DE HACER ESO LA DVM (MAQUINA VIRTUAL DE DART POR SUS SIGLAS EN INGLES)
VA A INFERIR EN AUTOMATICO QUE SE TRATA DE UNA CLASE Y NO DE UNA VARIABLE
por esos los nombres los conjuntos estan en letras minusculas

Este es un ejemplo sencillo porque los elementos son del mismo tamaño
ademas de que son conjuntos cortos
*/

//declaracion de los conjuntos sobre los que se van a trabajar
List<int> conjunto1 = [1, 3, 5, 7];
List<int> conjunto2 = [2, 4, 6, 7];

//funcion que retorna una lista que representa la union de los conjuntos A y B
List<int> union(List<int> a, List<int> b) => [...a, ...b];

/*Funcion que retorna una lista que representa la interseccion del conjunto A y B
En este caso se usa un for each en para recorrer el conjunto B y se usa la variable
"value" para asignar el valor de ese conjunto y se pregunta si ese valor esta contenido en A
en el caso de que si entonces se añade a listaaux, en el caso de dart el foreach es algo
distinto a otros lenguajes de programacion ya que como arumentos requiere la variable donde
se ira almacenando el valor de la lista, y el conjunto de instrucciones con las que trabajara
*/
List<int> interseccion(List<int> a, List<int> b) {
  var listaux = <int>[];

  b.forEach((value) {
    if (a.contains(value)) {
      listaux.add(value);
    }
  });

  return listaux;
}

//parecido a interseccion pero en esta ocasion pregunta si el valor que se obtiene de b no esta
//contenido en a, si se cumple la condicion se añade a listaaux y se retorna esa lista
List<int> diferencia(List<int> a, List<int> b) {
  var listaux = <int>[];

  b.forEach((value) {
    if (!a.contains(value)) {
      listaux.add(value);
    }
  });

  return listaux;
}

/*
Como la diferencia simetrica es la union de la diferencia del conjunto A con B
y del conjunto B con A, solo se deben unir las diferencias y se obtiene la
diferencia simetrica, y en este caso comola funcion diferencia da un return de
una lista, solo se mandan esa funciones a la funcion union para que se resuelvan
primero las funciones diferencia y con el resultado de cada funcion, trabaje la
funcion union.
Como en este caso la funcion solo tiene una linea de codigo dart permite utilizar
el operador flecha
*/
List<int> diferenciaSimetrica(List<int> a, List<int> b) =>
    union(diferencia(b, a), diferencia(a, b));

/* 
 * En este caso del plan cartesiano para formatearlo se utiliza una lista
 * que guarda los valores como un string para representarlo de mejor
 * manera ademas de que se ordenan desde un inicio con el metodo sort
 * que ya viene po defecto en dart para mostrar de manera mas
 * estetica el resultado final del producto cartesiano
*/
List<String> cartesiano(List<int> a, List<int> b) {
  var listaux = <String>[];

  a.sort();
  b.sort();

  a.forEach((val) {
    b.forEach((subVal) {
      var par = '($val, $subVal)';

      if (!listaux.contains(par)) {
        listaux.add(par);
      }
    });
  });

  return listaux;
}

void main(List<String> arguments) {
  print('Conjunto A: $conjunto1');
  print('Conjunto B: $conjunto2');

  print('\nUnion AB: ${union(conjunto1, conjunto2)}');
  print('Interseccion AB: ${interseccion(conjunto1, conjunto2)}');

  print('\nDiferencia AB: ${diferencia(conjunto2, conjunto1)}');
  print('Diferencia BA: ${diferencia(conjunto1, conjunto2)}');

  print(
      '\nDiferencia Simetrica AB: ${diferenciaSimetrica(conjunto1, conjunto2)}');

  print('\nProducto cartesiano AB: ${cartesiano(conjunto1, conjunto2)}');
  print('\nProducto cartesiano BA: ${cartesiano(conjunto2, conjunto1)}');
}
