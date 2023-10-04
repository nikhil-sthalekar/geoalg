import math
from . import _settings

np = Python.import_module("numpy")




fn gamma(inout x: Float):
	if x <= 0:
		return math.nan # Gamma function is undefined for non-positive integers



fn exp(inout x: Float, inout max_order: Int):
	"""
	This implements the series expansion of :math:'\exp x' where:math:'x' is a multivector
	The parameter 'max_order' is the maximum order of the taylor series to use
	"""
	var result = 1.0 + 0.0*x
	if max_order == 0:
		return result

	# scale by power of 2 so that its norm is < 1
    var max_val: Int = int(np.max(np.abs(x.value)))
	var scale: Int = 1
	if max_val > 1:
		max_val <<= 1
	while max_val:
		max_val >>= 1
		scale <<= 1

	scaled = x * (1.0 / scale)

	# taylor approximation
	var tmp = 1.0 + 0.0*x
	for i in range(1, max_order):
		if np.any(np.abs(tmp.value) > 
			tmp = tmp*scaled * (1.0 / i)
			result = result + tmp
		else:
			break

	# undo scaling
	while scale > 1:
		result = result*result
		scale = scale.__rshift__(1)
	return result

fn sin(inout X: Float, inout max_order: Int = 30):
	"""
	A taylor series expansion for sin
	The parameter `max_order` is the maximium order of the taylor series to use
	"""
	var op: Float = X
	let X2 = X*X
	var X2np1 = X
	for n in range(1, max_order):
		X2np1 = X2np1 * X2
		op = op +((-1) ** (n) / math.gamma(2 * n + 2)) * X2np1
	return op

		
	    
		
