@echo off && mode con: cols=120 lines=25 && call cls && title Visual Novel - Batch
if "%~1"=="" (
    echo ==---=Max novel size=-------------------------------------------------------------------------------------------------==
    echo Please select a novel story. && echo: && call :list && goto :input
) else if "%~1"=="console" (
    goto :con
    exit /b 0
) else if "%~1"=="load" (
    goto :load
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
            if exist %input%.cmd ( goto :load )
            if exist %input%.novel ( echo: && echo Found %input%; Loading... && call :load
                ) else ( echo: && echo No novel with the name: "%input%" was found! && echo Please make sure you have the novel file in the same directory as the batch file.)
            )
    goto input
:list
    for %%l in (*.novel) do (
        echo %%l
    )
    for %%l in (*.cmd) do (
        echo %%l
    )
    exit /b 0
:console
    start cmd /k novel.bat console
    exit /b 0
:con
    echo ==--------------------------------------------------------------------------------------------------------------------==
    set /p rcon=">>>: "
    rem check for commands
        if %rcon%==init ( echo Spawning new window... && start cmd /k novel.bat )
        if %rcon%==cls ( call cls )
        if %rcon%==exit ( call exit )
        if %rcon%==restore ( echo Restoring CMD files back to .novel... && type %input%.cmd >> %input%.novel && del %input%.cmd )
    goto :con
:load
    echo ==--------------------------------------------------------------------------------------------------------------------==
    set line=0
    if not exist %input%.cmd ( if exist %input%.novel ( type %input%.novel >> %input%.cmd && del %input%.novel ) ) else ( echo Ignored %input%.novel; running cmd file instead. && echo: )
    call %input%.cmd
    set /p text="Say: "
    goto :load
