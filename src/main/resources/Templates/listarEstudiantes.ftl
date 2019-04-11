<!DOCTYPE html>
<html>
<head>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tr:hover{background-color:#f5f5f5}

        .button {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 2px 5px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 15px;
            margin: 4px 2px;
            cursor: pointer;
        }

        .button2 {background-color: #008CBA;} /* Blue */

        /* Add a black background color to the top navigation */
        .topnav {
            background-color: lightblue;
            overflow: hidden;
        }

        #myTopnav{

            height: 150px;
        }

        #bienvenido{
            color: black;
            font-family:fantasy;

            margin: auto;
            align-self: center;
            font-size: 50px;
            margin-left: 5%;
        }

        #bienvenido2{
            color: black;
            font-family:fantasy;
            margin: auto;
            align-self: center;
            font-size: 20px;
            margin-left: 5%;
            margin-top: 2%;
        }

        .counterCell:before {
            content: counter(tableCount);
            counter-increment: tableCount;
        }

        #boton{
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 2px 5px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 30px;
            margin-right: 50px;
            cursor: pointer;
            float: right;
        }

    </style>

</head>
<nav>


</nav>

<body>

<div class="topnav" id="myTopnav">
    <p id="bienvenido">Bienvenido al CRUD de Claude Junior Sylla</p>
    <p id="bienvenido2">Aqui se presenta la lista de estudiante</p>
    <a href="/formulario" id="boton">Crear Estudiante</a>
</div>


<p>Con esta lista de estudiante puedes borrar, actualizar informaciones de los estudiantes</p>

<table>
    <table class="table table-responsive table-striped">
        <thead>
        <th>Id</th>
        <th>Matricula</th>
        <th>Nombre</th>
        <th>Apellido</th>
        <th>Telefono</th>
        <th></th>
        <th></th>
        </thead>
        <tr>
            <#list estudiantes as estudiante>

        <tr>
            <th scope="row"> ${estudiante?counter}</th>
            <td>${estudiante.matricula?string.computer}</td>
            <td>${estudiante.nombre}</td>
            <td>${estudiante.apellido}</td>
            <td>${estudiante.telefono}</td>

            <td><a href="/editar/${estudiante.matricula?string.computer}" class="button button2">Editar</a></td>
            <td><a href="/borrar/${estudiante.matricula?string.computer}" class="button button2">Borrar</a></td>


        </tr>
        </#list>

    </table>

</body>
</html>
