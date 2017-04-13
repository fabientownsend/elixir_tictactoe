defmodule Tictactoe.CLI do
  def main(args \\ []) do
    board =
      Menu.select_board_size
      |> Board.empty_board

    Menu.select_game_type
    |> PlayersFactory.get_players
    |> Game.start(board, :x)
  end
end
