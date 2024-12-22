// Made by SirRyu
// Version 0.01.04
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

	int town : 0x02F34280, 0x28, 0x70, 0x8, 0x28, 0x60, 0x18, 0x1238, 0x108; //3=true 0=false
	int gamestate : 0x02F38820 , 0x184; //6==Endcard Liberatet Card 5==Menu 4==FirstMission 3==Challange 2==Loading 1==Cutcene 0==Freeroam


	float vertical : 0x02ED6FC0, 0x8C;
	float horizontal : 0x02ED6FC0, 0x88;
	float height : 0x2EF5398;

	// maybe new town pointer 0x02F163C8, 0x18, 0xC0, 0xE94;
	
}

startup{
	print(" -------------------- JC3 Autosplitter starting -------------------- ");
}

split{

    if(Environment.TickCount - vars.gameStart > 10000){

        if(vars.firststarted){
            print(" -------------------- JC3 Splitter Active -------------------- ");
            vars.firststarted = false;
        }

        float verticalshort = (float)Math.Truncate((current.vertical+2000)*100);
        float horizontalshort = (float)Math.Truncate((current.horizontal+2000)*100);
        float heightshort = (float)Math.Truncate(current.height);

        float toleranceVertical = 5;
        float toleranceHorizontal = 5;
        float toleranceHeight = 5;


        // checks if outposts triggert right before it so it doesn't splitt twice
        if(current.gamestate == 1 && old.gamestate != current.gamestate && ((Environment.TickCount - vars.lastSplit) > 5000)){


            print(" JC3 - Town: ");
            print(" ------ JC3 vertical " + verticalshort + " ------ ");
            print(" ------ JC3 horizontal " + horizontalshort + " ------ ");
            print(" ------ JC3 height " + heightshort + " ------ ");

            if(Math.Abs(verticalshort - 196913) <= toleranceVertical && Math.Abs(horizontalshort - 205049) <= toleranceHorizontal && Math.Abs(heightshort - 1131) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Manaea ");
                return true;
            }

            if(Math.Abs(verticalshort - 198189) <= toleranceVertical && Math.Abs(horizontalshort - 204526) <= toleranceHorizontal && Math.Abs(heightshort - 1138) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Surpicco ");
                return true;
            }

            if(Math.Abs(verticalshort - 198027) <= toleranceVertical && Math.Abs(horizontalshort - 200802) <= toleranceHorizontal && Math.Abs(heightshort - 1038) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Cinta ");
                return true;
            }

            if(Math.Abs(verticalshort - 199489) <= toleranceVertical && Math.Abs(horizontalshort - 200371) <= toleranceHorizontal && Math.Abs(heightshort - 1031) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Vico Spigola ");
                return true;
            }

            if(Math.Abs(verticalshort - 198941) <= toleranceVertical && Math.Abs(horizontalshort - 200516) <= toleranceHorizontal && Math.Abs(heightshort - 1112) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Soliana ");
                return true;
            }

            if(Math.Abs(verticalshort - 199078) <= toleranceVertical && Math.Abs(horizontalshort - 199834) <= toleranceHorizontal && Math.Abs(heightshort - 1134) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Vinialetta ");
                return true;
            }

            if(Math.Abs(verticalshort - 199592) <= toleranceVertical && Math.Abs(horizontalshort - 199644) <= toleranceHorizontal && Math.Abs(heightshort - 1033) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Vico Thunno ");
                return true;
            }

            if(Math.Abs(verticalshort - 199547) <= toleranceVertical && Math.Abs(horizontalshort - 205301) <= toleranceHorizontal && Math.Abs(heightshort - 1029) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Perla Est ");
                return true;
            }

            if(Math.Abs(verticalshort - 199171) <= toleranceVertical && Math.Abs(horizontalshort - 202231) <= toleranceHorizontal && Math.Abs(heightshort - 1189) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Agro Nove ");
                return true;
            }

            if(Math.Abs(verticalshort - 199333) <= toleranceVertical && Math.Abs(horizontalshort - 202468) <= toleranceHorizontal && Math.Abs(heightshort - 1168) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Argo ");
                return true;
            }

            if(Math.Abs(verticalshort - 199283) <= toleranceVertical && Math.Abs(horizontalshort - 203134) <= toleranceHorizontal && Math.Abs(heightshort - 1059) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Vista Fonte ");
                return true;
            }

            if(Math.Abs(verticalshort - 199240) <= toleranceVertical && Math.Abs(horizontalshort - 204077) <= toleranceHorizontal && Math.Abs(heightshort - 1054) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Bellevia ");
                return true;
            }

            if(Math.Abs(verticalshort - 199517) <= toleranceVertical && Math.Abs(horizontalshort - 201219) <= toleranceHorizontal && Math.Abs(heightshort - 1043) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Citate Di Ravello ");
                return true;
            }

            if(Math.Abs(verticalshort - 200380) <= toleranceVertical && Math.Abs(horizontalshort - 200996) <= toleranceHorizontal && Math.Abs(heightshort - 1238) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Burgoletto ");
                return true;
            }

            if(Math.Abs(verticalshort - 200684) <= toleranceVertical && Math.Abs(horizontalshort - 200502) <= toleranceHorizontal && Math.Abs(heightshort - 1033) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Celata ");
                return true;
            }

            if(Math.Abs(verticalshort - 200687) <= toleranceVertical && Math.Abs(horizontalshort - 199560) <= toleranceHorizontal && Math.Abs(heightshort - 1926) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Vista Dracon ");
                return true;
            }

            if(Math.Abs(verticalshort - 200089) <= toleranceVertical && Math.Abs(horizontalshort - 199542) <= toleranceHorizontal && Math.Abs(heightshort - 1038) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Nacre ");
                return true;
            }

            if(Math.Abs(verticalshort - 198349) <= toleranceVertical && Math.Abs(horizontalshort - 199409) <= toleranceHorizontal && Math.Abs(heightshort - 1030) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Vico Platessa ");
                return true;
            }

            if(Math.Abs(verticalshort - 198573) <= toleranceVertical && Math.Abs(horizontalshort - 199457) <= toleranceHorizontal && Math.Abs(heightshort - 1176) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Arco Sperania ");
                return true;
            }

            if(Math.Abs(verticalshort - 197840) <= toleranceVertical && Math.Abs(horizontalshort - 199380) <= toleranceHorizontal && Math.Abs(heightshort - 1126) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Ponere ");
                return true;
            }

            if(Math.Abs(verticalshort - 197691) <= toleranceVertical && Math.Abs(horizontalshort - 199437) <= toleranceHorizontal && Math.Abs(heightshort - 1028) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Vico Gamba ");
                return true;
            }

            if(Math.Abs(verticalshort - 197764) <= toleranceVertical && Math.Abs(horizontalshort - 199808) <= toleranceHorizontal && Math.Abs(heightshort - 1034) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Vico Maqurello ");
                return true;
            }

            if(Math.Abs(verticalshort - 197717) <= toleranceVertical && Math.Abs(horizontalshort - 200268) <= toleranceHorizontal && Math.Abs(heightshort - 1227) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Olivo Moro ");
                return true;
            }

            if(Math.Abs(verticalshort - 197573) <= toleranceVertical && Math.Abs(horizontalshort - 200320) <= toleranceHorizontal && Math.Abs(heightshort - 1035) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Vico Tructa ");
                return true;
            }

            if(Math.Abs(verticalshort - 198545) <= toleranceVertical && Math.Abs(horizontalshort - 203805) <= toleranceHorizontal && Math.Abs(heightshort - 1030) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Babica ");
                return true;
            }

            if(Math.Abs(verticalshort - 198185) <= toleranceVertical && Math.Abs(horizontalshort - 203267) <= toleranceHorizontal && Math.Abs(heightshort - 1075) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Alberto Pero ");
                return true;
            }

            if(Math.Abs(verticalshort - 197839) <= toleranceVertical && Math.Abs(horizontalshort - 203079) <= toleranceHorizontal && Math.Abs(heightshort - 1164) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Rondella ");
                return true;
            }

            if(Math.Abs(verticalshort - 197740) <= toleranceVertical && Math.Abs(horizontalshort - 203452) <= toleranceHorizontal && Math.Abs(heightshort - 1086) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Lantuina ");
                return true;
            }

            if(Math.Abs(verticalshort - 197040) <= toleranceVertical && Math.Abs(horizontalshort - 204501) <= toleranceHorizontal && Math.Abs(heightshort - 1266) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Fortalessa ");
                return true;
            }

            if(Math.Abs(verticalshort - 196824) <= toleranceVertical && Math.Abs(horizontalshort - 204060) <= toleranceHorizontal && Math.Abs(heightshort - 1239) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Alba ");
                return true;
            }

            if(Math.Abs(verticalshort - 196463) <= toleranceVertical && Math.Abs(horizontalshort - 203674) <= toleranceHorizontal && Math.Abs(heightshort - 1086) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town:  Colle Salrosa");
                return true;
            }

            if(Math.Abs(verticalshort - 195833) <= toleranceVertical && Math.Abs(horizontalshort - 203797) <= toleranceHorizontal && Math.Abs(heightshort - 1057) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Costa Del Porto ");
                return true;
            }

            if(Math.Abs(verticalshort - 195574) <= toleranceVertical && Math.Abs(horizontalshort - 203685) <= toleranceHorizontal && Math.Abs(heightshort - 1031) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Costa Di Ravello ");
                return true;
            }

            if(Math.Abs(verticalshort - 195311) <= toleranceVertical && Math.Abs(horizontalshort - 203670) <= toleranceHorizontal && Math.Abs(heightshort - 1044) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Laguna Del Sol ");
                return true;
            }

            if(Math.Abs(verticalshort - 195172) <= toleranceVertical && Math.Abs(horizontalshort - 203473) <= toleranceHorizontal && Math.Abs(heightshort - 1034) <= toleranceHeight){
                vars.lastSplit = Environment.TickCount;
                print(" JC3 - Town: Cirilla ");
                return true;
            }




            // Checks when the flag animation starts
            // Old way as it didnt work for everyone
            //if(old.town < current.town){
            //    print(" «[JC3 - Town: " + current.town + "]» ");
            //    vars.lastSplit = Environment.TickCount;
            //    return true;
            //    }
        }

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
}

exit{
	
	print(" -------------------- JC3 Exit Game -------------------- ");
	timer.IsGameTimePaused = true;
}

init{
	
	print(" -------------------- JC3 Starting Game -------------------- ");
	print(" -------------------- JC3 Splitter Inactive -------------------- ");
	vars.gameStart = Environment.TickCount;
	vars.startcount = 0;
	vars.lastSplit = Environment.TickCount;
	vars.firststarted = true;

	//if (timer.CurrentTime.RealTime < TimeSpan.FromSeconds(10)){
	//	timer.IsGameTimePaused = false;
	//}


}

update{
	//deactivates start reset isLoading and split for 10000 ticks
	//because when the game starts it spits out random values which would mess up everything
	if(current.gameloading != old.gameloading){
		print(" Game Loading ");
	}

	//if(Environment.TickCount - vars.gameStart < 10000){
	//	return false;
	//}

	//if((Environment.TickCount - vars.gameStart > 10000)&&(Environment.TickCount - vars.gameStart < 10100)){
	//	print(" -------------------- JC3 Autosplitter Active -------------------- ");
	//}
	

}

reset{
	// Reset condition based on specific horizontal, height, and vertical coordinates

	if(current.gamestate == 2 && current.horizontal > 46.74738310 && current.horizontal < 46.74738314 && current.height < 1342 && current.height > 1336 && current.vertical < -28 && current.vertical > -30){
		//print(" -------------------- JC3 reset " + current.vertical + " -------------------- ");
		//print(" -------------------- JC3 reset " + current.height + " -------------------- ");
		return true;
	}
}

start{
	// Start condition based on coordinates and mission status
	if(47 == Math.Truncate(current.horizontal) && Math.Truncate(current.vertical) == -28 && Math.Truncate(current.height) == 1340 && 0 < current.mission && current.gamestate == 1){
		print(" -------------------- JC3 start " + current.vertical + " -------------------- ");
		print(" -------------------- JC3 start " + current.height + " -------------------- ");
		print(" -------------------- JC3 start " + current.horizontal + " -------------------- ");
		return true;
	}	
	
}

isLoading{
	//print(" -------------------- JC3 " + Environment.TickCount + " -------------------- ");
	if((current.gameloading == 5000)&&(current.loading != 1)&&(current.strangeLoading != 3) && (current.gamestate != 2)){
		return false;
	}	
    	else{
		return true;
	}
}
