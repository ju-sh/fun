"""
Functions to find simple and compound interests.
"""

def comp_interest(principal: float,
                  rate: float,
                  comp_freq: int,
                  duration: float) -> float:
    """
    principal: principal amount
    rate: Rate interest as float (100% is 100)
    duration: Duration in years
    comp_freq: Number of compounding periods in a year

    interest = principal*((1 + rate/100)**n) - principal
    """
    rate /= 100 * comp_freq
    rv = (1 + rate) ** (comp_freq * duration)
    rv = principal * rv 
    rv -= principal
    return rv

def simp_interest(principal: float,
                  rate: float,
                  duration: float) -> float:
    """
    principal: principal amount
    rate: Rate interest as float (100% is 100)
    duration: Duration in years
    comp_freq: Number of compounding periods in a year

    interest = principal * duration * rate
    """
    return principal * duration * rate/100 


#import pytest
#
#@pytest.mark.parametrize("principal,rate,comp_freq,duration,expected", [
#    (12000, 10, 2, 1.5, 1891.5),
#    (1000, 20, 1, 2, 440.0),
#])
#def test_comp_interest(principal, rate, comp_freq, duration, expected):
#    rv = comp_interest(principal, rate, comp_freq, duration)
#    assert round(rv, 5) == expected
