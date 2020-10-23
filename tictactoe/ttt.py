"""
Simple TicTacToe game

Needs Python>=3.6
"""

from typing import List, Tuple


class TicTacToe:
    """
    Represents a game of tic-tac-toe.
    """
    # Possbile winning configurations
    _WINNING_POS = [
        [0, 1, 2],  # top horizontal
        [3, 4, 5],  # middle horizontal
        [6, 7, 8],  # bottom horizontal

        [0, 3, 6],  # left vertical
        [1, 4, 7],  # middle vertical
        [2, 5, 8],  # right vertical

        [0, 4, 8],  # main diagonal
        [2, 4, 6]   # anti-diagonal
    ]

    def __init__(self, players: List[Tuple[str, str]]):
        """
        TicTacToe grid is represented with the grid attribute as a list of
        9 elements.
        Empty cell have None value.

        players: a list of exactly two elements where each element is a tuple
        of two strings: player name and player symbol
        The first player in this list will get the first turn.
        Player symbols must be strings of length 1.

        turn: index in the players list corresponding to the details of the
        player who should play next.

        Raises ValueError on invalid player info.
        """
        if len(players) != 2:
            raise ValueError(f"Exactly 2 players needed. Got {len(players)}")

        # Check if player details are valid
        for player_info in players:
            count = len(player_info)
            if count != 2:
                raise ValueError(f"player tuple has 2 values. Got {count}")

            symbol = player_info[1]
            if len(symbol) != 1:
                raise ValueError(f"{symbol}: player symbol is a single char")

        # Assign attributes
        self.players = players
        self.grid = [None for _ in range(9)]
        self.turn = 0
        self._empty = 9  # Number of empty cells

    def _is_over(self) -> int:
        """
        Helper function for next_turn() that determines a game over condition.

        Returns 0 if game is not over, 1 if game is over with a winner
        and -1 if there is a tie.
        """
        symbol = self.players[self.turn][1]
        for win_pos in self._WINNING_POS:
            if all([self.grid[pos] == symbol for pos in win_pos]):
                return 1    # a player won

        if self._empty == 0:
            return -1       # a tie

        return 0

    def next_turn(self, cell_idx: str) -> int:
        """
        Represents one turn in the game.

        Accepts the index of chosen cell as a string.
        Indexing starts from 0.

        Returns 0 if game is not over, 1 if game is over with a winner
        and -1 if there is a tie.

        Raises ValueError if cell index is invalid.
        """
        cell = int(cell_idx)
        if cell < 0 or cell > 8:
            raise ValueError(f"{cell}: Invalid cell index")

        if self.grid[cell] is not None:
            raise ValueError("Cell already taken!")

        # Assign current player's symbol to cell
        self.grid[cell] = self.players[self.turn][1]
        self._empty -= 1

        status = self._is_over()
        if status == 0:
            self.turn = 1 if self.turn == 0 else 0
        elif status < 0:
            self.turn = None
        return status


def display(grid: List[int]) -> None:
    """Displays the grid"""
    for row_num in range(3):
        row = grid[row_num * 3: (row_num * 3) + 3]
        row = [elem if elem is not None else ' ' for elem in row]
        row_str = " " + ' | '.join(row)
        print(row_str)
        if row_num < 2:
            print('-' * (len(row_str)+1))


def play(game: TicTacToe) -> None:
    """Event loop of the game"""
    display(game.grid)
    cell = input(f"{game.players[game.turn][0]}'s turn. Choose a cell: ")
    while True:
        try:
            status = game.next_turn(cell)
        except ValueError as verr:
            print(verr)
        else:
            if status != 0:
                break
        display(game.grid)
        cell = input(f"{game.players[game.turn][0]}'s turn. Choose a cell: ")
    if game.turn is None:
        print("Game tied...")
    else:
        print(f"{game.players[game.turn][0]} won!")


if __name__ == "__main__":
    ttt = TicTacToe(players=[("User", 'O'), ("PC", 'X')])
    play(ttt)
