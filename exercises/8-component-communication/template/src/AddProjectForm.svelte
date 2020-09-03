<script>
  const projectCategories = ["Internal", "Customer"];

  let formData = {
    name: "",
    category: "",
    estimatedDays: 0,
    done: false
  }

  function save() {
    // validation
    if (String(formData.name).trim() === "" || formData.category === "") {
      return;
    }

    // reset form
    formData = {
      name: "",
      category: "",
      estimatedDays: 0,
      done: false
    }
  }
</script>

<form class="bg-light p-4 w-50" on:submit|preventDefault={save}>
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
    bind:value={formData.estimatedDays}
  />
</div>
<div class="form-group">
  <label for="category">Category</label>
  <select id="category" class="form-control" bind:value={formData.category}>
    <option value="">--- Select ---</option>
    {#each projectCategories as category}
    <option v-for="option in projectCategories" value={category}>{category}</option>{/each}
  </select>
</div>
<div class="form-group form-check">
  <input
    id="done"
    type="checkbox"
    class="form-check-input"
    bind:checked={formData.done}
  />
  <label for="done" class="form-check-label">Done</label>
</div>
<div>
  <button type="submit" class="btn btn-success">Save</button>
</div>
</form>
