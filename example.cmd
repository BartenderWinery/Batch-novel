@echo off && goto :frame_0

:frame_0
    set image=image_1.txt && call :image
    echo:
    echo You awake with a jolt, you see nothing. You can only hear the dripping sound of water somewhere in the room. 
    echo It dawns on you that this is a cave... How did you get here? Were you kidnapped in your sleep?
    echo:
    echo [1. Feel the walls. ] [2. Cry in dispare. ]
    call :talk
    if %select%==1 ( goto :frame_1 ) else ( set fate=You fell into dispare, you have accepted your fate. && goto :end )
    exit /b 0
:frame_1
    set image=image_2.txt && call :image
    echo:
    echo ...
    echo It's rock...
    echo:
    echo [1. Feel the walls for a way out. ] [2. Cry in dispare. ]
    call :talk
    if %select%==1 ( goto :frame_2 ) else ( set fate=Given up already? Alright... && goto :end )
    exit /b 0
:frame_2
    set image=image_3.txt && call :image
    echo:
    echo Your hand hit something, it felt sticky...
    echo:
    echo [1. Ignore it. ] [2. Grab it. ] [3. Lick it. ]
    call :talk
    if %select%==1 ( set fate=Your hand accidently touched the most poisonous frog in the world and you have succumbed to its posion. How convenient. && goto :end ) else if %select%==2 ( set fate=Idiot. && goto :end ) else ( set fate=Licking a poisonous frog... Idiot. && goto :end )
    exit /b 0
:end
    echo:
    echo You have met your fate: %fate%
    pause
    exit /b 0
:talk
    set /p select="Say: "
    exit /b 0
:image
    for /f "delims=: tokens=*" %%A in (%image%) do @echo %%A
    exit /b 0