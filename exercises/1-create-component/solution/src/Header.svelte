<h1>My Svelte Application</h1>
<ul>
    <li><a href="#">Home</a></li>
    <li><a href="#">About us</a></li>
    <li><a href="#">Projects</a></li>
    <li><a href="#">Kontakt</a></li>
</ul>

<style>
ul {
    margin: 0 0 50px 0;
    padding: 0;
    list-style-type: none;
}

li {
    display: inline;
    margin-right: 25px;
}

a {
    color: darkcyan;
}

li:last-child a {
    color: darkred;
}
</style>

