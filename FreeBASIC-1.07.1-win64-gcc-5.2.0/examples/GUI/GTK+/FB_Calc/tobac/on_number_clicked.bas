' ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'< Signal handler generated by utility                       GladeToBac V3.0.1 >
'< Signal-Modul erzeugt von                                                    >
'< Generated at / Generierung am                             2011-09-15, 13:22 >
' -----------------------------------------------------------------------------
'< Main/Haupt Program name: FB_Calc.bas                                        >
'<  Email:  Thomas{ dot ]Freiherr[ AT ]gmx[ dot }net                           >
'<    WWW:  www.freebasic-portal.de                                            >
' -----------------------------------------------------------------------------
'< callback SUB/FUNCTION                                          insert code! >
'< Ereignis Unterprogramm/Funktion                        Quelltext einfuegen! >
' vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
SUB on_number_clicked CDECL ALIAS "on_number_clicked" ( _
  BYVAL button AS GtkButton PTR, _
  BYVAL user_data AS gpointer) EXPORT

WITH GUI

VAR disp = GTK_ENTRY(.EntDisplay)
VAR t = *gtk_entry_get_text(disp)
IF t = "0" ORELSE CLEAR_DISPLAY THEN t = ""

SELECT CASE G_OBJECT(button)
CASE .but0 : t &= "0"
CASE .but1 : t &= "1"
CASE .but2 : t &= "2"
CASE .but3 : t &= "3"
CASE .but4 : t &= "4"
CASE .but5 : t &= "5"
CASE .but6 : t &= "6"
CASE .but7 : t &= "7"
CASE .but8 : t &= "8"
CASE .but9 : t &= "9"
CASE .butD
  IF INSTR(t, D_SEP) = 0 THEN
    IF t = "" THEN t = "0" & D_SEP ELSE t &= D_SEP
  END IF
CASE .butPM
  IF LEFT(t, 1) = "-" THEN
    t = MID(t, 2)
  ELSE
    IF t = "" THEN t = "-0" ELSE t = "-" & t
  END IF
END SELECT

IF t = "" THEN t = "0"

gtk_entry_set_text(disp, t)
CLEAR_DISPLAY = 0

END WITH

END SUB
