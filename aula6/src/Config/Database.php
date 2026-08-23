<?php

namespace App\Config;

use PDO;
use PDOException;

class Database
{
    private string $host = 'localhost';
    private string $database = 'projeto';
    private string $username = 'root';
    private string $password = '';

    public function conectar(): PDO
    {
        try {

            $dsn = "mysql:host={$this->host};dbname={$this->database};charset=utf8mb4";

            $pdo = new PDO(
                $dsn,
                $this->username,
                $this->password
            );

            $pdo->setAttribute(
                PDO::ATTR_ERRMODE,
                PDO::ERRMODE_EXCEPTION
            );

            $pdo->setAttribute(
                PDO::ATTR_DEFAULT_FETCH_MODE,
                PDO::FETCH_ASSOC
            );

            return $pdo;

        } catch (PDOException $e) {
            throw new PDOException(
                "Erro na conexão com o banco: " . $e->getMessage()
            );
        }


    }
}