//BASIC DEVICE SETUP//
function InitialiseScreen(screenHeight as integer, screenWidth as integer, title as string, colors as integer , rotate as integer, autoRefresh as integer)
	#option_explicit
	SetErrorMode(2)									// show all errors
	if screenWidth = 0 or screenHeight = 0			//If no size given, use full screen
		SetWindowSize(0,0,1) 						//else set size and title
	else
		SetWindowSize(screenWidth,screenHeight,0)
		SetWindowTitle(title)
	endif
	SetDisplayAspect(1.0*screenWidth/screenHeight)
		SetClearColor((colors),(colors),colors)
	SetOrientationAllowed(rotate,rotate,rotate,rotate)
	UseNewDefaultFonts(1) 							// since version 2.0.22 we can use nicer default fonts
	if autoRefresh= 1
		SetVSync(1)									//Vsync for desktop and laptops
	else
		SetVSync(0)
		SetSyncRate(35, 0) 							// 36fps instead of 60 to save battery on mobiles
	endif
	ClearScreen()
	//Template// InitialiseScreen(700,1300, "Window Name", 0, 1,1)
endfunction

//STARTUP FUNCTIONS//
function ShowSplashScreen(splashScreen as string)
	LoadImage(1,splashScreen)
	CreateSprite(1,1)
	SetSpriteSize(1,100,100)
	Sync()
endfunction

function HideSplashScreen(secsTilClose as integer)
	ResetTimer()
	while Timer() < secsTilClose and GetPointerPressed() = 0
		Sync()
	endwhile
	DeleteSprite(1)
	DeleteImage(1)
endfunction

//USER INPUT CONTROLS//
function GetMouseClickX()
	x as integer= 0
	if GetRawMouseLeftState()= 1
		x= GetRawMouseX()
		PrintC("X Pos: ")
		Print(x)
	endif
endfunction x

function GetMouseClickY()
	y as integer= 0
	if GetRawMouseLeftState()= 1
		y= GetRawMouseY()
		PrintC("Y Pos: ")
		Print(y)
	endif
endfunction y

Function GetSpriteClicked()	
	spriteClicked as integer= 0
	spriteClicked= GetSpriteHit(GetMouseClickX(), GetMouseClickY())	//Used for custom button click detection
endfunction spriteClicked
