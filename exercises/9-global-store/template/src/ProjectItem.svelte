<script>

  import {createEventDispatcher} from 'svelte';
  const dispatch = createEventDispatcher();


  export let project = {}

  function logDay() {
  dispatch("log-day", project.id);
}

  function markProjectAsDone() {
  dispatch("mark-done", project.id);
}
</script>

<tr class="{project.done ? 'bg-secondary text-white': ''}">
    <td>{project.name}</td>
    <td>{project.category}</td>
    <td>{project.estimatedDays}</td>
    <td style="{project.loggedDays > project.estimatedDays ? 'color: red': ''}">{project.loggedDays}</td>
    <td class="[theme from store here]">
        {#if !project.done}
          <button class="btn btn-sm btn-success" on:click={logDay(project.id)}>Log 1 day</button>
          <button class="btn btn-sm btn-primary" on:click={markProjectAsDone(project.id)}>Mark as DONE</button>
        {/if}
    </td>
</tr>

<style>
.light {}

.dark {
background-color: darkgrey;
}
</style>
