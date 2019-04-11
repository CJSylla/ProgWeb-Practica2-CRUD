<!DOCTYPE html>
<html>
<head>
    <style>
        input[type=text], select, textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-top: 6px;
            margin-bottom: 16px;
            resize: vertical;
        }

        input[type=submit] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type=submit]:hover {
            background-color: #45a049;
        }

        .container {
            border-radius: 5px;
            background-color: #f2f2f2;
            padding: 20px;
        }

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

    </style>
</head>
<body>

<div class="topnav" id="myTopnav">
    <p id="bienvenido">Bienvenido al CRUD de Claude Junior Sylla</p>
    <p id="bienvenido2">Favor llenar el formulario </p>

</div>

<h3>Formulario de estudiante</h3>

<div class="container">



    <form method="post" action="/formulario">

        <label for="matricula">Matricula</label>
        <input type="text" id="matricula" name="matricula" pattern="[0-9]{8}" >


        <label for="nombre">Nombre</label>
        <input type="text" id="nombre" name="nombre"  >

        <label for="apellido">Apellido</label>
        <input type="text" id="apellido" name="apellido"  >

        <label for="telefono">Telefono</label>
        <input type="text" id="telefono" name="telefono" >

        <input type="submit" value="Agregar Estudiante">

    </form>
</div>

</body>
</html>