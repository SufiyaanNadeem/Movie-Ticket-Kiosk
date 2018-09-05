%Background
Draw.FillBox(0,maxy,maxx,0,red) 

%Welcome Black Back
Draw.Box (0,maxy, maxx, 285,black)
Draw.Fill (30,350, yellow,black)

%Welcome Font
var intfont:int
intfont:= Font.New("Arial:40:bold")
Font.Draw("Welcome to the ComPlex", 5,350, intfont,black)
Font.Draw("Movie Ticket Kiosk", 80,295, intfont,black)

%Movies-Dislay
	var picID: int
	picID := Pic.FileNew ("movies.bmp")
	    Pic.Draw (picID, 20, 95, picCopy)
	Pic.Free (picID)

%Book a Ticket- Box
Draw.Box (140,85, 503, 15,black)
Draw.Fill(190,80,yellow,black)
%Book a Ticket- Text
var intfont2:int
intfont2:= Font.New("Arial:40:bold")
Font.Draw("Book a Ticket", 150,30, intfont2,black)

%Transition to Choosing a movie
Mouse.ButtonChoose ("multibutton")
var x,y,button:int
loop
    Mouse.Where (x,y,button)
	if button=1 and x>140 and x<593 and y>15 and y<85 then 
	    cls
	    exit 
	end if
end loop

%Choose a Movie-TITLE
    Draw.FillBox(0,maxy,maxx,0,red) 
    Draw.Box (0,maxy, maxx, 340,black)
    Draw.Fill (30,350, yellow,black)
    Font.Draw("Movies and Tickets", 80,350, intfont,black)
%How many movies would you like?
    var intfont3:int
    intfont3:= Font.New("Arial:28:bold")
    Draw.Box (0,140, maxx, 90,black)
    Draw.Fill (30,110, yellow,black)
    Font.Draw("Choose your Movie and Ticket(s)",30,105,intfont3,black)

%Ticket-Clicker Template-Box
Draw.ThickLine(360,80,360,10,3,white)
Draw.ThickLine(460,80,460,10,3,white)
Draw.ThickLine(360,80,460,80,3,white)
Draw.ThickLine(460,10,360,10,3,white)
Draw.Fill(365,40,purple,white)

%Ticket-Clicker Template-Circle
Draw.Oval(320,45,29,29,white)
Draw.Oval(500,45,29,29,white)
Draw.Oval(320,45,28,28,white)
Draw.Oval(500,45,28,28,white)
Draw.Fill(320,45,purple,white)
Draw.Fill(500,45,purple,white)

%Plus and Minus
var intfont4:int
intfont4:= Font.New("Arial:65:bold")
Font.Draw("-", 304,24,intfont4 ,white)
Font.Draw("+", 475,15,intfont4 ,white)

%Movies-Dislay
    picID := Pic.FileNew ("movies.bmp")
    Pic.Draw (picID, 20, 150, picCopy)
    Pic.Free (picID)
%TICKET-Selector
var ticnum:int
ticnum:=1
Font.Draw(intstr(ticnum),387,15,intfont4,white)

%Get Movie option
var intfont5:int
intfont5:= Font.New("Arial:18:bold")
    Font.Draw("I want to watch (1 word):",10,65,intfont5,white)
    Draw.ThickLine(9,52,9,28,3,white)
    Draw.ThickLine(9,52,250,52,3,white)
    Draw.ThickLine(9,28,250,28,3,white)
    Draw.ThickLine(250,52,250,28,3,white)
    locatexy (20,40)
	Draw.Fill(30,40,purple,white)
    var movie:string
    get movie:*
%Next Page Button
Draw.Oval(580,45,29,29,black)
Draw.Fill(580,45,yellow,black)
Draw.ThickLine(560,45,600,45,15,black)
Draw.ThickLine(580,60,600,45,15,black)
Draw.ThickLine(580,30,600,45,15,black)
	%If Left Button then ticnum +1
	Mouse.ButtonChoose ("multibutton")
var x1,y1,b:int
var xt,yt:int
xt:=387
yt:=15
	      
loop
    Mouse.Where (x1,y1,b)
	if b=1 and x1>460 and x1<520 and y1>20 and y1<80 then
	delay(50)        
	ticnum:= ticnum+1
		Draw.FillBox(362,78,458,12,purple)
		    if ticnum>9 then
		    xt:=360
		    else 
		    xt:=387
		    end if 
		    Font.Draw(intstr(ticnum),xt,yt,intfont4,white)
	%-1
	elsif b=1 and x1>290 and x1<350 and y1>20 and y1<80 then
	delay(100)        
	ticnum:= ticnum-1
		Draw.FillBox(362,78,458,12,purple)
		    if ticnum>9 then
		    xt:=360
		    else 
		    xt:=387
		    end if 
		    delay(1)
		Font.Draw(intstr(ticnum),xt,yt,intfont4,white)
	end if
	delay(100)
	exit when b=1 and x1>550 and x1<610 and y>15 and y<75 or ticnum<1
end loop

%If number of tickets is less than 1 and more than 20
if ticnum<1 or ticnum>20 then
cls
delay(100)
put "Invaid input.. Number of tickets has to be more than 0 and less than 21"
delay(10000)
end if
%Select Your Zone page
    Draw.FillBox(0,maxy,maxx,0,red) 
    Draw.Box (0,maxy, maxx, 340,black)
    Draw.Fill (30,350, yellow,black)
    Font.Draw("Select Your Zone", 80,350, intfont,black)
%Zone Display
	var picID1: int
	picID1 := Pic.FileNew ("Theatre.jpg")
	    Pic.Draw (picID1, 20, 60, picCopy)
	Pic.Free (picID1)
%Zone-Display
var intfont6:int
intfont6:= Font.New("Arial:18:bold")
    Font.Draw("Zone A: $5",20,40,intfont6,white)
    Font.Draw("Zone B: $3",20,22,intfont6,white)
    Font.Draw("Zone C: $1",20,2,intfont6,white)

%Receipt
%Total Panel
Draw.FillBox (320,330,maxx,60,grey)
Font.Draw("Total Cost ($)",370,290,intfont3,black)
%Declaring Costs for Tickets
var ticost:int
ticost:= 12
var totaltic:int
totaltic:=ticost*ticnum

%Ticket Part
Font.Draw(intstr(ticnum),330,250,intfont6,black)
Font.Draw("Movie Ticket(s)",360,250,intfont6,black)
Font.Draw(intstr(totaltic),570,250,intfont6,black)
%Zone Part
Font.Draw("Zone ",390,220,intfont6,black)

%Zone Asker
var zone:string
Font.Draw("I Choose Zone:",160,40,intfont6,white)
    locatexy (160,18)
get zone
%Declaring Costs for Zones
var zonecost:int
    if zone="A" then
    zonecost:=5
    elsif zone="B" then
    zonecost:=3
    elsif zone="C" then
    zonecost:=1
    else put "Invalid input... Please enter A , B , or C next time."   
    end if
%Zone receipt
Font.Draw(zone,460,220,intfont6,black)
Font.Draw(intstr(zonecost),580,220,intfont6,black)

%Moving on to Popcorn Selector
%Next Page Button Background
Draw.Oval(580,45,29,29,black)
Draw.Fill(580,45,yellow,black)
Draw.ThickLine(560,45,600,45,15,black)
Draw.ThickLine(580,60,600,45,15,black)
Draw.ThickLine(580,30,600,45,15,black)
%Button
var x3,y3,button3:int
Mouse.ButtonChoose ("multibutton")
loop
    Mouse.Where (x3,y3,button3)
    if button3=1 and x3>550 and x3<610 and y3>15 and y3<75 then 
    exit
    end if 
    delay(50)
    end loop

%Popcorn Selection TITLE
    Draw.FillBox(0,maxy,maxx,0,red)
    Draw.Box (0,maxy, maxx, 340,black)
    Draw.Fill (30,350, yellow,black)
    Font.Draw("Popcorn Selection", 80,350, intfont,black)
%Total Panel
Draw.FillBox (320,330,maxx,60,grey)
Font.Draw("Total Cost ($)",370,290,intfont3,black)
%Ticket(s) Part of Receipt
Font.Draw(intstr(ticnum),330,250,intfont6,black)
Font.Draw("Movie Ticket(s)",360,250,intfont6,black)
Font.Draw(intstr(totaltic),570,250,intfont6,black)
%Zone receipt
Font.Draw("Zone ",390,220,intfont6,black)
Font.Draw(zone,460,220,intfont6,black)
Font.Draw(intstr(zonecost),580,220,intfont6,black)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Bags of Popcorn?
Font.Draw("Bags of Popcorn",50,300,intfont5,white)
%Bags with Butter?
Font.Draw("Bags with Butter",50,110,intfont5,white)
%Popcorn-Clicker Template-Box
Draw.ThickLine(90,280,90,210,3,white)
Draw.ThickLine(190,280,190,210,3,white)
Draw.ThickLine(90,280,190,280,3,white)
Draw.ThickLine(190,210,90,210,3,white)
Draw.Fill(110,240,purple,white)

%Popcorn-Clicker Template-Circle
Draw.Oval(50,245,29,29,white)
Draw.Oval(230,245,29,29,white)
Draw.Oval(50,245,28,28,white)
Draw.Oval(230,245,28,28,white)
Draw.Fill(50,245,purple,white)
Draw.Fill(230,245,purple,white)

%Plus and Minus
intfont4:= Font.New("Arial:65:bold")
Font.Draw("-", 34,225,intfont4 ,white)
Font.Draw("+", 205,215,intfont4 ,white)
%Popcorn Butter-Clicker Template-Box
Draw.ThickLine(90,90,90,20,3,white)
Draw.ThickLine(190,90,190,20,3,white)
Draw.ThickLine(90,90,190,90,3,white)
Draw.ThickLine(190,20,90,20,3,white)
Draw.Fill(110,50,purple,white)

%Popcorn Butter-Clicker Template-Circle
Draw.Oval(50,55,29,29,white)
Draw.Oval(230,55,29,29,white)
Draw.Oval(50,55,28,28,white)
Draw.Oval(230,55,28,28,white)
Draw.Fill(50,55,purple,white)
Draw.Fill(230,55,purple,white)

%Plus and Minus
Font.Draw("-", 34,35,intfont4 ,white)
Font.Draw("+", 205,25,intfont4 ,white)

%Popcorn to Butter Selector
Draw.Oval(140,165,30,30,black)
Draw.Oval(140,165,29,29,black)
Draw.Fill(140,165,yellow,black)
Draw.ThickLine(140,185,140,145,11,black)
Draw.ThickLine(140,145,155, 155,11,black)
Draw.ThickLine(140,145,125, 155,11,black)


%Proceed to Checkout-BOX
Draw.ThickLine(320,57,637, 57, 3,black)
Draw.ThickLine(320,57,320, 0, 3,black)
Draw.ThickLine(320,1,maxx, 1, 3,black)
Draw.ThickLine(637,0,637, 57, 3,black)
Draw.Fill(350,40,yellow,black)

%Proceed to Checkout-TEXT
Font.Draw("Proceed to Checkout",342,20,intfont5,black)

%Popcorn Butter amount selector
var butnum:int
butnum:=0
Font.Draw(intstr(butnum),116,25,intfont4,white)

%Popcorn amount selector
var popnum:int
popnum:=0
Font.Draw(intstr(popnum),116,215,intfont4,white)

%Initial Popcorn Price Coverup
Font.Draw("0",570,170,intfont6,black)

%Popcorn Part of Reciept
Font.Draw(intstr(popnum),330,170,intfont6,black)
Font.Draw("Bags of Popcorn",360,170,intfont6,black)
%If Left Button then popnum +1
	Mouse.ButtonChoose ("multibutton")
var x4,y4,b4:int
var xt2,yt2:int
xt2:=116
yt2:=215
	      
loop
    Mouse.Where (x4,y4,b4)
	if b4=1 and x4>180 and x4<260 and y4>210 and y4<280 then
	delay(50)     
	   
	popnum:= popnum+1
		Draw.FillBox(93,277,187,213,purple)
		Draw.FillBox(320,190,350,160,grey)
		    if popnum>9 then
		    xt2:=89
		    else 
		    xt2:=116
		    end if
		    delay (1)
		    Font.Draw(intstr(popnum),xt2,yt2,intfont4,white)
		    Font.Draw(intstr(popnum),330,170,intfont6,black)
		    Draw.FillBox(350,190,560,160,grey)
		    Font.Draw("Bags of Popcorn",360,170,intfont6,black)
		    var totalpop: int:= popnum*6%%%%%Declaring Cost of Popcorn
		    Draw.FillBox(550,200,620,160,grey)
		    Font.Draw(intstr(totalpop),570,170,intfont6,black)
	%-1
	elsif b4=1 and x4>20 and x4<80 and y4>210 and y4<280 then
	delay(100)        
	popnum:= popnum-1
		Draw.FillBox(93,277,187,213,purple)
		Draw.FillBox(320,190,350,160,grey)
		    if popnum>9 then
		    xt2:=89
		    else 
		    xt2:=116
		    end if 
		    Font.Draw(intstr(popnum),xt2,yt2,intfont4,white)
		    Font.Draw(intstr(popnum),330,170,intfont6,black)
		    Draw.FillBox(350,190,560,160,grey)
		    Font.Draw("Bags of Popcorn",360,170,intfont6,black)
		    var totalpop: int:= popnum*6%%%%%Declaring Cost of Popcorn
		    Draw.FillBox(560,200,600,160,grey)
		    Font.Draw(intstr(totalpop),570,170,intfont6,black)
	elsif b4=1 and x4>110 and x4<170 and y4>135 and y4<195 then
		    var totalpop: int:= popnum*6%%%%%Declaring Cost of Popcorn
		    Font.Draw(intstr(popnum),330,170,intfont6,black)
		    Font.Draw(intstr(totalpop),570,170,intfont6,black)
	elsif popnum<0 then
		    cls
		    delay(100)
		    put "Invaid input.. Number of Popcorn Bags has to be Positive"
		    delay(10000)
	end if
delay(100)
exit when b4=1 and x4>110 and x4<170 and y4>135 and y4<195
end loop
%Positive Popcorn Bags

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%If Left Button then butnum +1
	Mouse.ButtonChoose ("multibutton")
var x5,y5,b5:int
var xt3,yt3:int
xt3:=116
yt3:=25
	      
loop
    Mouse.Where (x5,y5,b5)
	if b5=1 and x5>180 and x5<260 and y5>20 and y5<90 then
	delay(50)        
	butnum:= butnum+1
		Draw.FillBox(93,87,187,23,purple)
		    Draw.FillBox(350,160,380,120,grey)
		    if butnum>9 then
		    xt3:=89
		    else 
		    xt3:=116
		    end if 
		    delay (1)
		    Font.Draw(intstr(butnum),xt3,yt3,intfont4,white)
		    Font.Draw(intstr(butnum),360, 140,intfont6,black)
		    Draw.FillBox(380,160,490,130,grey)
		    Font.Draw("w/Butter ",390,140,intfont6,black)
		    Draw.FillBox(560,165,620,120,grey)
		    Font.Draw(intstr(butnum),580,140,intfont6,black)%%%Butter is one dollar so no need to delcare variable
	%-1
	elsif b5=1 and x5>20 and x5<80 and y5>20 and y5<90 then
	delay(100)        
	butnum:= butnum-1
		Draw.FillBox(93,87,187,23,purple)
		    Draw.FillBox(350,160,380,120,grey)
		    if butnum>9 then
		    xt3:=89
		    else 
		    xt3:=116
		    end if 
		    Font.Draw(intstr(butnum),xt3,yt3,intfont4,black)
		    Font.Draw(intstr(butnum),360, 140,intfont6,white)
		    Draw.FillBox(380,160,490,130,grey)
		    Font.Draw("w/Butter ",390,140,intfont6,black)
		    Draw.FillBox(560,165,620,120,grey)
		    Font.Draw(intstr(butnum),580,140,intfont6,black)%%%Butter is one dollar so no need to delcare variable
	
	elsif b5=1 and x5>320 and x5<640 and y5>0 and y5<60 then
		    Font.Draw(intstr(butnum),360,140,intfont6,black)
		    Font.Draw("w/Butter ",390,140,intfont6,black)
	end if
	delay(100)
	exit when b5=1 and x5>320 and x5<640 and y5>0 and y5<60 or popnum<butnum
	end loop
	
%Transition to Checkout
if popnum<butnum then
    cls
    delay(1000)
    put "Invalid input.. Please make sure that Bags with Butter are less than Bags of Popcorn."
    delay(10000)
elsif butnum<0 then
	cls
	delay(1000)
	put "Invaid input.. Number of Popcorn Bags with Butter has to be Positive"
	delay(100000)
else 
    Draw.FillBox(0,maxy,maxx,0,red)
end if

%Checkout-TTTLE
    Draw.Box (0,maxy, maxx, 340,black)
    Draw.Fill (30,350, yellow,black)
    Font.Draw("Checkout", 190,350, intfont,black)

%Total Panel
Draw.FillBox (320,330,maxx,60,grey)
Font.Draw("Total Cost ($)",370,290,intfont3,black)
%Ticket(s) Receipt
Font.Draw(intstr(ticnum),330,250,intfont6,black)
Font.Draw("Movie Ticket(s)",360,250,intfont6,black)
Font.Draw(intstr(totaltic),570,250,intfont6,black)
%Zone receipt
Font.Draw("Zone ",390,220,intfont6,black)
Font.Draw(zone,460,220,intfont6,black)
Font.Draw(intstr(zonecost),580,220,intfont6,black)
%Popcorn Receipt
var totalpop: int:= popnum*6%%%%%Declaring Cost of Popcorn
Font.Draw(intstr(popnum),330,170,intfont6,black)
Font.Draw("Bags of Popcorn",360,170,intfont6,black)
Font.Draw(intstr(totalpop),570,170,intfont6,black)
%Butter Reciept
Font.Draw("w/Butter ",390,140,intfont6,black)
Draw.FillBox(550,165,620,120,grey)
Font.Draw(intstr(butnum),580,140,intfont6,black)
%Tax Receipt
var totalcost:int:= totaltic+zonecost+butnum+totalpop
var TotalwithHST:real:=totalcost*.13+totalcost

%Box for Total Put
locatexy(327,80)
put "Your Total Cost is $", TotalwithHST:0:2," including HST"
Draw.Box(320,80,637,95,black)

%Ending Notes
%Tap Card
Font.Draw("Tap your card on the",27,315,intfont5,white)
Font.Draw("Kiosk to Print Tickets",25,285,intfont5,white)
var picID2: int
picID2 := Pic.FileNew ("tap.jpg")
Pic.Draw (picID2, 20, 20, picCopy)
Pic.Free (picID2)

%Enjoy Your Movie
loop
Mouse.ButtonChoose ("multibutton")
var x6,y6,b6:int
    Mouse.Where (x6,y6,b6)
if b6=1 and x6>20 and x6<280 and y6>20 and y6<275 then
    Draw.FillBox (0,maxy, maxx, 0,red)
    Font.Draw("Enjoy Your Movie!",105,200,intfont,white)
    exit
end if
end loop
