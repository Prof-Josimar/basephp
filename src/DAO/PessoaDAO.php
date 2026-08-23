<?php
namespace App\DAO;

use App\Config\Database;
use App\Model\Pessoa;
use PDO;

class PessoaDAO
{
    private PDO $pdo;

    public function __construct()
    {
        $this->pdo = Database::getConexao();
    }

    // Criar nova pessoa
    public function criar(Pessoa $pessoa): bool
    {
        $sql = "INSERT INTO pessoas (nome, telefone, cpf, endereco) 
                VALUES (:nome, :telefone, :cpf, :endereco)";
        $stmt = $this->pdo->prepare($sql);
        return $stmt->execute([
            ':nome' => $pessoa->getNome(),
            ':telefone' => $pessoa->getTelefone(),
            ':cpf' => $pessoa->getCpf(),
            ':endereco' => $pessoa->getEndereco()
        ]);
    }

    // Listar todas as pessoas
    public function listar(): array
    {
        $stmt = $this->pdo->query("SELECT * FROM pessoas");
        $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $pessoas = [];
        foreach ($resultados as $row) {
            $pessoas[] = new Pessoa(
                $row['id'],
                $row['nome'],
                $row['telefone'],
                $row['cpf'],
                $row['endereco'],
                $row['createdAt'],
                $row['updatedAt']
            );
        }
        return $pessoas;
    }

    // Buscar pessoa por ID
    public function buscarPorId(int $id): ?Pessoa
    {
        $stmt = $this->pdo->prepare("SELECT * FROM pessoas WHERE id = :id");
        $stmt->execute([':id' => $id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row) {
            return new Pessoa(
                $row['id'],
                $row['nome'],
                $row['telefone'],
                $row['cpf'],
                $row['endereco'],
                $row['createdAt'],
                $row['updatedAt']
            );
        }
        return null;
    }

    // Atualizar pessoa
    public function atualizar(Pessoa $pessoa): bool
    {
        $sql = "UPDATE pessoas 
                SET nome = :nome, telefone = :telefone, cpf = :cpf, endereco = :endereco 
                WHERE id = :id";
        $stmt = $this->pdo->prepare($sql);
        return $stmt->execute([
            ':nome' => $pessoa->getNome(),
            ':telefone' => $pessoa->getTelefone(),
            ':cpf' => $pessoa->getCpf(),
            ':endereco' => $pessoa->getEndereco(),
            ':id' => $pessoa->getId()
        ]);
    }

    // Deletar pessoa
    public function deletar(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM pessoas WHERE id = :id");
        return $stmt->execute([':id' => $id]);
    }
}
