'' examples/manual/proguide/recursion/recursiveisevenodd.bas
''
'' NOTICE: This file is part of the FreeBASIC Compiler package and can't
''         be included in other distributions without authorization.
''
'' See Also: https://www.freebasic.net/wiki/wikka.php?wakka=ProPgRecursion
'' --------

Declare Function recursiveIsEven(ByVal n As Integer) As Boolean
Declare Function recursiveIsOdd(ByVal n As Integer) As Boolean

Function recursiveIsEven(ByVal n As Integer) As Boolean
	If n = 0 Then
		Return True
	Else
		Return recursiveIsOdd(n - 1)
	End If
End Function

Function recursiveIsOdd(ByVal n As Integer) As Boolean
 	If n = 0 Then
		Return False
	Else
		Return recursiveIsEven(n - 1)
	End If
End Function

Print recursiveIsEven(16), recursiveIsOdd(16)
Print recursiveIsEven(17), recursiveIsOdd(17)

Sleep
