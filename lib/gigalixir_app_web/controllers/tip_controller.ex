defmodule GigalixirAppWeb.TipController do
  use GigalixirAppWeb, :controller

  alias GigalixirApp.Tips
  alias GigalixirApp.Tips.Tip

  def index(conn, _params) do
    tips = Tips.list_tips()
    render(conn, "index.html", tips: tips)
  end

  def new(conn, _params) do
    changeset = Tips.change_tip(%Tip{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"tip" => tip_params}) do
    case Tips.create_tip(tip_params) do
      {:ok, tip} ->
        conn
        |> put_flash(:info, "Tip created successfully.")
        |> redirect(to: Routes.tip_path(conn, :show, tip))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tip = Tips.get_tip!(id)
    render(conn, "show.html", tip: tip)
  end

  def edit(conn, %{"id" => id}) do
    tip = Tips.get_tip!(id)
    changeset = Tips.change_tip(tip)
    render(conn, "edit.html", tip: tip, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tip" => tip_params}) do
    tip = Tips.get_tip!(id)

    case Tips.update_tip(tip, tip_params) do
      {:ok, tip} ->
        conn
        |> put_flash(:info, "Tip updated successfully.")
        |> redirect(to: Routes.tip_path(conn, :show, tip))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", tip: tip, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tip = Tips.get_tip!(id)
    {:ok, _tip} = Tips.delete_tip(tip)

    conn
    |> put_flash(:info, "Tip deleted successfully.")
    |> redirect(to: Routes.tip_path(conn, :index))
  end
end
