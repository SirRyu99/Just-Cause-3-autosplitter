// Made by SirRyu
// If you encounter any bugs with this autosplitter (game time pausing or not pausing when it should) then
// Please reach out to me on the JC3-Speedrun Discord
// Please provide video footage to help reproduce the bugs

state("JustCause3")
{
    int gameloading : 0x2D5AE50;
	int loading : 0x2F38848, 0x94;
	int strangeLoading : 0x02F39138, 0xA0, 0x178;
	int outposts : 0x02F36E30, 0x40, 0x0, 0x68, 0x0, 0x8;
	int mission : 0x02F188D0, 0x324;
	int challange : 0x02F17E00, 0x820;
	int challangewheel : 0x02F387F0, 0x100, 0x10, 0x168, 0x14;
	int collectibles : "fmod_studio_F.dll", 0x004F2670, 0xA0, 0x18, 0x18, 0x28, 0x48, 0x28, 0x50, 0x10, 0x108;
	int church : "fmod_studio_F.dll", 0x004F2670, 0x118, 0xAF4;
	int town : 0x02F34280, 0x28, 0x70, 0x8, 0x28, 0x60, 0x18, 0x1238, 0x108;
	int resetRun : 0x2F17E9D;
	int startRun : 0x02F2EFF0, 0x568;
	
}

startup{
	print(" -------------------- JC3 Autosplitter starting -------------------- ");
}

split{
	
	// Checks if the value of outposts changes
	if(old.outposts != current.outposts){
		print(" «[JC3 - Outposts: " + current.outposts + "]» ");
		
		// Checks if the value of outposts changed because of a church and if so it prevents splitting
		if((current.church == 0)&&(Environment.TickCount - vars.lastSplit > 5000)){
			print(" «[JC3 - Church: " + current.church + "]» ");
			vars.lastSplit = Environment.TickCount;
			return true;
		}
	}
	
	// Checks when the flag animation starts
	// And checks if outposts triggert right befor it so it dosent splitt twice
	if((old.town < current.town)&&(Environment.TickCount - vars.lastSplit > 5000)){
		print(" «[JC3 - Town: " + current.town + "]» ");
		vars.lastSplit = Environment.TickCount;
		return true;
	}
	
	// Checks if the player left a mission (by completing or exeting it)
	// And checks if outposts triggert right befor it so it dosent splitt twice
	if((old.mission > current.mission)&&(Environment.TickCount - vars.lastSplit > 5000)){
		print(" «[JC3 - Mission: " + current.mission + "]» ");
		vars.lastSplit = Environment.TickCount;
		return true;
	}
   
	if((0 < current.challange)&&(current.challangewheel > old.challangewheel)){
		print(" «[JC3 - Challange: " + current.challange + "]» ");
		return true;
	}

	//Checks if the player collects a tape, a part, a shrine or an tomb it dosent check for Dardevil jumps
	//its an value that counts up (but a bit strange)
   if(old.collectibles != current.collectibles){
		print(" «[JC3 - Collectibles: " + current.collectibles + "]» ");
		return true;
   }
}

exit{
	
	print(" -------------------- JC3 Exit Game -------------------- ");
	timer.IsGameTimePaused = true;
}

init{
	
	print(" -------------------- JC3 Starting Game -------------------- ");
	print(" -------------------- JC3 Autosplitter Inactive -------------------- ");
	vars.gameStart = Environment.TickCount;
	vars.startcount = 0;
	vars.lastSplit = Environment.TickCount;
	vars.firststarted = true;

	if (timer.CurrentTime.RealTime < TimeSpan.FromSeconds(10))
	{
		timer.IsGameTimePaused = false;
	}
}

update{
	//deactivates start reset isLoading and split for 10000 ticks
	//because when the game starts it spits out random values wich would mess up everything
	if(current.gameloading != old.gameloading){
		print(" Game Loading ");
	}
	if(Environment.TickCount - vars.gameStart < 10000){
		return false;
	}
		if((Environment.TickCount - vars.gameStart > 10000)&&(Environment.TickCount - vars.gameStart < 10100)){
		print(" -------------------- JC3 Autosplitter Active -------------------- ");

	}

}

//reset{
//}

//start{
//}

isLoading{
	//print(" -------------------- JC3 " + Environment.TickCount + " -------------------- ");
	if((current.gameloading == 5000)&&(current.loading != 1)&&(current.strangeLoading != 3)){
		return false;
	}	
    else{
		return true;
	}
}