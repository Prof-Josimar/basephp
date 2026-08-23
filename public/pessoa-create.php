<?php
require __DIR__ . '/../vendor/autoload.php';

use App\DAO\PessoaDAO;
use App\Model\Pessoa;

$mensagem = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $pessoa = new Pessoa(
        null,
        $_POST['nome'],
        $_POST['telefone'],
        $_POST['cpf'],
        $_POST['endereco']
    );

    $dao = new PessoaDAO();
    $mensagem = $dao->criar($pessoa)
        ? "✅ Pessoa cadastrada com sucesso!"
        : "❌ Erro ao cadastrar pessoa.";
} 


// conteúdo da página
ob_start();
?>
<h2>Cadastrar Pessoa</h2>

<?php if (!empty($mensagem)): ?>
    <div class="alert alert-info"><?= $mensagem ?></div>
<?php endif; ?>

<form method="POST" action="">
    <div class="mb-3">
        <label for="nome" class="form-label">Nome</label>
        <input type="text" class="form-control" id="nome" name="nome" value="João da Silva" required>
    </div>

    <div class="mb-3">
        <label for="telefone" class="form-label">Telefone</label>
        <input type="text" class="form-control" id="telefone" name="telefone" value="(21) 99999-8888">
    </div>

    <div class="mb-3">
        <label for="cpf" class="form-label">CPF</label>
        <?php 
        $randomNumber = random_int(10000000000, 99999999999);
        
        ?>
        <input type="text" class="form-control" id="cpf" name="cpf" value="<?=  $randomNumber;?>" required>
    </div>

    <div class="mb-3">
        <label for="endereco" class="form-label">Endereço</label>
        <input type="text" class="form-control" id="endereco" name="endereco" value="Rua das Flores, 123 - Japeri/RJ">
    </div>

    <button type="submit" class="btn btn-primary">Salvar</button>
</form>
<?php
$content = ob_get_clean();
require __DIR__ . '/layout.php';
