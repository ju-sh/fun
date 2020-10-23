import pytest

import cracklepop


@pytest.mark.parametrize("num, expected", [
    (51, "Crackle"),     # divisible by 3
    (65, "Pop"),         # divisible by 5
    (75, "CracklePop"),  # divisible by both 3 and 5
    (82, "")             # not divisible by 3, 5 and 15
])
def test_get_msg(num, expected):
    assert cracklepop.get_msg(num) == expected


def test_cracklepop(capsys):
    limit = 15
    expected = """1
2
Crackle
4
Pop
Crackle
7
8
Crackle
Pop
11
Crackle
13
14
CracklePop
"""
    cracklepop.cracklepop(limit)
    assert capsys.readouterr().out == expected
