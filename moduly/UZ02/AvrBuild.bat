@ECHO OFF
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "M:\ATMEL\Vozitko\UZ02\labels.tmp" -fI -W+ie -C V2E -o "M:\ATMEL\Vozitko\UZ02\UZ02.hex" -d "M:\ATMEL\Vozitko\UZ02\UZ02.obj" -e "M:\ATMEL\Vozitko\UZ02\UZ02.eep" -m "M:\ATMEL\Vozitko\UZ02\UZ02.map" "M:\ATMEL\Vozitko\UZ02\UZ02.asm"
