@ECHO OFF
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "M:\ATMEL\PWM01\labels.tmp" -fI -W+ie -C V2E -o "M:\ATMEL\PWM01\PWM01.hex" -d "M:\ATMEL\PWM01\PWM01.obj" -e "M:\ATMEL\PWM01\PWM01.eep" -m "M:\ATMEL\PWM01\PWM01.map" "M:\ATMEL\PWM01\PWM01.asm"
