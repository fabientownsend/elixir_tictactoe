defmodule BoardRender do
  def render(board) do
    build_render(chunk_board(board), size_bigger_index(board))
  end

  def size_bigger_index(board) do
    board |> Enum.count |> Integer.digits |> Enum.count
  end

  def chunk_board(board) do
    Enum.chunk(board, Board.size(board))
  end

  def build_render([], _), do: ""
  def build_render([head | tail], size_spot) do
    line(head, size_spot) <> build_render(tail, size_spot)
  end

  def line([head], size_spot), do: center(head, size_spot) <> "\n"
  def line([head | tail], size_spot) do
    center(head, size_spot) <> "|" <> line(tail, size_spot)
  end

  def center(content, size_spot) do
    padding = size_spot - width(content)
    " " <> String.duplicate(" ", padding) <> "#{content}" <> " "
  end

  def width(:x), do: 1
  def width(:o), do: 1
  def width(digit), do: digit |> Integer.digits |> Enum.count
end
