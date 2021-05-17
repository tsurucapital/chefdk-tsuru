nix flake exposing various useful tools for managing chef repositories

## Updating chefdk components.

To update any gems or versions, see the `Gemfile` in the `chefdk` directory.
After you're done making changes, just run.

```console
$ nix-shell --run 'cd chefdk && bundix -l'
```
