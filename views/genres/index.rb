<h1>Genres</h1>

<table>
  <tr>
    <th>Genres</th>
    <th></th>
  </tr>
  <% for genre in @genres %>
  <tr>
    <td><a href="/genres/<%= genre.id %>"><%= genre.genre %></a></td>
  </tr>
  <% end %>
</table>
