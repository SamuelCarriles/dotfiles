# alacritty

- `alacritty.toml` importa los archivos de `config/` (rutas relativas).
- Los colores NO están aquí: los genera noctalia en `themes/noctalia.toml`.
  Hay que activar la plantilla de alacritty en noctalia; si no añade el import
  sola, agregar a mano `"~/.config/alacritty/themes/noctalia.toml"` en `[general] import`.
- Orden de imports: lo que se importa último gana. Si noctalia pisa algo
  tuyo, colócalo después.
