{
  lib,
  fetchFromGitHub,
  nix-update-script,
  php,
}:
php.buildComposerProject2 (finalAttrs: {
  __structuredAttrs = true;
  strictDeps = true;
  pname = "terminus";
  version = "4.3.4";

  src = fetchFromGitHub {
    owner = "pantheon-systems";
    repo = "terminus";
    tag = finalAttrs.version;
    hash = "sha256-Ut6xTVVRUB4uIMWt7PWvRWyI7w2A5CGUbjyy0kt4zvI=";
  };

  vendorHash = "sha256-kSqimEe6EllF1ItNTsYigTPqnZajBljTsXrXIDvtBZQ=";
  
  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Standalone utility for performing operations on the Pantheon Platform";
    homepage = "https://github.com/pantheon-systems/terminus";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [
      OulipianSummer
    ];
    platforms = php.meta.platforms;
    mainProgram = "terminus";
  };
})
