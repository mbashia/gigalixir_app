defmodule GigalixirApp.TipsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GigalixirApp.Tips` context.
  """

  @doc """
  Generate a tip.
  """
  def tip_fixture(attrs \\ %{}) do
    {:ok, tip} =
      attrs
      |> Enum.into(%{
        body: "some body"
      })
      |> GigalixirApp.Tips.create_tip()

    tip
  end
end
