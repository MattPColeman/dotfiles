{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    retroarch
    sdl-jstest
    steam
    ckan
    pcsx2
    rpcs3
    wineFull
    winetricks
    nethack
    (pkgs.dwarf-fortress-packages.dwarf-fortress-full.override {
       theme = "jolly-bastion";
    })
  ];

  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;

  /*
    Find your mapping via sdl2-jstest --list
    030000004c050000cc09000011810000
    030000004c050000c405000011810000
  */
  environment.variables.SDL_GAMECONTROLLERCONFIG = "030000004c050000cc09000011810000,PS4 Controller,a:b0,b:b1,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b10,leftshoulder:b4,leftstick:b11,lefttrigger:a2,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b12,righttrigger:a5,rightx:a3,righty:a4,start:b9,x:b3,y:b2";


}
