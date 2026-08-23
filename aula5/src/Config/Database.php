<?php
namespace App\Config;

use PDO;
use PDOException;

class Database
{
    private static ?PDO $instancia = null;

    public static function getConexao(): PDO
    {
        if (self::$instancia === null) {
            try {
                $host = "localhost";
                $dbname = "sysfinphp";
                $usuario = "root";
                $senha = "";

                self::$instancia = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $usuario, $senha);
                self::$instancia->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            } catch (PDOException $e) {
                die("Erro na conexão: " . $e->getMessage());
            }
        }

        return self::$instancia;
    }
}
