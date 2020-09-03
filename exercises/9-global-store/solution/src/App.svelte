<script>
  import {projects as PROJECTDATA} from './projects';
  import InfoBoard from './InfoBoard.svelte';
  import ProjectList from './ProjectList.svelte';
  import AddProjectForm from './AddProjectForm.svelte';

  import {theme} from './stores/theme';

  const version = "1.0-rc.1"
  let budget = 20;
  let projects = PROJECTDATA;

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

  function toggleTheme() {
    theme.update(currentTheme => {
      if (currentTheme === "light") {
        return "dark";
      } else {
        return "light";
      }
    });
  }

</script>

<h1>Project Management Tool <span>{version}</span></h1>
<div><button on:click={toggleTheme} class="btn btn-sm btn-secondary">Toggle theme</button></div>
<InfoBoard on:increase-budget={increaseBudget} budget={budget} loggedDaysSum={loggedDaysSum}/>
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
