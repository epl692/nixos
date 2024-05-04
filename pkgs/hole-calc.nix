{ config, pkgs, ... }:

let
  githubRepo = "github:epl692/hole-calc";
  holeCalcSrc = pkgs.fetchGit {
    url = githubRepo;
    rev = "master";
  };

  holeCalc = pkgs.buildPackage {
    name = "hole-calc";
    src = holeCalcSrc;
  };
in

environment.systemPackages = with pkgs; [ holeCalc ];