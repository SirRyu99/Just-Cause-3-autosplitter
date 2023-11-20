# JC3-Autosplitter and Load Remover

For some reason, I decided to create an autosplitter for Just Cause 3 (JC3). After about 100 hours of finding addresses, writing code, and testing the script, I'm ready to share it. The included load remover allows you to record your game time without loads and, in this new version, also stops running when the game is not active.

## How to set it up:

Either go to your splits in livesplit and just klick aktivate or if you want to download it manualy follow the steps below:

1. Copy the `JC3-LoadRemover` folder to your LiveSplit's "Components" folder.
2. Open LiveSplit and right-click on the timer.
3. Select "Edit Layout..."
4. Click on the plus sign to add a new component.
5. Choose "Control" and then select "Scriptable Auto Splitter."
6. Double-click on "Scriptable Auto Splitter" to open it.
7. Locate your JC3-LoadRemover script file (`JC3-LoadRemover.asl`) in the "Components" folder within LiveSplit.

These steps should enable the JC3-Autosplitter for you.

## Additional options:

- If you want to compare to game time, right-click on the timer and choose "Compare Against," then select "Real time."
- If you don’t want to use the autosplitter component and only want your load times removed, there is a box where you can check or uncheck that function.

## When does the autosplitter split:

- When you are exiting a mission, either by completing it or by quitting the mission via the menu.
- When you complete a challenge at the point where you see the gears wheel.
- When you complete a town and start the flag-hoisting animation.
- When you complete an outpost base or when discovering the rebel hideouts (currently there is one bug that I know of where it will split while you discover Sancte Esteban, more below).
- When you pick up a collectible, picking up any tape, rebel shrine, vintage part, and ancient tomb.

## When does the autosplitter not split:

- It doesn’t split when you complete a daredevil jump.
- If you kill Di Ravello or interact with the trigger at the end of the Sky Fortress DLC, you have to split manually because the autosplitter will split after you exit the mission.
- It does not split Mister Snowman or other secret/easter egg runs.
- When you start it, it takes 10 seconds before the splitting and the load remover become active. This is due to if you restart the game in 100%, the game spits out random values which would make the autosplitter split falsely.

## Currently known bugs:

- As mentioned before, the bug where it will split while you discover Sancte Esteban. That’s the monastery very close to the town Rondella. All other churches are disabled. Probably only interesting for 100% runs. I probably will not fix this, so you should include a split like “discovering Sancte Esteban” into your splits.

## On the to-do list (maybe):

- Including "autostart" and "autorestart."
- The possibility to disable some of the autosplit functions. For example, turning off splitting on collectibles.
