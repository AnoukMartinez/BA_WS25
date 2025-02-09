@echo off
setlocal

:: Define the file extensions to delete
set EXTENSIONS=*.aux *.lof *.log *.out *.toc *.pdf
set FILES_DELETED=0

for %%E in (%EXTENSIONS%) do (
    for %%F in (%%E) do (
        del "%%F" >nul 2>&1
        if exist "%%F" (
            echo Failed to delete: %%F
        ) else (
            echo Deleted: %%F
            set /A FILES_DELETED+=1
        )
    )
)

if %FILES_DELETED%==0 (
    echo No matching files found.
)

endlocal
