defmodule GigalixirAppWeb.TipControllerTest do
  use GigalixirAppWeb.ConnCase

  import GigalixirApp.TipsFixtures

  @create_attrs %{body: "some body"}
  @update_attrs %{body: "some updated body"}
  @invalid_attrs %{body: nil}

  describe "index" do
    test "lists all tips", %{conn: conn} do
      conn = get(conn, Routes.tip_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Tips"
    end
  end

  describe "new tip" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.tip_path(conn, :new))
      assert html_response(conn, 200) =~ "New Tip"
    end
  end

  describe "create tip" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.tip_path(conn, :create), tip: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.tip_path(conn, :show, id)

      conn = get(conn, Routes.tip_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Tip"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.tip_path(conn, :create), tip: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Tip"
    end
  end

  describe "edit tip" do
    setup [:create_tip]

    test "renders form for editing chosen tip", %{conn: conn, tip: tip} do
      conn = get(conn, Routes.tip_path(conn, :edit, tip))
      assert html_response(conn, 200) =~ "Edit Tip"
    end
  end

  describe "update tip" do
    setup [:create_tip]

    test "redirects when data is valid", %{conn: conn, tip: tip} do
      conn = put(conn, Routes.tip_path(conn, :update, tip), tip: @update_attrs)
      assert redirected_to(conn) == Routes.tip_path(conn, :show, tip)

      conn = get(conn, Routes.tip_path(conn, :show, tip))
      assert html_response(conn, 200) =~ "some updated body"
    end

    test "renders errors when data is invalid", %{conn: conn, tip: tip} do
      conn = put(conn, Routes.tip_path(conn, :update, tip), tip: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Tip"
    end
  end

  describe "delete tip" do
    setup [:create_tip]

    test "deletes chosen tip", %{conn: conn, tip: tip} do
      conn = delete(conn, Routes.tip_path(conn, :delete, tip))
      assert redirected_to(conn) == Routes.tip_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.tip_path(conn, :show, tip))
      end
    end
  end

  defp create_tip(_) do
    tip = tip_fixture()
    %{tip: tip}
  end
end
