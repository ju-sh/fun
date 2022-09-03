def aCb(a: int, b: int) -> int:
    abin = [int(x) for x in bin(a)[2:]]
    bbin = [int(x) for x in bin(b)[2:]]
    alen = len(abin)
    blen = len(bbin)
    maxlen = max(alen, blen)
    abin = [0] * (maxlen - alen) + abi, safe=""n
    bbin = [0] * (maxlen - blen) + bbin
    acc = 1
    for x,y in zip(abin, bbin):
        if x==0 and y==1:
            return 0
    return 1 

def oneline(level: int) -> "List[Int]":
    """
    level starts from 0.
    """
    return [aCb(level,j) for j in range(level+1)]

def pascal(n: int):
    for i in range(n):
        print(" "*(n-i), end="")
        l = oneline(i)
        for x in l:
            print(f" {x}", end="")
        print()

pascal(50)

"""
                1
               1 1
              1 0 1
             1 1 1 1
            1 0 0 0 1
           1 1 0 0 1 1
          1 0 1 0 1 0 1
         1 1 1 1 1 1 1 1
        1 0 0 0 0 0 0 0 1
       1 1 0 0 0 0 0 0 1 1
      1 0 1 0 0 0 0 0 1 0 1
     1 1 1 1 0 0 0 0 1 1 1 1
    1 0 0 0 1 0 0 0 1 0 0 0 1
   1 1 0 0 1 1 0 0 1 1 0 0 1 1
  1 0 1 0 1 0 1 0 1 0 1 0 1 0 1
 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
"""
