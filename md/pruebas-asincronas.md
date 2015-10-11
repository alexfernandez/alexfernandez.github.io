% Pruebas asíncronas en node.js

![](pics/pruebas-asincronas.jpg "Laboratorio de pruebas")

node.js está muy orientado al desarrollo de software asíncrono: en lugar de ejecutar código y mantenernos ocupados mientras llega la respuesta, se suele liberar el hilo de ejecución para que corran otras tareas mientras esperamos.

Las pruebas asíncronas suelen ser bastante complejas: primero hay que hacer una llamada, esperar, y luego comprobar que el resultado devuelto es el esperado. En este post (mi primero en este blog) explicaré cómo usar una nueva librería de pruebas (llamada, en un alarde de imaginación, testing) pensada especialmente para facilitar pruebas asíncronas.

## Instalación

Para instalar la librería sólo tenemos que hacer en el directorio raíz:

```
$ npm install testing
```

O añadir testing a las dependencias en nuestro `package.json`. A continuación podemos empezar a jugar con la librería.

## Pruebas elementales

Las pruebas más sencillas son las que no necesitan esperar a ningún evento. El esquema es siempre el mismo: corremos nuestro código con unos parámetros preparados, comprobamos los resultados y declaramos el éxito o el fracaso de la prueba. Vamos a ver el típico ejemplo de la función que suma:

```
function sum(first, second)
{
  return first + second;
}
```

La probamos pasándole parámetros conocidos (por ejemplo 1 y 1), y verificando que da el resultado esperado (que en este caso dejamos como ejercicio para el lector; bueno, es 2). Podemos hacernos una función de andar por casa para hacer la prueba:

```
function testSum()
{
  if (sum(1, 1) != 2)
  {
    console.error('Invalid result');
    return;
  }
  console.log('Valid result');
}
```

Para una prueba sencilla no necesitamos más. Ahora añadimos otra prueba para la función `substract()`, que sorprendentemente resta dos números:

```
function testSubstract()
{
  if (substract(2, 1) != 1)
  {
    console.error('Invalid result');
    return;
  }
  console.log('Valid result');
}
```

Y hacemos una función que llame a todas las pruebas para correrlas juntas:

```
function test()
{
  testAdd();
  testSubstract();
}
```

Cuando tenemos varias pruebas, la salida empieza a volverse engorrosa: para saber si todas las pruebas funcionan, tenemos que parsear un montón de texto y buscar posibles errores. Es entonces cuando empezamos a ver asteriscos en la salida, múltiples filas de signos igual (`======`), etcétera.

## Pruebas síncronas

¿Cómo se haría esto mismo con testing?

Para empezar tenemos las funciones `testing.success()` y `testing.failure()` que simplifican el mostrar mensajes de error, con colores y todo. La primera prueba quedaría así:

```
function testSum()
{
  if (sum(1, 1) != 2)
  {
    testing.failure('Invalid result');
    return;
  }
  testing.success('Valid result');
}
```

Hum, no hemos ganado demasiado. Vamos a usar algo un pelín más potente: las aserciones. Para empezar la más sencilla: `testing.assert()`, que nos permite evaluar una condición. Si es falsa se mostrará una condición de error:

```
function testSum()
{
  testing.assert(sum(1, 1) == 2, 'Invalid result');
  testing.success('Valid result');
}
```

Esto es mejor: si la condición es falsa, se muestra el mensaje que va en el segundo parámetro en rojo. Pero todavía tenemos otra opción más potente: `testing.assertEquals()`, que comprueba que el valor obtenido sea igual al deseado. No es mucho más breve pero queda más claro:

```
function testSum()
{
  testing.assertEquals(sum(1, 1), 2, 'Invalid result');
  testing.success('Valid result');
}
```

Ahora queremos correr todas las pruebas juntas. Es muy sencillo: usamos la función `testing.run()` que nos permite añadir múltiples funciones y probarlas todas en secuencia:

```
function test()
{
  testing.run({
    add: testAdd,
    substract: testSubstract,
  });
}
```

El primer parámetro es un objeto que contiene por cada atributo una función de prueba; por ahora no necesitamos más.

## Pruebas asíncronas

Supongamos que nuestra prueba es algo más compleja: queremos leer el fichero `pepito.txt` y comprobar que contiene el valor esperado, `"pepito"`. Sería algo así:

```
function testFile()
{
  fs.readFile('pepito.txt', function(error, result)
  {
    if (result != 'pepito')
    {
      console.error('Invalid file contents');
      return;
    }
    console.log('Valid file contents');
  });
}
```

¿Cómo nos ayuda testing? La librería está pensada específicamente para esto, así que en este caso es cuando más vamos a poder ganar usándola. Ya hemos visto cómo usar aserciones; ahora vamos a usar la magia de las callbacks, añadiéndole una a la función `testFile()`. Esta callback se la pasaremos a su vez a las funciones de testing, siempre como último parámetro:

```
function testFile(callback)
{
  fs.readFile('pepito.txt', function(error, result)
  {
    testing.assertEquals(result, 'pepito', 'Invalid file contents', callback);
    testing.success('Valid file contents', callback);
  });
}
```

Ahora llamamos a la función `testFile()` con una callback que recibirá, como es habitual en node.js, error y resultado:

```
testFile(function(error, result)
{
  if (error)
  {
    console.error('Error: %s', error);
  }
  else
  {
    console.log('Success: %s', result);
  }
});
```

Si tenemos varias pruebas, pasaremos la callback a `testing.run()`:

```
function test(callback)
{
  testing.run({
    file: testFile,
    web: testWeb,
  }, callback);
}
```

Y la invocaremos con nuestra callback a medida:

```
test(function(error, result)
{
  if (error)
  {
    console.error('Error: %s', error);
  }
  else
  {
    console.log('Success: %s', result);
  }
});
```

La librería se encargará de correr las funciones una tras otra, hasta que se encuentre un error o hasta que se terminen. En el primer caso llamará a la callback con un parámetro de error; en el segundo, con un resultado.

Sencillo, ¿verdad?

## Tiempos fuera

A veces las funciones asíncronas no llegan a llamar a la callback, de forma que el código se interrumpe. Resultado: una prueba que nunca termina. Nos interesa tratar esta condición y asegurarnos de que no se dé nunca en producción, ya que lleva al temible efecto de páginas que nunca responden.

Por defecto, testing espera un segundo para cada prueba; si tras ese tiempo no se ha llamado a la callback, considera que ha habido un error y concluye las pruebas.

Cuando usamos `testing.run()` podemos especificar un timeout en milisegundos como segundo parámetro:

```
function test(callback)
{
  testing.run({
    add: testAdd,
    substract: testSubstract,
  }, 10000, callback);
}
```

De esta forma, la librería se esperará 10 segundos antes de dar las pruebas por finalizadas. Esto puede ser útil si tenemos muchos accesos externos o tareas que llevan bastante tiempo.

## Corriendo las pruebas

Aún hay algo más: testing nos proporciona una callback a propósito para mostrar errores y resultados, `testing.show()`, así que sólo tenemos que pasársela a nuestras funciones de `test()`:

```
// run tests
test(testing.show);
```

Esta línea iría al final de nuestro fichero mientras probamos.

Un ejemplo muy sencillo lo podemos ver si corremos npm test testing, lo que correrá todas las pruebas del propio paquete testing:

```
$ npm test testing
 
$ testing@0.0.2 test /home/chenno/projects/loadtest/node_modules/testing
$ node index.js
 
[Thu Jul 11 2013 22:43:49 GMT+0200 (CEST)] NOTICE success
[Thu Jul 11 2013 22:43:49 GMT+0200 (CEST)] ERROR test; do not consider
[Thu Jul 11 2013 22:43:49 GMT+0200 (CEST)] NOTICE All tests successful: { successFailure: undefined,
  assert: undefined }
```

Mucha gente ejecuta las pruebas una vez y luego se olvida de ellas, con el resultado de que su código termina envejeciendo según se va modificando. Es molesto tener que añadir (o descomentar) la línea `test(testing.show)`; cada vez que hacemos un cambio.

Para evitarlo, podemos correr nuestras pruebas sólo si el fichero se invoca directamente. El siguiente código puede ser útil:

```
// run tests if invoked directly
if (__filename == process.argv[1])
{
    test(testing.show);
}
```

Ahora sólo tienes que correr el fichero directamente:

```
$ node myfile.js
```

para ejecutar todas las pruebas que haya en el fichero cada vez.

## Conclusión

Ya no tienes excusa para no tener un juego de pruebas completo y actualizado en node.js. Te aseguro que el esfuerzo de crearlas y mantenerlas se pagará al menos 10 veces durante el tiempo de tu proyecto.

`---8<---8<---8<---8<---8<---`

Original publicado en [GodTIC](http://www.godtic.com/blog/2013/07/11/pruebas-asincronas-en-node-js/) el 2013-07-11.

De vuelta al [índice](../index.html).

