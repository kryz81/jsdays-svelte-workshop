<script>
  import { projects as PROJECTDATA } from './projects';

  const version = "1.0-rc.1"
  const budget = 10;
  const projects = PROJECTDATA;

  $: loggedDaysSum = projects.reduce((sum, project) => sum += project.loggedDays, 0);
</script>

<h1>Project Management Tool <span>{version}</span></h1>

<div class="buget-info">Budget: <strong>{budget}</strong> days, logged days: <strong>{loggedDaysSum}</strong></div>

{#if loggedDaysSum >= budget}
  <div class="badge badge-warning mb-4">Out of money!</div>
{/if}

<table class="table table-bordered">
  <tr class="thead-light">
    <th>Project Name</th>
    <th>Estimated days</th>
    <th>Logged days</th>
    <th>Actions</th>
  </tr>
  {#each projects as project (project.id)}
  <tr>
    <td>{project.name}</td>
    <td>{project.estimatedDays}</td>
    <td>{project.loggedDays}</td>
    <td>
        {#if !project.done}<button class="btn btn-sm btn-primary">Mark as DONE</button>{/if}
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
