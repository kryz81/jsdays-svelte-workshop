<script>
  import {projects as PROJECTDATA} from './projects';
  import InfoBoard from './InfoBoard.svelte';
  import ProjectList from './ProjectList.svelte';
  import AddProjectForm from './AddProjectForm.svelte';
  import InfoModal from './InfoModal.svelte';

  const version = "1.0-rc.1"
  let budget = 20;
  let projects = PROJECTDATA;
  let isOpen = false;

  $: loggedDaysSum = projects.reduce((sum, project) => sum += project.loggedDays, 0);

  function increaseBudget() {
    budget += 1;
  }

  function markProjectAsDone(event) {
    const projectId = event.detail;
    projects = projects.map(project => {
      if (project.id === projectId) {
        return {...project, done: true};
      }
      return project;
    });
  }

  function logDay(event) {
    const projectId = event.detail;
    projects = projects.map(project => {
         if (project.id === projectId) {
           return {...project, loggedDays: project.loggedDays + 1};
         }
         return project;
       });
  }


  async function save(event) {

    projects = [...projects, {...event.detail, loggedDays: 0}];

  }

  function open() {
    isOpen = true;
  }

  function close() {
    isOpen = false;
  }

</script>

<h1>Project Management Tool <span>{version}</span></h1>

<div class="my-4"><button class="btn btn-sm btn-secondary" on:click={open}>Open info</button></div>
{#if isOpen}
<InfoModal title="Projects Summary" on:close={close}>
  <InfoBoard on:increase-budget={increaseBudget} budget={budget} loggedDaysSum={loggedDaysSum}></InfoBoard>
</InfoModal>
{/if}

<ProjectList projects={projects} on:log-day={logDay} on:mark-done={markProjectAsDone}/>

<AddProjectForm on:save={save}/>

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
