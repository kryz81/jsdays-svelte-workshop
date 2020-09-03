<script>
  import {projects as PROJECTDATA} from './projects';
  import InfoBoard from './InfoBoard.svelte';
  import ProjectList from './ProjectList.svelte';
  import AddProjectForm from './AddProjectForm.svelte';

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


  async function save() {
    // validation
    if (String(formData.name).trim() === "" || formData.category === "") {
      return;
    }

    projects = [...projects, {...formData, loggedDays: 0}];

    // reset form
/*    formData = {
      name: "",
      category: "",
      estimatedDays: 0,
      done: false
    }*/
  }

</script>

<h1>Project Management Tool <span>{version}</span></h1>
<InfoBoard/>
<ProjectList/>
<AddProjectForm/>

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
