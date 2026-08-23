
<?php
// Aqui você define o conteúdo específico da página
$content = "
    <h2>Cadastrar Item</h2>
    <form>
        <div class='mb-3'>
            <label for='nome' class='form-label'>Nome</label>
            <input type='text' class='form-control' id='nome' name='nome'>
        </div>
        <button type='submit' class='btn btn-primary'>Salvar</button>
    </form>
";

// Depois inclui o layout
include("layout.php");
?>
