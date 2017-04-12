defmodule BoardRenderTest do
  use ExUnit.Case

  test "renders an empty board" do
    board = Board.empty_board

    assert BoardRender.render(board) == " 0 | 1 | 2 \n" <>
                                        " 3 | 4 | 5 \n" <>
                                        " 6 | 7 | 8 \n"
  end

  test "renders a board with one element" do
    empty = Board.empty_board
    board = Board.set_mark(empty, :x, 5)

    assert BoardRender.render(board) == " 0 | 1 | 2 \n" <>
                                        " 3 | 4 | x \n" <>
                                        " 6 | 7 | 8 \n"
  end

  test "renders a 4 * 4 board" do
    board = Board.empty_board(4)

    assert BoardRender.render(board) == "  0 |  1 |  2 |  3 \n" <>
                                        "  4 |  5 |  6 |  7 \n" <>
                                        "  8 |  9 | 10 | 11 \n" <>
                                        " 12 | 13 | 14 | 15 \n"
  end
end
