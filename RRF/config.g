; General preferences
G90                                            ; send absolute coordinates...
M83                                            ; ...but relative extruder moves
M669 K1                                        ; select CoreXY mode
M552 S1
M550 P"Voron02"
M451                                           ; added


; Drives
M569 P0 S0 D2                                  ; physical drive 0 goes forwards using TMC2209 driver timings
M569 P1 S0 D2                                  ; physical drive 1 goes forwards using TMC2209 driver timings
M569 P2 S0                                     ; physical drive 2 goes forwards using TMC2209 driver timings
M569 P3 S1                                     ; physical drive 3 goes forwards using TMC2209 driver timings
M584 X0 Y1 Z2 E3                               ; set drive mapping
M350 X32 Y32 Z32 E16 I0                        ; configure microstepping with interpolation
M92 X160.00 Y160.00 Z800.00 E606.56            ; set steps per mm 80, 80, 400, 732.39437 
M566 X342 Y342 Z100 E300                       ; set maximum instantaneous speed changes (mm/min)
M203 X30000.00 Y30000.00 Z600.00 E4800         ; set maximum speeds (mm/min)
M201 X15000.00 Y15000.00 Z500.00 E5000.00      ; set accelerations (mm/s^2)
M906 X1600 Y1600 Z800 E800 I30                 ; set motor currents (mA) and motor idle factor in per cent
M204 P900 T900
M84 S30                                        ; Set idle timeout

; Axis Limits
M208 X0 Y0 Z-1 S1                              ; set axis minima
M208 X120 Y120 Z117.98 S0                      ;  axis maxima

; Endstops
;M574 X2 S1 P"xstop"                            ; configure active-high endstop for low end on X via pin xstop
;M574 Y2 S1 P"ystop"                            ; configure active-high endstop for low end on Y via pin ystop was io0
M574 X2 S3
M574 Y2 S3
M574 Z2 S1 P"zstop"                            ; configure active-high endstop for low end on Y via pin ystop was io0

;M558 P0
M558 P8 C"^probe" H15 F120 T3000 A5
G31 P500 X-20.3 Y16.6 Z10 

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B3950 ; configure sensor 0 as thermistor on pin bedtemp was ADC0
M950 H0 C"bed" T0                              ; create bed heater output on bed and map it to sensor 0
M307 H0 B0 S1.00                               ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                        ; map heated bed to heater 0
M143 H0 S120                                   ; set temperature limit for heater 0 to 120C
M143 H0 S120                                   ; set temperature limit for heater 0 to 120C
M308 S1 P"e0temp" Y"PT1000"                    ; configure sensor 1 as thermistor on pin e0temp
M950 H1 C"e0heat" T1                           ; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 B0 S1.00                               ; disable bang-bang mode for heater  and set PWM limit
M143 H1 S300                                   ; set temperature limit for heater 1 to 280C

M308 S10 Y"mcu-temp" A"MCU"                    ; defines sensor 10 as MCU temperature sensor

; Fans
M950 F0 C"fan0" Q500                           ; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H-1                                 ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"fan1" Q500                           ; create fan 0 on pin fan0 and set its frequency +out1.tach
M106 P1 S2 H1 T45                              ; set fan 0 value. Thermostatic control is turned off
M950 F2 C"fan2" Q500                           ; create fan 0 on pin fan0 and set its frequency
M106 P2 S0 H-1                                 ; set fan 0 value. Thermostatic control is turned off
M950 F3 C"fan3" Q500                           ; create fan 0 on pin fan0 and set its frequency
M106 P3 S0 H-1                                 ; set fan 0 value. Thermostatic control is turned off
M950 F4 C"e1heat"                              ; create fan 0 on pin fan0 and set its frequency
M106 P4 S0 H-1                                 ; set fan 0 value. Thermostatic control is turned off

; Tools
M563 P0 D0 H1 F0                               ; define tool 0
G10 P0 X0 Y0 Z0                                ; set tool 0 axis offsets
G10 P0 R0 S0                                   ; set initial tool 0 active and standby temperatures to 0C

M207 S1.0 F2400 Z0.5

;M591 D0 P1 C"probe" S1

M572 D0 S0.03

;M955 P0 C"PA_4+PE_13" I65

M593 P"ei2" F84 

;#################### Globals ###########################
M98 P"globals.g"                                        ; initialize global variables

M501
T0

M950 C"servo0" E0 T1