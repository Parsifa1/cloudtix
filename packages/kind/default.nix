{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule rec {
  pname = "kind";
  version = "0.22.0";

  src = fetchFromGitHub {
    owner = "kubernetes-sigs";
    repo = "kind";
    rev = "v${version}";
    hash = "sha256-DJTsyGEQA36MSmW5eWYTV1Tk6JOBIVJrEARA/x70S0U=";
  };

  vendorHash = "sha256-J/sJd2LLMBr53Z3sGrWgnWA8Ry+XqqfCEObqFyUD96g=";

  ldflags = ["-s" "-w"];

  meta = with lib; {
    description = "Kubernetes IN Docker - local clusters for testing Kubernetes";
    homepage = "https://github.com/kubernetes-sigs/kind";
    license = licenses.asl20;
    maintainers = with maintainers; [parisfa1];
    mainProgram = "kind";
  };
}
