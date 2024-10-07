// Made by SirRyu
// Version 0.01.02
// If you encounter any bugs with this autosplitter either
// reach out to me on the JC3-Speedrun Discord
// and/or create an Issue here: https://github.com/SirRyu99/Just-Cause-3-autosplitter/issues
// for reading print and general debugging: https://github.com/LiveSplit/LiveSplit.AutoSplitters/blob/master/README.md#debugging

state("JustCause3")
{
    int gameloading : 0x2D5AE50;
	int loading : 0x2F38848, 0x94;
	int strangeLoading : 0x02F39138, 0xA0, 0x178;
	int outposts : 0x02F36E30, 0x40, 0x0, 0x68, 0x0, 0x8; //change of number
	int mission : 0x02F188D0, 0x324; //1==true(in mission) 0==false(outside of mission)
	int challenge : 0x02F17E00, 0x820;
	int challangewheel : 0x02F387F0, 0x100, 0x10, 0x168, 0x14;
	int collectibles : "fmod_studio_F.dll", 0x004F2670, 0xA0, 0x18, 0x18, 0x28, 0x48, 0x28, 0x50, 0x10, 0x108; //first change of number then increase by 1 or 2
	int church : "fmod_studio_F.dll", 0x004F2670, 0x118, 0xAF4;
	int town : 0x02F163C8, 0x18, 0xC0, 0xE94; //2=true 1=false
	int resetRun : 0x2F17E9D; //not working
	int startRun : 0x02F2EFF0, 0x568; //not working

	float vertical : 0x02ED6FC0, 0x8C;
	float horizontal : 0x02ED6FC0, 0x88;
	float height : 0x2EF5398;

	// old town pointer 0x02F34280, 0x28, 0x70, 0x8, 0x28, 0x60, 0x18, 0x1238, 0x108;
	
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
	// And checks if outposts triggert right before it so it doesn't splitt twice
	if((old.town < current.town)&&(Environment.TickCount - vars.lastSplit > 5000)){
		print(" «[JC3 - Town: " + current.town + "]» ");
		vars.lastSplit = Environment.TickCount;
		return true;
	}
	
	// Checks if the player left a mission (by completing or exiting it)
	// And checks if outposts triggert right before it so it doesn't splitt twice
	if((old.mission > current.mission)&&(Environment.TickCount - vars.lastSplit > 5000)){
		print(" «[JC3 - Mission: " + current.mission + "]» ");
		vars.lastSplit = Environment.TickCount;
		return true;
	}
   
	if((0 < current.challenge)&&(current.challangewheel > old.challangewheel)){
		print(" «[JC3 - challenge: " + current.challenge + "]» ");
		return true;
	}

	//Checks if the player collects a tape, a part, a shrine or a tomb it doesn't check for Dardevil jumps
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
	//because when the game starts it spits out random values which would mess up everything
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

reset{
	if(current.horizontal > 46.74738310 && current.horizontal < 46.74738314 && current.height < 1342 && current.height > 1336 && current.vertical < -28 && current.vertical > -30){
		//print(" -------------------- JC3 reset " + current.vertical + " -------------------- ");
		//print(" -------------------- JC3 reset " + current.height + " -------------------- ");
		return true;
	}
}

start{
	if(46.851111 > current.horizontal && current.horizontal > 46.46326981 && current.vertical < -28.7 && current.vertical > -29 && current.height > 1340.281128 && current.height < 1341 && 0 < current.mission){
		print(" -------------------- JC3 start " + current.vertical + " -------------------- ");
		print(" -------------------- JC3 start " + current.height + " -------------------- ");
		print(" -------------------- JC3 start " + current.horizontal + " -------------------- ");
		return true;
	}	
	
}

isLoading{
	//print(" -------------------- JC3 " + Environment.TickCount + " -------------------- ");
	if((current.gameloading == 5000)&&(current.loading != 1)&&(current.strangeLoading != 3)){
		return false;
	}	
    else{
		return true;
	}
}
