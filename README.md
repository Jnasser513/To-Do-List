# To-Do List

Una aplicación de transacciones construida con Flutter 3, diseñada para facilitar la gestión de gastos e ingresos.

## Requisitos Técnicos

### 1. Lenguaje y Framework
La aplicación está desarrollada utilizando **Flutter 3**. 
- **Compilación y Ejecución**: El código es completamente compilable y ejecutable en dispositivos Android.

### 2. Gestión de Estado
Para la gestión del estado, se ha utilizado **Provider** para el estado global de la aplicación, especialmente para manejar las transacciones de la base de datos. Además, se ha empleado **setState** para manejar algunos estados locales en widgets específicos.

- **Justificación**:
  - **Provider**: Es ideal para el manejo de estado global debido a su capacidad para notificar a múltiples widgets sobre cambios de estado. Esto es particularmente útil en aplicaciones que manejan datos complejos, como las transacciones en nuestra base de datos.
  - **setState**: Se ha utilizado para estados locales que no requieren una propagación amplia del cambio, lo que simplifica la gestión del estado en widgets individuales. Esto permite un desarrollo más ágil y menos acoplamiento en componentes que no necesitan interactuar con el estado global.

### 3. Persistencia de Datos
Se ha optado por **Sqflite** para la persistencia de datos. Aunque **SharedPreferences** es útil para almacenar datos sencillos, en este caso, es necesario almacenar múltiples objetos de forma estructurada.

- **Justificación**:
  - **Sqflite**: Proporciona una base de datos local más robusta y estructurada, lo que permite realizar consultas complejas y gestionar múltiples objetos de manera efectiva. Esto es crucial para una aplicación de lista de tareas, donde se requiere un manejo adecuado de las tareas, incluyendo creación, obtencion y eliminación.

### 4. Subida a GitHub

## Manejo de Versionamiento
Se utilizó el modelo de **Gitflow** para el manejo de versionamiento en GitHub. Actualmente, la rama `main` se usa como el ambiente de desarrollo. A partir de esta rama, se crean diferentes ramas utilizando la notación `feature/nombre-descriptivo`. Al finalizar el desarrollo de cada característica, se realiza una pull request hacia `main`.

## Instrucciones para Clonar y Ejecutar el Proyecto

1. Clona el repositorio:
 ```bash
 git clone https://github.com/Jnasser513/To-Do-List.git
 ```

2. Accede al repositorio:
  ```bash
  cd To-Do-List
  ```

3. Instalar dependencias:
  ```bash
  flutter pub get
  ```

4. Compilar y ejecutar la aplicación:
  ```bash
  flutter run
  ```


## Detalles Relevantes sobre la Implementación

La aplicación cuenta con una interfaz amigable que permite a los usuarios agregar, editar y eliminar tareas.
La estructura del proyecto se organizó de manera que las diferentes capas (data, domain y presentation) estén claramente separadas, facilitando el mantenimiento y la escalabilidad.


## Capturas de pantalla

Cuando se entre a la aplicacion se encuentra una pantalla con un boton para agregar transaccion y un texto si aun no ha agregado una transaccion.

<img src="https://github.com/user-attachments/assets/be3f28fb-8ef9-47cf-aaf1-a3179807155b" alt="Home" width="200" />



Al momento de presionar al boton redirige a la pantalla de crear transaccion, en esta se llenaria el formulario, los 3 campos editables son requeridos en caso de no llenar alguno saltara un snackbar con un mensaje.

<img src="https://github.com/user-attachments/assets/18723a46-2d8d-4867-997e-0895c7ba67e5" alt="create_todo" width="200" />



Al momento de presionar el boton seleccionar flecha despliega un DatePicker

<img src="https://github.com/user-attachments/assets/b24fbd80-62ef-43c6-934a-8b8ec3ebb4ea" alt="date_picker" width="200" />



Al momento de presionar el boton de agregar transaccion redirige a la lista de transaccion y se refleja la nueva creada, mostrando el total de gastos, ingresos y balance actual.

<img src="https://github.com/user-attachments/assets/8dde3d50-eb6d-4dae-bf57-cf6b840be9e8" alt="home_income" width="200" />
<img src="https://github.com/user-attachments/assets/b48192aa-629a-467b-8f0b-66a54d593b93" alt="home_expense" width="200" />
