defmodule FizzBuzzTest do
  use ExUnit.Case

  describe "build/1" do
    test "when non existent file, returns error with reason" do
      assert FizzBuzz.build("nonexistentfile.txt") == {:error, "Error reading file: enoent"}
    end

    test "when valid file, returns the converted list " do
      expected_response = {:ok, [1, 2, :fizz, 4, :buzz, :fizzbuzz, :buzz, :fizzbuzz]}
      assert FizzBuzz.build("fizzbuzz.txt") == expected_response
    end
  end
end
