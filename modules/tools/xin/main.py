#!/usr/bin/env python3

import click
import git
import subprocess


def is_root_user() -> bool:
    return False


@click.group()
def cli():
    pass


@click.command()
def own_nix_profiles():
    pass


@click.command()
def rebuild():
    if not is_root_user():
        click.echo(
            "WARNING: Not running as root. System configuration will be built, but not switched."
        )
    subprocess.run("nixos-rebuild --flake github:MattPColeman/dotfiles")


@click.group()
def mac():
    pass


@click.command()
def fixup():
    pass


cli.add_command(mac)
cli.add_command(rebuild)
mac.add_command(fixup)

if __name__ == "__main__":
    cli()
