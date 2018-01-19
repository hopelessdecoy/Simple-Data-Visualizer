#include "window.agc"

Global recordsCatArr as string[1]
Global totDat as String[500]
Global strDat as String[500]
Global numDat as integer[500]


function LoadResources()
	LoadImage(1, "1.jpg")
	LoadImage(2, "2.jpg")
	LoadImage(3, "3.jpg")
	LoadImage(4, "4.jpg")
	LoadImage(5, "5.jpg")
	LoadImage(6, "line.jpg")
endfunction

function ReadFileData()
	i as integer= 0
	
	SetFolder("/data")
	OpenToRead(1, "data.txt")
	recordsCatArr[0]= ReadLine(1)
	
	while(FileEOF(1) = 0)
		totDat[i]= ReadLine(1)
		i= i+ 1
	endwhile
	CloseFile(1)
endfunction

function RequestKeyData()
	i as integer= 0
	
	while(i< totDat.length)
		strDat[i]= GetStringToken(totDat[i], ":", 1)
		i= i+ 1
	endwhile
endfunction

function RequestNumData(datType as integer)
	i as integer= 0
	
	while(i< strDat.length)
		if(FindString(GetStringToken(totDat[i], ":", datType), "-")> 0)
			numDat[i]= (Val(GetStringToken(totDat[i], ":", datType)))
		else
			numDat[i]= Val(GetStringToken(totDat[i], ":", datType))
		endif
		i= i+ 1
	endwhile
endfunction



function SortData()
	i as integer
	i= numDat.length
	j as integer= 0
	temp as integer
	tempS as string

	//Bubble Sort
	while(i> 0)
		j= 0
		while(j< i- 1)
			if(numDat[j] < numDat[j+ 1])
				temp= numDat[j+ 1]
				numDat[j+ 1]= numDat[j]
				numDat[j]= temp
				
				tempS= strDat[j+ 1]
				strDat[j+ 1]= strDat[j]
				strDat[j]= tempS
			endif
			j= j+ 1
		endwhile
		i= i- 1
	endwhile
endfunction


function visualizeDat()
	i as integer= 1
	y as integer= 1
	
	while(i< totDat.length)
		CreateText(i, strDat[i-1] + ": "+ str(numdat[i-1]))
		SetTextSize(i, 7)
		SetTextPosition(i, 0, (7*i)+1)

		i= i+ 1
	endwhile
	
	i= 1
	while(i< totDat.length)
		if(numDat[i- 1]< 0)
			CreateSprite(i, y)
			SetSpriteOffset(i, 100, 0)
			SetSpriteSize(i, ((ValFloat(str(numDat[i-1]))/ValFloat(str(numDat[0])))*65), 7)
			SetSpritePositionByOffset(i, 0, (7*i)+1)
		else
			CreateSprite(i, y)
			SetSpriteSize(i, ((ValFloat(str(numDat[i-1]))/ValFloat(str(numDat[0])))*65), 7)
			SetSpritePosition(i, 0, (7*i)+1)
		endif
		
		i= i+ 1
		y= y+ 1
		if(y> 5)
			y= 1
		endif
	endwhile
endfunction

function CycleDatTypes(prev as integer)
	setting as integer
	setting= prev
	
	DeleteAllSprites()
	DeleteAllText()
	if(prev>= CountStringTokens(recordsCatArr[0], ":"))
		setting= 2
	else
		setting= setting+ 1
	endif
	
endfunction setting
