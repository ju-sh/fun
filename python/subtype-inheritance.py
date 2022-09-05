# Not sure if I wrote this myself or if I got if from somewhere

from typing import Optional

class stack:
    """ A stack of integers """
    def __init__(self, vals: list[int]):
        self.vals = vals
    def push_back(self, val:int) -> None:
        return self.vals.append(val)
    def pop_front(self) -> Optional[int]:
        try:
            return self.vals.pop(0)
        except IndexError:
            return None

class deq(stack):
    """ A deque of integers """
    def __init__(self, vals: list[int]):
        super().__init__(vals)
    def push_front(self, val:int) -> None:
        return self.vals.insert(0, val)
    def pop_back(self) -> Optional[int]:
        try:
            return self.vals.pop()
        except IndexError:
            return None

def f(s: stack) -> None:
    s.push_back(3)
    print(f"Stack after pushing 3: {s.vals}")
    val = s.pop_front()
    print(f"Pop front val: {val}")

f(stack([1,2]))
f(deq([1,2]))
#Stack after pushing 3: [1, 2, 3]
#Pop front val: 1
#Stack after pushing 3: [1, 2, 3]
#Pop front val: 1
