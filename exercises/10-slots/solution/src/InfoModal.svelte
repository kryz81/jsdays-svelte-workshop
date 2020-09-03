<script>
  import {createEventDispatcher} from 'svelte';
  const dispatch = createEventDispatcher();

  export let title = '';

  function close() {
    dispatch("close");
  }

</script>

<div class="infomodal">
<div class="infomodalcontent">
  <h4>{title}</h4>
  <slot></slot>
  <div class="text-right mt-4">
    <button class="btn btn-sm btn-secondary" on:click={close}>Close</button>
  </div>
</div>
</div>

<style>
.infomodal {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  width: 100%;
  height: 100%;
  background-color: #ddd;
}

.infomodalcontent {
  background-color: #f7f7f7;
  left: 0;
  right: 0;
  width: 50%;
  margin-left: auto;
  margin-right: auto;
  margin-top: 50px;
  border: solid 1px #999;
  box-shadow: 2px 2px 3px #bbb;
  padding: 15px;
}
</style>
