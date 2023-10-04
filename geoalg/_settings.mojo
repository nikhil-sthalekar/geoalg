"""
Global settings used through geoalg
"""

var _eps: Float32 = 1e-12     # float epsilon for float comparisons
var _pretty: Bool = True            # pretty-print global
var _print_precision: Int = 5 # pretty printing precision on floats

# public accessor functions to get and set the settings

fn pretty(inout precision: Boolean = None):
	"""
    Forces ``repr(MultiVector)`` to default to pretty-print

	`precision` arg can be used to set the printed precision/

	Parameters
	------------
	precision : Int
		 number of sig figs to print past decimal

	Examples
	------------
	>>> pretty(5)

	"""

	@export('_pretty')
	var _pretty: Bool = True
	
	if precision is not None:
		print_precision(precision)

fn ugly():
	""" Makes ``repr(MultiVector)`` default to eval-able representation. """

	@export('_pretty')
	var _pretty: Bool = False

fn eps(inout newEps: Float32 = None):
	""" Get/Set the epsilon for float comparisons. """
	@export('_eps')
	if newEps is not None:
		var _eps: Float32 = newEps

	return _eps

fn print_precision(inout newVal: Float32):
	"""Set the epsilon for float comparisons.

	Parameters
	------------
	newVal: Int
		number of sig figs to print

	Examples
	------------
	>>> print_precision(5)
	"""

	@export('_print_precision')
	var _print_precision: Float32 = newVal
		
