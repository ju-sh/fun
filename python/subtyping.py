# https://docs.python.org/3.8/library/typing.html#nominal-vs-structural-subtyping
# https://peps.python.org/pep-0544/
# https://github.com/python/typing/issues/622
# Needs Python>=3.8
from typing import Protocol

from collections import namedtuple

rectype0 = namedtuple('rectype0', ['x'])
rectype1 = namedtuple('rectype1', ['x', 'y'])

class recprotocol(Protocol):
    @property
    def x(self) -> int: ...

def f(a:recprotocol):
    return a.x

recval0 = rectype0(15)
recval1 = rectype1(10, 20)
print(f(recval0))  # mypy is happy
print(f(recval1))  # mypy is still happy







## Needs Python>=3.8
#from typing import Protocol
#
#from collections import namedtuple
#
#rectype0 = namedtuple('rectype0', ['x'])
#rectype1 = namedtuple('rectype1', ['x', 'y'])
#
#class recprotocol(Protocol):
#    x:int
#
#def f(a:recprotocol):
#    return a.x
#
#recval0 = rectype0(15)
#recval1 = rectype1(10, 20)
#print(f(recval0))
#assert recval1.x
##print(recval1.x)
#print(f(recval1))








#from collections import namedtuple
#
#rectype0 = namedtuple('rectype0', ['x'])
#rectype1 = namedtuple('rectype1', ['x', 'y'])
#
#def f(a:rectype0):
#    return a.x
#
#recval0 = rectype0(15)
#recval1 = rectype1(10, 20)
#print(f(recval0))
##print(recval1.x)
#print(f(recval1))
