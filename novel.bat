@echo off && mode con: cols=120 lines=25 && call cls && title Visual Novel - Batch && echo ==---=Max novel size=-------------------------------------------------------------------------------------------------==
if "%~1"=="" (
    echo Please select a novel story. && echo: && call :list && goto :input
) else if "%~1"=="console" (
    goto :con
    exit /b 0
) else if "%~1"=="load" (
    goto :load
    exit /b 0
) else (
    exit /b 0
)
:input
    set command=0
    set /p input=">>: "
    rem check for commands
        if %input%==console:: ( set command=1 && echo: && echo Opening console... && call :console )
        if %input%==exit:: ( set command=1 && echo: && echo Rate your experience on this project at: && echo https://github.com/BartenderWinery/Batch-novel && echo: && echo ==---=End script=-----------------------------------------------------------------------------------------------------== && timeout /t 3 /nobreak>nul && exit )
        if %input%==cls:: ( set command=1 && call cls )
        if %input%==ref:: ( set command=1 && echo Maximum arcii art: && echo: && echo ==---=Reference=------------------------------------------------------------------------------------------------------==)
    rem check for novel by name
        if %command%==0 (
            if exist %input% ( echo: && echo Found %input%; Loading... && call :load
                ) else ( echo: && echo No novel with the name: "%input%" was found! && echo Please make sure you have the novel file in the same directory as the batch file.)
        )
    goto input
:list
    call dir
    exit /b 0
:console
    start cmd /k novel.bat console
:con
    set asyc=0
    set /p rcon=">>>: "
    rem check for commands
        if %rcon%==init ( set asyc=1 && echo Spawning new window... && start cmd /k novel.bat )
        if %rcon%==cls ( set asyc=1 && call cls )
        if %rcon%==exit ( set asyc=1 && call exit )
    goto :con
:load
    set apec=0 && set name=You
    set /p text="You: "
    goto :load
