<script>
  import {createEventDispatcher} from 'svelte';
  const dispatch = createEventDispatcher();

  export let budget = 0;
  export let loggedDaysSum = 0;

  function increaseBudget() {
    dispatch("increase-budget");
  }
</script>

<div class="buget-info">
  Budget: <strong>{budget}</strong> days, logged days: <strong>{loggedDaysSum}</strong>
  <button class="btn btn-sm btn-secondary ml-4" on:click={increaseBudget}>Increase budget</button>
</div>

<div class="badge mb-4 p-2" class:badge-success="{loggedDaysSum < budget}" class:badge-warning="{loggedDaysSum >= budget}">{loggedDaysSum >= budget  ? "Out of money!": "Let's spend some money"}</div>
