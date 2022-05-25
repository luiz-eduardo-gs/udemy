defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error reading file: #{reason}"}
  defp handle_file_read({:ok, content}) do
    fizzbuzz = content
    |> convert_string_to_number_list_and_evaluate_fizzbuzz()

    {:ok, fizzbuzz}
  end

  defp convert_string_to_number_list_and_evaluate_fizzbuzz(str) do
    str
    |> String.split(",")
    |> Enum.map(&evaluate_fizzbuzz/1)
  end

  defp evaluate_fizzbuzz(elem) do
    elem
    |> String.to_integer()
    |> check_mult()
  end

  defp check_mult(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp check_mult(number) when rem(number, 3) == 0,do: :fizz
  defp check_mult(number) when rem(number, 5) == 0, do: :buzz
  defp check_mult(number), do: number
end
