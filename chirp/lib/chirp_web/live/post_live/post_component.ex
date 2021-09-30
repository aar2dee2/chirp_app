defmodule ChirpWeb.PostLive.PostComponent do
  use ChirpWeb, :live_component

  def render(assigns) do
    ~L"""
    <script src="https://kit.fontawesome.com/d07169d6d4.js" crossorigin="anonymous"></script>
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
          <i class="fa fa-heart"></i> <%= @post.likes_count %>
        </div>
        <div class="column">
          <i class="fa fa-retweet"></i> <%= @post.reposts_count %>
        </div>

        <div class="column">
          
          <%= live_patch to: Routes.post_index_path(@socket, :edit, @post.id) do %>
            <i class="fa fa-edit"></i>
          <% end %>

          <%= link to: "#", phx_click: "delete", phx_value_id: @post.id do%>
            <i class="fa fa-trash-alt"></i>
          <% end %>

        </div>
      </div> 
    </div>
    """
  end
end