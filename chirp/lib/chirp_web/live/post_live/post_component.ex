defmodule ChirpWeb.PostLive.PostComponent do
  use ChirpWeb, :live_component

  def render(assigns) do
    ~L"""
    <script src="https://kit.fontawesome.com/d07169d6d4.js" crossorigin="anonymous"></script>
    <style>
    .post {
      width: 768px;
      border: 0.5px solid DarkCyan;
      border-style: inset;
      padding: 8px;
      margin: 8px;
    }

    .post-avatar {
    vertical-align: middle;
    width: 50px;
    height: 50px;
    background-color: CadetBlue;
    }

    .column {
    margin: auto;
    }
    </style>
    <div id="post-<%= @post.id %>" class="post">
      <div class="row">
        <div class="column column-10">
          <div class="post-avatar"></div>
        </div>
        <div class="column column-90 post-body">
          <b>@<%= @post.username %></b>
          <br/>
          <%= @post.body %>
        </div>
      </div>

      <div class="row">
        
        <div class="column">
          <a href="#" phx-click="like" phx-target="<%= @myself %>">
          <i class="far fa-heart"></i> <%= @post.likes_count %>
          </a>
        </div>
        <div class="column">
        <a href="#" phx-click="repost" phx-target="<%= @myself %>">
          <i class="fa fa-retweet"></i> <%= @post.reposts_count %>
          </a>
        </div>

        <div class="column">
          
          <%= live_patch to: Routes.post_index_path(@socket, :edit, @post.id) do %>
            <i class="far fa-edit"></i>
          <% end %>

          <%= link to: "#", phx_click: "delete", phx_value_id: @post.id do%>
            <i class="far fa-trash-alt"></i>
          <% end %>

        </div>
      </div> 
    </div>
    """
  end
end