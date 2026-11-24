# dotfiles

Mi configuración de NixOS y de algunos programas.

## Estructura

- `nixos/`: configuración del sistema (flake + flake-parts + import-tree, patrón dendrítico).
  Cada archivo de `modules/` registra una funcionalidad y el host la activa en
  `modules/hosts/valkyrie.nix`.
- `nvim/`: configuración de Neovim.
- `niri/`: configuración de niri.
- `noctalia/`: configuración de noctalia.

## Aplicar el sistema

```
cd nixos
sudo nixos-rebuild switch --flake .#valkyrie
```

## En una máquina nueva

- Regenerar `hardware-configuration.nix` con `nixos-generate-config`; el de
  este repo es de valkyrie y no sirve en otro equipo.
- Mantener `system.stateVersion` con el valor con el que se instaló esa máquina.
- Los dotfiles se enlazan a mano a `~/.config` (ver abajo).

## Notas

- nixpkgs está fijado a un commit concreto en `flake.nix`; actualizar con `nix flake update`.
