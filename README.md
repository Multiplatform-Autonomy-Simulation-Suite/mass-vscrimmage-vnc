# mass-vscrimmage-vnc

## Overview
### vSCRIMMAGE-VNC
This repository contains a GUI-enabled image for running [SCRIMMAGE](https://github.com/gtri/scrimmage).  For scrimmage-related questions and issues, please see the [tutorials and documentation for SCRIMMAGE](http://scrimmagesim.org).  For issues and bugs pertaining to this docker deployment, please see the GitHub Issues page for [vSCRIMMAGE-VNC](https://github.com/Multiplatform-Autonomy-Simulation-Suite/mass-vscrimmage-vnc).

## Usage
### Running a GUI-enabled Container
First, from your terminal, run:
```
docker run -p 6901:6901 -d multiplatformautonomy/vscrimmage-vnc
```
Then, go to http://localhost:6901/?password=vncpassword from your favorite modern web browser.
If prompted for a password, use `vncpassword`.

You should now have access to a GUI container for running SCRIMMAGE.

### Run a Simple Mission from the GUI-enabled Container
Follow the instructions above to start a GUI-enabled container
Open a terminal using the menu in the top-left corner and type the command
```
scrimmage scrimmage/missions/straight.xml
```

You should see a visual interface appear.  Press the `h` button to see a list of key bindings to control SCRIMMAGE.  Press `b` to start the simulation.

## MASS
This repository and the accompanying docker image was prepared as part of [GTRI](https://gtri.gatech.edu)'s Multi-platform Autonomous Simulation Suite effort, sponsored by the Air Force Research Laboratory.

*The views and conclusions contained herein are those of the authors and should not be interpreted as necessarily representing the official policies or endorsements, either expressed or implied, of the Air Force Research Laboratory or the U.S. Government.*

*This material is based on research sponsored by the Air Force Research Laboratory under Subaward number FA8650-19-2-6983. The U.S. Government is authorized to reproduce and distribute reprints for Governmental purposes notwithstanding any copyright notation thereon.*
