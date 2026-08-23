@echo off

cls
color 4f
REM Verifica se foi passado o parâmetro /run
if "%~1" neq "/run" (
    echo Uso incorreto! Execute assim:
    echo init4.cmd /run
    exit /b
)



chcp 65001 >nul
echo ============================================
echo FECHE AS PROXIMAS JANELAS COM EXIT
echo ============================================
echo.
echo TECLE ENTER PARA COMEÇAR
pause
color 1e
cls
echo.
set /p nome=Digite seu nome ? 


if "%nome%"=="" (
    set nome=Desconhecido
)

REM Inicializa composer.json e autoload
echo Feche a proxima janela com exit
start /wait composer init --name="meuprojeto/mvc" --description="Projeto MVC em PHP de %nome%" --author="%nome% <%nome%@email.com>" --require="php:^8.2" --no-interaction
echo Feche a proxima janela com exit
start /wait composer dump-autoload

REM Script para gerar estrutura MVC PHP básica
set BASEDIR=%cd%

echo Criando estrutura de pastas em %BASEDIR%...

REM Cria pastas principais (ignora erro se já existirem)
mkdir "%BASEDIR%\src" 2>nul
mkdir "%BASEDIR%\src\Controller" 2>nul
mkdir "%BASEDIR%\src\Model" 2>nul
mkdir "%BASEDIR%\src\DAO" 2>nul
mkdir "%BASEDIR%\src\Config" 2>nul
mkdir "%BASEDIR%\src\View" 2>nul
mkdir "%BASEDIR%\public" 2>nul

if exist "%BASEDIR%\public\index.php" (
    echo AVISO: public\index.php ja existe e sera SOBRESCRITO por uma versao minima.
    pause
)

REM Cria index.php dentro de public
> "%BASEDIR%\public\index.php" echo ^<?php
>> "%BASEDIR%\public\index.php" echo $content = ob_get_clean();
>> "%BASEDIR%\public\index.php" echo require "layout.php";
>> "%BASEDIR%\public\index.php" echo require __DIR__ . '/../vendor/autoload.php';
>> "%BASEDIR%\public\index.php" echo use App\Controller\HomeController;
>> "%BASEDIR%\public\index.php" echo $controller = new HomeController();
>> "%BASEDIR%\public\index.php" echo echo $controller-^>index();

::>> "%BASEDIR%\public\index.php" echo echo bcadd('1.4142135623730950488016887242', '0', 28);
>> "%BASEDIR%\public\index.php" echo echo "<br>";



>> "%BASEDIR%\public\index.php" echo $diretorio = ".";
>> "%BASEDIR%\public\index.php" echo $arquivos=scandir($diretorio);
>> "%BASEDIR%\public\index.php" echo $excluir = ['index.php','footer.php','layout.php'];
>> "%BASEDIR%\public\index.php" echo foreach ($arquivos as $arquivo) {
>> "%BASEDIR%\public\index.php" echo     if (pathinfo($arquivo, PATHINFO_EXTENSION) === 'php' ^&^& !in_array($arquivo, $excluir)) {
>> "%BASEDIR%\public\index.php" echo         echo '^<a href="' . $diretorio . '/' . $arquivo . '" target="_blank"^>' . $arquivo . '^</a^>^<br^>';
>> "%BASEDIR%\public\index.php" echo     }
>> "%BASEDIR%\public\index.php" echo }
>> "%BASEDIR%\public\index.php" echo require "footer.php";
>> "%BASEDIR%\public\index.php" echo ?^>





REM Cria footer.php dentro de public
> "%BASEDIR%\public\footer.php" echo ^<div class="text-center mt-4"^>
>> "%BASEDIR%\public\footer.php" echo     ^<a href="index.php" class="btn btn-primary"^>Voltar para Início^</a^>
>> "%BASEDIR%\public\footer.php" echo ^</div^>
>> "%BASEDIR%\public\footer.php" echo ^</div^> ^<!-- fechamento do container --^>
>> "%BASEDIR%\public\footer.php" echo ^<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"^>^</script^>
>> "%BASEDIR%\public\footer.php" echo ^</body^>
>> "%BASEDIR%\public\footer.php" echo ^</html^>



@echo off
REM Cria footer.php dentro de public com verificação de index.php
echo ^<?php if (basename($_SERVER['SCRIPT_NAME']) ^!== 'index.php'): ?^> > "%BASEDIR%\public\footer.php"
echo     ^<div class="text-center mt-4"^> >> "%BASEDIR%\public\footer.php"
echo         ^<a href="index.php" class="btn btn-primary"^>Voltar para Início^</a^> >> "%BASEDIR%\public\footer.php"
echo     ^</div^> >> "%BASEDIR%\public\footer.php"
echo ^<?php endif; ?^> >> "%BASEDIR%\public\footer.php"







REM Cria layout.php dentro de public
> "%BASEDIR%\public\layout.php" echo ^<!DOCTYPE html^>
>> "%BASEDIR%\public\layout.php" echo ^<html lang="pt-br"^>
>> "%BASEDIR%\public\layout.php" echo ^<head^>
>> "%BASEDIR%\public\layout.php" echo     ^<meta charset="UTF-8"^>
>> "%BASEDIR%\public\layout.php" echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
>> "%BASEDIR%\public\layout.php" echo     ^<title^>Meu Site^</title^>
>> "%BASEDIR%\public\layout.php" echo     ^<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"^>
>> "%BASEDIR%\public\layout.php" echo ^</head^>
>> "%BASEDIR%\public\layout.php" echo ^<body class="bg-light"^>

REM Navbar
>> "%BASEDIR%\public\layout.php" echo     ^<!-- NAVBAR --^>
>> "%BASEDIR%\public\layout.php" echo     ^<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow"^>
>> "%BASEDIR%\public\layout.php" echo         ^<div class="container-fluid"^>
>> "%BASEDIR%\public\layout.php" echo             ^<a class="navbar-brand" href="/index.php"^>Nome Do Sistema^</a^>
>> "%BASEDIR%\public\layout.php" echo             ^<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSistema"^>
>> "%BASEDIR%\public\layout.php" echo                 ^<span class="navbar-toggler-icon"^>^</span^>
>> "%BASEDIR%\public\layout.php" echo             ^</button^>
>> "%BASEDIR%\public\layout.php" echo             ^<div class="collapse navbar-collapse" id="navbarSistema"^>
>> "%BASEDIR%\public\layout.php" echo                 ^<ul class="navbar-nav me-auto"^>


>> "%BASEDIR%\public\layout.php" echo                     ^<li class="nav-item dropdown"^>
>> "%BASEDIR%\public\layout.php" echo                         ^<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"^>Menu1^</a^>
>> "%BASEDIR%\public\layout.php" echo                         ^<ul class="dropdown-menu"^>
>> "%BASEDIR%\public\layout.php" echo                             ^<li^>^<a class="dropdown-item" href="/aaaa-create.php"^>Cadastrar^</a^>^</li^>
>> "%BASEDIR%\public\layout.php" echo                             ^<li^>^<a class="dropdown-item" href="/bbb-list.php"^>Listar^</a^>^</li^>
>> "%BASEDIR%\public\layout.php" echo                             ^<li^>^<a class="dropdown-item" href="/ccc-pesquisar.php"^>Pesquisar^</a^>^</li^>
>> "%BASEDIR%\public\layout.php" echo                         ^</ul^>
>> "%BASEDIR%\public\layout.php" echo                     ^</li^>

REM Menu Especialidades
>> "%BASEDIR%\public\layout.php" echo                     ^<li class="nav-item dropdown"^>
>> "%BASEDIR%\public\layout.php" echo                         ^<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"^>Menu2^</a^>
>> "%BASEDIR%\public\layout.php" echo                         ^<ul class="dropdown-menu"^>
>> "%BASEDIR%\public\layout.php" echo                             ^<li^>^<a class="dropdown-item" href="/ddd-create.php"^>Cadastrar^</a^>^</li^>
>> "%BASEDIR%\public\layout.php" echo                             ^<li^>^<a class="dropdown-item" href="/eee-list.php"^>Listar^</a^>^</li^>
>> "%BASEDIR%\public\layout.php" echo                         ^</ul^>
>> "%BASEDIR%\public\layout.php" echo                     ^</li^>

REM Fecha Navbar
>> "%BASEDIR%\public\layout.php" echo                 ^</ul^>
>> "%BASEDIR%\public\layout.php" echo             ^</div^>
>> "%BASEDIR%\public\layout.php" echo         ^</div^>
>> "%BASEDIR%\public\layout.php" echo     ^</nav^>

>> "%BASEDIR%\public\layout.php" echo     ^<div class="container mt-4"^>
>> "%BASEDIR%\public\layout.php" echo         ^<?php echo isset($content) ? $content : ""; ?^>
>> "%BASEDIR%\public\layout.php" echo     ^</div^>

REM Bootstrap JavaScript
>> "%BASEDIR%\public\layout.php" echo     ^<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"^>^</script^>

REM Fecha HTML
>> "%BASEDIR%\public\layout.php" echo ^</body^>
>> "%BASEDIR%\public\layout.php" echo ^</html^>











REM Cria composer.json básico (linha a linha, sem parênteses)
> "%BASEDIR%\composer.json" echo {
>> "%BASEDIR%\composer.json" echo   "name": "projeto/mvc",
>> "%BASEDIR%\composer.json" echo   "description": "Projeto MVC em PHP",
>> "%BASEDIR%\composer.json" echo   "require": {
>> "%BASEDIR%\composer.json" echo     "php": "^8.2"
>> "%BASEDIR%\composer.json" echo   },
>> "%BASEDIR%\composer.json" echo   "autoload": {
>> "%BASEDIR%\composer.json" echo     "psr-4": {
>> "%BASEDIR%\composer.json" echo       "App\\": "src/"
>> "%BASEDIR%\composer.json" echo     }
>> "%BASEDIR%\composer.json" echo   }
>> "%BASEDIR%\composer.json" echo }



REM Cria HomeController.php em src\Controller


REM Cria HomeController.php em src\Controller
> "%BASEDIR%\src\Controller\HomeController.php" echo ^<?php
>> "%BASEDIR%\src\Controller\HomeController.php" echo namespace App\Controller^;
>> "%BASEDIR%\src\Controller\HomeController.php" echo.
>> "%BASEDIR%\src\Controller\HomeController.php" echo class HomeController {
>> "%BASEDIR%\src\Controller\HomeController.php" echo     public function index() {
>> "%BASEDIR%\src\Controller\HomeController.php" echo         // Define o fuso horário do Brasil
>> "%BASEDIR%\src\Controller\HomeController.php" echo         date_default_timezone_set('America/Sao_Paulo');
>> "%BASEDIR%\src\Controller\HomeController.php" echo.
>> "%BASEDIR%\src\Controller\HomeController.php" echo         // Define locale para português do Brasil
>> "%BASEDIR%\src\Controller\HomeController.php" echo         setlocale(LC_TIME, 'pt_BR.UTF-8', 'pt_BR', 'portuguese');
>> "%BASEDIR%\src\Controller\HomeController.php" echo.
>> "%BASEDIR%\src\Controller\HomeController.php" echo         $dataHora = date("d/m/Y H:i:s");
>> "%BASEDIR%\src\Controller\HomeController.php" echo.
>> "%BASEDIR%\src\Controller\HomeController.php" echo         return "<center>"
>> "%BASEDIR%\src\Controller\HomeController.php" echo             . "<h1 style='color:darkblue;font-family:Arial;'>Bem-vindo ao Projeto MVC de %nome%!</h1>"
>> "%BASEDIR%\src\Controller\HomeController.php" echo             . "<hr style='width:50%;border:1px solid darkblue;'>"
>> "%BASEDIR%\src\Controller\HomeController.php" echo             . "<p style='font-size:18px;color:gray;'>Servidor iniciado em : <b>$dataHora</b></p>"
>> "%BASEDIR%\src\Controller\HomeController.php" echo         . "</center>";
>> "%BASEDIR%\src\Controller\HomeController.php" echo     }
>> "%BASEDIR%\src\Controller\HomeController.php" echo }


REM Cria server.cmd na raiz do projeto
> "%BASEDIR%\server.cmd" echo @echo off
>> "%BASEDIR%\server.cmd" echo REM Script para iniciar servidor PHP embutido
>> "%BASEDIR%\server.cmd" echo.
>> "%BASEDIR%\server.cmd" echo start c:\xampp\php\php -S 127.0.0.1:8000 -t public
>> "%BASEDIR%\server.cmd" echo timeout /t 2 ^>nul
>> "%BASEDIR%\server.cmd" echo start http://127.0.0.1:8000




> "%BASEDIR%\bkp.cmd" echo @echo off
>> "%BASEDIR%\bkp.cmd" echo cls
>> "%BASEDIR%\bkp.cmd" echo color 1e
>> "%BASEDIR%\bkp.cmd" echo.
>> "%BASEDIR%\bkp.cmd" echo echo Caminho completo: %%cd%%
>> "%BASEDIR%\bkp.cmd" echo.
>> "%BASEDIR%\bkp.cmd" echo :: Pega apenas o nome da pasta atual
>> "%BASEDIR%\bkp.cmd" echo for %%%%i in ("%%cd%%") do set "pasta=%%%%~nxi"
>> "%BASEDIR%\bkp.cmd" echo echo Última pasta: %%pasta%%
>> "%BASEDIR%\bkp.cmd" echo.
>> "%BASEDIR%\bkp.cmd" echo if not exist \temp mkdir \temp
>> "%BASEDIR%\bkp.cmd" echo start winrar a -afzip -r -ep1 \temp\%%pasta%%.zip *
>> "%BASEDIR%\bkp.cmd" echo start explorer c:\temp


echo Feche a proxima janela com exit
start /wait composer dump-autoload
echo Feche a proxima janela com exit 
start /wait composer install
color
cls
echo ========================================================
echo AGORA VOCE PODE INICIAR O SERVIDOR digitando server.cmd
echo.
echo E ABRIR O Visual Studio Code NESTA PASTA DIGITANDO :
echo.
echo vscode .\
echo ========================================================
