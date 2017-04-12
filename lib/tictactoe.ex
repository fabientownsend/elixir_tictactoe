defmodule Tictactoe.CLI do
  def main(args \\ []) do
    board = Board.empty_board(4)

    Menu.select_game_type
    |> PlayersFactory.get_players
    |> Game.start(board, :x)
  end
end
