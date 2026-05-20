{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./minecraft/minecraft-server-1.nix
  ];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.kernelModules = [ "amdgpu" ];
  };

  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-uuid/8118b562-d1ca-4c7c-b9b1-5f2c0ea5d6d1";
    fsType = "ext4";
    options = [
      "defaults"
      "nofail"
    ];
  };

  hardware = {
    amdgpu.opencl.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    bluetooth.enable = true;
  };

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = true;
  };
  nixpkgs.config.allowUnfree = true;

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  networking = {
    hostName = "nixos-btw";
    networkmanager.enable = true;
  };

  i18n = {
    defaultLocale = "ru_RU.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "ru_RU.UTF-8";
      LC_IDENTIFICATION = "ru_RU.UTF-8";
      LC_MEASUREMENT = "ru_RU.UTF-8";
      LC_MONETARY = "ru_RU.UTF-8";
      LC_NAME = "ru_RU.UTF-8";
      LC_NUMERIC = "ru_RU.UTF-8";
      LC_PAPER = "ru_RU.UTF-8";
      LC_TELEPHONE = "ru_RU.UTF-8";
      LC_TIME = "ru_RU.UTF-8";
    };
  };
  time.timeZone = "Asia/Almaty";
  console = {
    font = "cyr-sun16";
    keyMap = "us";
    earlySetup = true;
  };

  services = {
    displayManager.ly.enable = true;
    power-profiles-daemon.enable = true;
    accounts-daemon.enable = true;
    printing.enable = false;
    pulseaudio.enable = false;
    lact.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
  };

  programs = {
    niri.enable = true;
    zsh.enable = true;
    gamemode.enable = true;
    nh = {
      enable = true;
      flake = "/etc/nixos";
      clean = {
        enable = true;
        extraArgs = "--keep-since 7d --keep 5";
        dates = "weekly";
      };
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
    };
  };

  users.users.mollan = {
    isNormalUser = true;
    description = "mollan";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "input"
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-color-emoji
    twitter-color-emoji
    liberation_ttf
  ];

  system.stateVersion = "25.11";
}
