{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs = with pkgs.buildPackages; let
    # Neovim Vue LSP(ex-Volar) internaly calls
    # - ts_ls, so we need to link it to TSLSP real name.
    ts_ls =
      pkgs.writeShellScriptBin
      "ts_ls"
      "bun run typescript-language-server --stdio";
  in [
    openssl
    pkg-config
    clang
    bun
    go
    ts_ls
  ];
  shellHook = ''
    # Install All dev dependencies (LSP)
    ${pkgs.bun}/bin/bun install
    # Install Pug LSP
    ${pkgs.go}/bin/go install github.com/opa-oz/pug-lsp@latest
  '';
  LIBCLANG_PATH = "${pkgs.llvmPackages.libclang.lib}/lib";
}
