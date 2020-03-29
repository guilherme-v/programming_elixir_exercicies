defmodule StackApp.StashTest do
  use ExUnit.Case, async: true

  setup do
    # The advantage of using start_supervised! is that ExUnit will guarantee
    # that the registry process will be shutdown before the next test starts.
    # In other words, it helps guarantee that the state of one test is not
    # going to interfere with the next one in case they depend on shared
    # resources.
    stash = start_supervised!(StackApp.Stash)
    %{stash: stash}
  end

  test "should spawns with a empty list as its state", %{stash: stash} do
    assert StackApp.Stash.read(stash) == []
  end

  test "should allow to save and recover a state", %{stash: stash}  do
    StackApp.Stash.save(stash, [1,2,3])
    assert StackApp.Stash.read(stash) == [1,2,3]
  end

  test "should be able to print the current state", %{stash: stash} do
    list = [1,2,3]
    StackApp.Stash.save(stash, [1,2,3])
    assert StackApp.Stash.print(stash) == inspect(list)
  end
end
