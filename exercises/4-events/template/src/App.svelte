<script>
  import { projects as PROJECTDATA } from './projects';

  const version = "1.0-rc.1"
  let budget = 20;
  let projects = PROJECTDATA;

  $: loggedDaysSum = projects.reduce((sum, project) => sum += project.loggedDays, 0);

</script>

<h1>Project Management Tool <span>{version}</span></h1>

<div class="buget-info">
  Budget: <strong>{budget}</strong> days, logged days: <strong>{loggedDaysSum}</strong>
  <button class="btn btn-sm btn-secondary ml-4">Increase budget</button>
</div>

<div class="badge mb-4 p-2" class:badge-success="{loggedDaysSum < budget}" class:badge-warning="{loggedDaysSum >= budget}">{loggedDaysSum >= budget  ? "Out of money!": "Let's spend some money"}</div>

<table class="table table-bordered">
  <tr class="thead-light">
    <th>Project Name</th>
    <th>Estimated days</th>
    <th>Logged days</th>
    <th>Actions</th>
  </tr>
  {#each projects as project}
  <tr class="{project.done ? 'bg-secondary text-white': ''}">
    <td>{project.name}</td>
    <td>{project.estimatedDays}</td>
    <td style="{project.loggedDays > project.estimatedDays ? 'color: red': ''}">{project.loggedDays}</td>
    <td>
        {#if !project.done}
          <button class="btn btn-sm btn-success">Log 1 day</button>
          <button class="btn btn-sm btn-primary">Mark as DONE</button>
        {/if}
    </td>
  </tr>
  {/each}
</table>

<style>
  h1 {
    text-align: center;
    color: darkcyan;
  }

  h1 span {
    font-size: 0.5em;
    color: #999;
  }

  .buget-info {
    margin: 25px 0;
  }
</style>
