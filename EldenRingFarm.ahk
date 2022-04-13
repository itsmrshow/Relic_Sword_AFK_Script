; -= TIMINGS =-
; -------------

; -= OPTIMIZATIONS =-
; -------------------

#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input


; -= ACCURATE SLEEP =-
; --------------------

AccurateTimer(timeInMs)
{
    DllCall("QueryPerformanceFrequency", "Int64*", freq)
    DllCall("QueryPerformanceCounter", "Int64*", CounterBefore)
    DllCall("QueryPerformanceCounter", "Int64*", CounterAfter)
    while (((CounterAfter - CounterBefore) / freq * 1000) < timeInMs)
    {
        DllCall("QueryPerformanceCounter", "Int64*", CounterAfter)
    }
}



; -= SCRIPT =-
; ------------

F4 up::
  Loop 
{
    ; Move play forward
    Send, {w down}
    Send, {space down}
    AccurateTimer(160 * 1000 / 60)
    Send, {space up}
    Send, {w up}

    AccurateTimer(15 * 1000 / 60)

    ; Move player to the left
    Send, {a down}
    AccurateTimer(50 * 1000 / 60)
    Send, {a up}

    ; Move forward 
    Send, {w down}
    Send, {space down}
    AccurateTimer(69 * 1000 / 60)
    Send, {space up}
    Send, {w up}

    AccurateTimer(10 * 1000 / 60)

    ; send the fire
    AccurateTimer(10 * 1000 / 60)
    Send, {Shift down}
    Send, {RButton down}
    AccurateTimer(30 * 1000 / 60)
    Send, {Shift up}
    Send, {RButton up}
    AccurateTimer(420 * 1000 / 60)

    ; return to home

    Send, {g down}
    AccurateTimer(30 * 1000 / 60)
    Send, {g up}
    AccurateTimer(30 * 1000 / 60)
    Send, {s down}
    AccurateTimer(3 * 1000 / 60)
    Send, {s up}
    AccurateTimer(20 * 1000 / 60)w 
    Send, {e down}
    AccurateTimer(10 * 1000 / 60)
    Send, {e up}
    AccurateTimer(10 * 1000 / 60)
    Send, {e down}
    AccurateTimer(10 * 1000 / 60)
    Send, {e up}

    ; wait after complete
    AccurateTimer(300 * 1000 / 60) 
    if breakLoop = 1 
    {
        breakLoop = 0
        break
    }

}
return

F3 up::
breakLoop = 1 
return 