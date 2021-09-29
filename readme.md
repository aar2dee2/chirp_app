# Chirp (a Twitter clone) created using Chris McCord's tutorial

Setting up

1. Run repl to get hex  `mix local.hex --if-missing --force`.

2. Add packages to replit.nix - add `pkgs.inotify-tools` and `pkgs.postgresql_13`

```
{ pkgs }: {
	deps = [
		pkgs.elixir
    pkgs.postgresql_13
    pkgs.inotify-tools
	];
}
```

3. Install phoenix with `mix archive.install hex phx_new 1.6.0`

3. Create a new app including all LiveView dependencies `mix phx.new chirp --live`

4. Create database in Supabase, add database credentials to replit secrets, replace in config/dev.exs. Also change ip from `127, 0, 0, 1` to `0,0,0,0` and port from `4000` to `5432`.

5. Run `cd chirp` and `mix ecto.create`