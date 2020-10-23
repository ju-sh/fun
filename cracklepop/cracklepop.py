"""
CracklePop!

A program that prints out the numbers 1 to 100 (inclusive).
If the number is divisible by 3, print Crackle instead of the number.
If it's divisible by 5, print Pop.
If it's divisible by both 3 and 5, print CracklePop.
"""


def get_msg(num: int) -> str:
    """
    Find message to be printed for the number.
    Return "Crackle", "Pop" and "CracklePop" if num is divisible by 3, 5
    and 15 respectively, otherwise return empty string.
    """
    msg = ""
    if num % 3 == 0:
        msg += "Crackle"
    if num % 5 == 0:
        msg += "Pop"
    return msg


def cracklepop(limit: int) -> None:
    """
    Print CracklePop for numbers from 1 to limit (inclusive)
    """
    for num in range(1, limit+1):
        msg = get_msg(num)
        if msg:
            print(msg)
        else:
            print(num)


if __name__ == "__main__":
    cracklepop(100)
