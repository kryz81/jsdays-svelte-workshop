<script>
  import ProjectItem from './ProjectItem.svelte';

  import {createEventDispatcher} from 'svelte';
  const dispatch = createEventDispatcher();

  export let projects = [];

  function logDay(projectId) {
    dispatch("log-day", projectId);
  }

  function markProjectAsDone(projectId) {
    dispatch("mark-done", projectId);
  }
</script>

<table class="table table-bordered">
  <tr class="thead-light">
    <th>Project Name</th>
    <th>Category</th>
    <th>Estimated days</th>
    <th>Logged days</th>
    <th>Actions</th>
  </tr>
  {#each projects as project (project.id)}
    <ProjectItem project={project} on:log-day on:mark-done/>
  {/each}
</table>
