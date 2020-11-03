

#define VARIANT_NOASSIGNMENT
#include once "variant.bi"
#include once "intern.bi"

VAR_GEN_BOP( eqv, VarEqv, integer, I4 )
VAR_GEN_BOP( eqv, VarEqv, uinteger, UI4 )
VAR_GEN_BOP( eqv, VarEqv, longint, I8 )
VAR_GEN_BOP( eqv, VarEqv, ulongint, UI8 )

'':::::
operator eqv _
	( _
		byref lhs as VARIANT, _
		byref rhs as VARIANT _
	) as VARIANT
	
	dim as VARIANT_ res = any
	
	VarEqv( @lhs.var_, @rhs.var_, @res )
	
	return VARIANT( res, FALSE )
	
end operator

'':::::
operator eqv _
	( _
		byref lhs as VARIANT, _
		byref rhs as VARIANT_ _
	) as VARIANT
	
	dim as VARIANT_ res = any
	
	VarEqv( @lhs.var_, @rhs, @res )
	
	return VARIANT( res, FALSE )
	
end operator

