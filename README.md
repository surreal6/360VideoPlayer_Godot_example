# Godot 360 video player

This is an example project showing how to reproduce 360 videos with an HMD. This only accept .ogv files as this is the codec accepted in Godot base code.

It features a modified version of the viewport_2d_in_3d node, using an spherical mesh instead of a flat one.

![a 360 video playing in the environment sky](sample_360_video.gif)
![a 360 video playing in a flat surface](sample_flat_video.gif)

# File dialog in XR

This project uses the filedialog node from godot to navigate and select folders, but there is no current implementation for double click in a dialog in the current XR-Tools version. To run this project you need to install an alternative branch for XR Tools, until PR is accepted.

[https://github.com/GodotVR/godot-xr-tools/pull/558](https://github.com/GodotVR/godot-xr-tools/pull/558)

# How to Install

This project is made in Godot 4.3

Clone this repo as usual and before open it in godot, open a terminal an run the following commands.

    mkdir addons
    cd addons
    git clone https://github.com/surreal6/godot-xr-tools.git --branch pointer-doubleclick godot-xr-tools-surreal
    cp -r godot-xr-tools-surreal/addons/godot-xr-tools ./godot-xr-tools
    rm -r godot-xr-tools-surreal