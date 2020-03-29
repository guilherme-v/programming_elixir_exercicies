defmodule StackAppTest do
  use ExUnit.Case, async: true
  doctest StackApp

  setup do
    stash = start_supervised!(StackApp.Stash)
    stack = start_supervised!({StackApp, {stash, []}})
    %{stack: stack, stash: stash}
  end

  test "should be able to push a value", %{stack: stack} do
    assert StackApp.push(stack, "dummy") == :ok
  end

  test "should be able to pop the value at top", %{stack: stack} do
    StackApp.push(stack, "dummy")
    StackApp.push(stack, 1)
    StackApp.push(stack, :bla)

    assert StackApp.pop(stack) == :bla
    assert StackApp.pop(stack) == 1
    assert StackApp.pop(stack) == "dummy"
  end

  test "should be able to print the current state", %{stack: stack, stash: stash} do
    StackApp.push(stack, "dummy")
    StackApp.push(stack, 1)
    StackApp.push(stack, :bla)

    assert StackApp.print(stack) == inspect({[:bla, 1, "dummy"], stash})
  end

  test "should save the state in stash when terminate", %{stack: stack, stash: stash} do
    Process.flag(:trap_exit, true)

    StackApp.push(stack, 1)
    StackApp.push(stack, :bla)

    StackApp.stop(stack)
    assert StackApp.Stash.read(stash) == [:bla, 1]
  end

  test "should recover state from stash when being initialized" do
    state = [10, :lol, 4, "dummy"]
    {:ok, stash} = StackApp.Stash.start_link()
    StackApp.Stash.save(stash, state)

    {:ok, stack} = StackApp.start_link({stash, []})

    assert StackApp.pop(stack) == 10
    assert StackApp.pop(stack) == :lol
    assert StackApp.pop(stack) == 4
    assert StackApp.pop(stack) == "dummy"
  end
end
