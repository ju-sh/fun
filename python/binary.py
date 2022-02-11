def tobin(n : int) -> "List[int]":
    rv = []
    while n>0:
        rv.append(n%2)
        n//=2
    return rv

for i in range(17):
    rv = tobin(i)
    rv.reverse()
    print(rv)
