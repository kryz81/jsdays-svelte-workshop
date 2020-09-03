<script>
  import { projects as PROJECTDATA } from './projects';

  const version = "1.0-rc.1"
  let budget = 20;
  let projects = PROJECTDATA;

  $: loggedDaysSum = projects.reduce((sum, project) => sum += project.loggedDays, 0);

  function increaseBudget() {
    budget += 1;
  }

  function markProjectAsDone(projectId) {
    projects = projects.map(project => {
      if (project.id === projectId) {
        return {...project, done: true};
      }
      return project;
    });
  }

  function logDay(projectId) {
       projects = projects.map(project => {
         if (project.id === projectId) {
           return {...project, loggedDays: project.loggedDays + 1};
         }
         return project;
       });
  }

  const projectCategories = ["Internal", "Customer"];

  let formData = {}

</script>

<h1>Project Management Tool <span>{version}</span></h1>

<div class="buget-info">
  Budget: <strong>{budget}</strong> days, logged days: <strong>{loggedDaysSum}</strong>
  <button class="btn btn-sm btn-secondary ml-4" on:click={increaseBudget}>Increase budget</button>
</div>

<div class="badge mb-4 p-2" class:badge-success="{loggedDaysSum < budget}" class:badge-warning="{loggedDaysSum >= budget}">{loggedDaysSum >= budget  ? "Out of money!": "Let's spend some money"}</div>

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

<form class="bg-light p-4 w-50">
<div class="form-group">
  <label for="projectName">Project Name</label>
  <input class="form-control" bind:value={formData.name} />
</div>
<div class="form-group">
  <label for="estimatedDays">Estimated days</label>
  <input
    id="estimatedDays"
    type="number"
    class="form-control"
    min="0"
  />
</div>
<div class="form-group">
  <label for="category">Category</label>
  <select id="category" class="form-control">
    <option value="">--- Select ---</option>
  </select>
</div>
<div class="form-group form-check">
  <input
    id="done"
    type="checkbox"
    class="form-check-input"
  />
  <label for="done" class="form-check-label">Done</label>
</div>
<div>
  <button type="submit" class="btn btn-success">Save</button>
</div>
</form>

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
