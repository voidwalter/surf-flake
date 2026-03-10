# Surf Flake

Experimental Nix flake for installing [Deta Surf](https://github.com/deta/surf).

> [!NOTE]  
> This is still an experimental flake, might not work perfectly.

### Usage

### 1. Add the Flake to Your Inputs

Add the flake to your `flake. nix`'s inputs:

```nix
# flake.nix
inputs = {
    deta-surf = {
        url = "github:voidwalter/surf-flake/main";
        inputs.nixpkgs.follows = "nixpkgs";
    };
};
```

### 2. Include the Package

You can include the package either via **NixOS system configuration** or **Home Manager**

#### Option 1: NixOS System Configuration

```nix
# configuration.nix
environment.systemPackages = [
    inputs.deta-surf.packages.x86_64-linux.default
];
```

#### Option 2: Home Manager

```nix
# home.nix
home.packages = [
    inputs.deta-surf.packages.x86_64-linux.default
];
```

### 3. Rebuild the configuration

Rebuild your system or user environment(for Home-Manager) to install Surf.

If it works perfectly, it should launch by running `surf`. 
