@ECHO OFF
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "M:\ATMEL\PWM\RC01\labels.tmp" -fI -W+ie -C V2E -o "M:\ATMEL\PWM\RC01\RC01.hex" -d "M:\ATMEL\PWM\RC01\RC01.obj" -e "M:\ATMEL\PWM\RC01\RC01.eep" -m "M:\ATMEL\PWM\RC01\RC01.map" "M:\ATMEL\PWM\RC01\RC01.asm"
