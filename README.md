# Consultas_SQL_peliculas

## 🗂 Estructura del Proyecto
La organización de los archivos y carpetas es la siguiente:

- **.dbeaver/**: Archivos de configuración y perfiles de DBeaver.
- **.git/**: Carpeta de control de versiones del repositorio Git.
- **documento proyecto/**: Documentos adicionales que describen el alcance y los requisitos del proyecto.
- **Scripts/**: Contiene los scripts SQL principales, organizados según el área de análisis.
  - `categorias.sql`: Consultas sobre categorías de películas.
  - `clientes.sql`: Consultas relacionadas con los clientes y su comportamiento de alquiler.
  - `tendencias.sql`: Consultas que identifican patrones y tendencias en los datos de alquiler.
  - `correcciones.sql`: Consultas que han sido corregidas durante la revisión del proyecto.
- **README.md**: Este archivo, que describe el proyecto y su estructura.
- **.project**: Archivo de configuración del entorno de desarrollo.

## 🛠 Instalación y Requisitos
Para ejecutar este proyecto necesitas:

- **Base de datos**: Un servidor compatible como MySQL o PostgreSQL.
- **Cliente SQL**: DBeaver, SQL Workbench u otra herramienta para ejecutar consultas SQL.

### Pasos para Configuración:
1. Clona este repositorio en tu máquina local.
2. Configura tu servidor de base de datos e importa el esquema de datos proporcionado.
3. Navega a la carpeta `Scripts/` y ejecuta los scripts en el orden necesario para replicar los análisis.

## ✅ Consultas Corregidas
Durante la revisión, las siguientes consultas fueron ajustadas:

- **Consulta 4**: Se corrigieron los comentarios y optimización de la lógica.
- **Consulta 9**: Ajustamos los decimales del resultado para mantener consistencia.
- **Consulta 11**: Se corrigió el `LIMIT` para mostrar solo el antepenúltimo resultado correctamente.
- **Consulta 31**: Usamos `LEFT JOIN` para incluir todas las películas, incluso las que no tienen actores.
- **Consulta 32**: Usamos `LEFT JOIN` para incluir todos los actores, incluso los que no tienen películas.
- **Consulta 39**: Eliminamos el orden por nombre, dejando solo el apellido.
- **Consulta 41**: Mostramos claramente el nombre más repetido.
- **Consulta 42**: Concatenamos el nombre completo de los clientes.
- **Consulta 64**: Confirmamos que la consulta funciona correctamente y es clara.

Las consultas corregidas se encuentran ahora en el archivo `Scripts/correcciones.sql` para mayor claridad.

## 📊 Resultados y Conclusiones
*Aún no se han definido las conclusiones finales del análisis.*

## 🔄 Próximos Pasos
- Optimizar las consultas SQL para mejorar su eficiencia.
- Documentar las conclusiones finales del análisis.
- Continuar con las mejoras y ampliación del proyecto.

## ✒ Autores
- **Lara** - Analista de Datos en formación.