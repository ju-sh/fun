import textwrap

import pytest

import ttt

@pytest.fixture
def game():
    return ttt.TicTacToe(players = [("User", 'O'), ("PC", 'X')])

@pytest.mark.parametrize('grid,expected', [
    (['O', None, 'X',
      'X', 'O', None,
      None, None, 'O'], 1),
    (['O', None, 'X',
      'X', 'O', None,
      None, None, 'X'], 0),
    (['O', 'X', 'X',
      'X', 'O', 'O',
      'O', 'X', 'X'], -1),
])
def test_is_over(game, grid, expected):
    game.grid = grid
    game._empty = sum([1 for x in grid if x is None])
    assert game._is_over() == expected

class TestNextTurn:
    @pytest.mark.parametrize('grid, cell_idx, expected', [
        (['O', 'X', 'X',
          'X', None, 'O',
          'O', 'X', 'X'], 4, -1),
        ([None, 'X', 'X',
          'X', None, 'O',
          'O', 'X', 'X'], 0, 0),
        (['O', 'X', 'X',
          'X', None, 'O',
          'O', 'X', 'O'], 4, 1),
    ])
    def test_valid(self, game, grid, cell_idx, expected):
        game.grid = grid
        game._empty = sum([1 for x in grid if x is None])
        assert game.next_turn(cell_idx) == expected
    
    @pytest.mark.parametrize('grid, cell_idx', [
        (['O', 'X', 'X',
          'X', None, 'O',
          'O', 'X', 'X'], 1),
        (['O', 'X', 'X',
          'X', None, 'O',
          'O', 'X', 'X'], 11),
    ])
    def test_invalid(self, game, grid, cell_idx):
        game.grid = grid
        game._empty = sum([1 for x in grid if x is None])
        with pytest.raises(ValueError):
            game.next_turn(cell_idx)
        
def test_display(capsys):
    grid = [None, 'X', 'X',
            'X', None, 'O',
            'O', 'X', 'X']
    grid_str = """
                  | X | X
               -----------
                X |   | O
               -----------
                O | X | X"""
    grid_str = textwrap.dedent(grid_str).strip('\n')
    ttt.display(grid)
    captured = capsys.readouterr()
    assert captured.out.strip('\n') == grid_str.strip('\n')
