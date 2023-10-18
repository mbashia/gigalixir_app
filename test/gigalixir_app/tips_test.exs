defmodule GigalixirApp.TipsTest do
  use GigalixirApp.DataCase

  alias GigalixirApp.Tips

  describe "tips" do
    alias GigalixirApp.Tips.Tip

    import GigalixirApp.TipsFixtures

    @invalid_attrs %{body: nil}

    test "list_tips/0 returns all tips" do
      tip = tip_fixture()
      assert Tips.list_tips() == [tip]
    end

    test "get_tip!/1 returns the tip with given id" do
      tip = tip_fixture()
      assert Tips.get_tip!(tip.id) == tip
    end

    test "create_tip/1 with valid data creates a tip" do
      valid_attrs = %{body: "some body"}

      assert {:ok, %Tip{} = tip} = Tips.create_tip(valid_attrs)
      assert tip.body == "some body"
    end

    test "create_tip/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tips.create_tip(@invalid_attrs)
    end

    test "update_tip/2 with valid data updates the tip" do
      tip = tip_fixture()
      update_attrs = %{body: "some updated body"}

      assert {:ok, %Tip{} = tip} = Tips.update_tip(tip, update_attrs)
      assert tip.body == "some updated body"
    end

    test "update_tip/2 with invalid data returns error changeset" do
      tip = tip_fixture()
      assert {:error, %Ecto.Changeset{}} = Tips.update_tip(tip, @invalid_attrs)
      assert tip == Tips.get_tip!(tip.id)
    end

    test "delete_tip/1 deletes the tip" do
      tip = tip_fixture()
      assert {:ok, %Tip{}} = Tips.delete_tip(tip)
      assert_raise Ecto.NoResultsError, fn -> Tips.get_tip!(tip.id) end
    end

    test "change_tip/1 returns a tip changeset" do
      tip = tip_fixture()
      assert %Ecto.Changeset{} = Tips.change_tip(tip)
    end
  end
end
