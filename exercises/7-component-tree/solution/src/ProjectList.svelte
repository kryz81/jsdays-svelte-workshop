<table class="table table-bordered">
  <tr class="thead-light">
    <th>Project Name</th>
    <th>Category</th>
    <th>Estimated days</th>
    <th>Logged days</th>
    <th>Actions</th>
  </tr>
  {#each projects as project}
  <tr class="{project.done ? 'bg-secondary text-white': ''}">
    <td>{project.name}</td>
    <td>{project.category}</td>
    <td>{project.estimatedDays}</td>
    <td style="{project.loggedDays > project.estimatedDays ? 'color: red': ''}">{project.loggedDays}</td>
    <td>
        {#if !project.done}
          <button class="btn btn-sm btn-success" on:click={logDay(project.id)}>Log 1 day</button>
          <button class="btn btn-sm btn-primary" on:click={markProjectAsDone(project.id)}>Mark as DONE</button>
        {/if}
    </td>
  </tr>
  {/each}
</table>
