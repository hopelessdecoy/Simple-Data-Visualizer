// Author:	Paul Birkholtz
// Project: DataVisualizer 
// Created: 2018-01-17

#include "functions.agc"

InitialiseScreen(720,1300, "Data Visualizer", 0, 1,1)
LoadResources()

i as integer= 1
DatType as integer= 2
modfy as integer= 0

AddVirtualButton(1, 94, 9, 7)
SetVirtualButtonColor(1, 100,255,100)
SetVirtualButtonText(1, "CYCLE VALUES")
AddVirtualButton(2, 94, 23.5, 7)
SetVirtualButtonColor(2, 255,100,100)
SetVirtualButtonText(2, "RETURN TO TOP")

ReadFileData()
do
RequestKeyData()
RequestNumData(DatType)
SortData()

	CreateText(1000, GetStringToken(RecordsCatArr[0], ":", DatType))
	SetTextSize(1000, 5)
	SetTextPosition(1000, 0, 1)
	CreateSprite(2000, 6)
	setspriteSize(2000, 25, 0.5)
	SetSpritePosition(2000, 0.1, 5)

	visualizeDat()

	do
		if(GetRawKeyState(38)= 1)
			SetViewOffset(0, (GetViewOffsetY() - 1.8))
			if(GetViewOffsetY()< 0)
				SetViewOffset(0, 0)
			endif
		endif
		if(GetRawKeyState(40)= 1)
			SetViewOffset(0, (GetViewOffsetY() + 1.8))
		endif
		if(GetVirtualButtonReleased(2)= 1)
			SetViewOffset(0, 0)
		endif
		if(GetVirtualButtonReleased(1)= 1)
			datType= CycleDatTypes(datType)
			exit
		endif
		Sync()
	loop
	Sync()
loop
