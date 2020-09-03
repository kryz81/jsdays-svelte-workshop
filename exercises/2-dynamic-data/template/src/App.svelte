<script>
  import { projects as PROJECTDATA } from './projects';

</script>

<h1>Project Management Tool <span>[version]</span></h1>

<div class="buget-info">Budget: <strong>[budget]</strong> days, logged days: <strong>[logged days sum]</strong></div>

<div class="badge badge-warning mb-4">Out of money!</div>

<table class="table table-bordered">
  <tr class="thead-light">
    <th>Project Name</th>
    <th>Estimated days</th>
    <th>Logged days</th>
    <th>Actions</th>
  </tr>
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
