cd %~dsp0
:: nircmdc.exe savescreenshot "z-full_%date%_%time%.jpg"
del a.jpg
::nircmdc.exe savescreenshot "a.jpg" 25 494 311 172
nircmdc.exe savescreenshot "a.jpg" 14 579 190 96
copy /Y a.jpg "z-medal_%date%.jpg"