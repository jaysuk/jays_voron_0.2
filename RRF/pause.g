; pause.g
; called when a print from SD card is paused
;
; generated by RepRapFirmware Configuration Tool v3.3.0-LPC-STM32+05 on Sat Sep 25 2021 10:00:13 GMT+0100 (British Summer Time)
M83            ; relative extruder moves
G1 E-10 F3600  ; retract 10mm of filament
G91            ; relative positioning
G1 Z5 F360     ; lift Z by 5mm
G90            ; absolute positioning
G1 X10 Y10 F6000 ; go to X=0 Y=0

