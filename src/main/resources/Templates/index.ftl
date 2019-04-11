<!DOCTYPE html>
<html>
<head>
    <style>

        .button {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 20px 50px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 33px;
            margin: 4px 2px;
            cursor: pointer;
        }

        .button2 {background-color: #008CBA;}

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

    </style>

</head>

<body>

<div class="topnav" id="myTopnav">
    <p id="bienvenido">Bienvenido al CRUD de Claude Junior Sylla</p>
    <p id="bienvenido2">Esta es la pagina principal de la aplicacion</p>

</div>

<a href="/formulario" class="button button2">Crear Estudiante</a>
<a href="/listarEstudiantes" class="button button2">Listar Estudiantes</a>
</body>
</html>
