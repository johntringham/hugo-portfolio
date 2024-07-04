@echo off

set inp="%~f1"
set folder="%~dp1"
set newfile="%~dp1%~n1 - COMPRESSED HIGH480%~x1"

echo input file is %inp%
echo input file folder is %folder%
echo new file is %newfile%


echo
echo gunna run it now...

:: try2: - good quality, 2.5gb -> 1.8gb 
ffmpeg -i %inp% -ss 00:00:00 -t 00:00:15 -vf scale=-1:384 -c:v libx264 -crf 24 -preset slow -an %newfile%.mp4

echo "Done. New file is %newfile%"

call :setsize %newfile%

set /a reduction=%~z1-%size%
set /a reductionTimesOneHundred=100*%reduction%
set /a percentReduction=%reductionTimesOneHundred%/%~z1

echo reduction: %reduction%
echo reductionTimesOneHundred: %reductionTimesOneHundred%
echo percentReduction: %percentReduction%

echo new size is %size%, old size was %~z1

set /a newFileSizeKb=%size%/1024

echo .
echo New file is %newFileSizeKb%kb.
echo Reduced filesize by %percentReduction% percent.
echo .

set /p id="Done. New file is %newfile%"

:setsize
set size=%~z1
goto :eof

