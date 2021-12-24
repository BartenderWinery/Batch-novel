@echo off && call cls && title Visual Novel - Batch
if "%~1"=="" (
    call title Main - Visual Novel - Batch && echo Please select a novel story. && echo: && call :list && goto :input
) else if "%~1"=="console" (
    :con
        set /p rcon=">>>: "
        goto :con
)
:input
    set command=0
    set /p input=">>: "
    rem check for commands
        if %input%==console ( set command=1 && echo: && echo Opening console... && call :console )
    rem check for novel by name
        if %command%==0 (
            if exist %input% ( echo: && echo Found %input%; Loading...
                ) else ( echo: && echo No novel with the name: "%input%" was found! && echo Please make sure you have the novel file in the same directory as the batch file.)
        )
    goto input
:list
    call dir
    exit /b 0
:console
    start cmd /k novel.bat console