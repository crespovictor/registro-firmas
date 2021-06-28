# README
## ES

App usada para llevar control del registro de firmas para aspirantes a candidatos independientes en México.

### Requisitos
- Ruby 2.6.6 (Probablemente funciona con versiones superiores, falta checar)
- Rails 6
- ActiveAdmin
- Chartkick
- Devise (Probablemente incluido con activeadmin)

### Uso
- Clonar el repo
- Modificar los headers en `seccions`, `registros` y `auxiliares`
- Deploy en algún servicio soportado (Yo lo hice en Heroku y funciona bien)
- Al importar el CSV que se descarga del INE, borrar los headers, y checar que coincidan con los headers en `registros`
- Las gráficas en Dashboard puede que necesiten adecuarse a las secciones o requerimientos específicos de lxs aspirantes

### To-Do
- Mejorar el código (No desarrollo mucho y puede que haya mejores formas de hacerlo)
- Quitar los valores hardcodeados en los schemas de `secciones` y `registros`, para que se creen automáticamente con el CSV (e incluir headers)
- Mejorar visualizaciones de las gráficas
- Probablemente hacer pre-processing de las gráficas en el backend

## EN
Coming soon
