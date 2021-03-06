<?php
defined('YII_DEBUG') or define('YII_DEBUG', true);
defined('YII_ENV') or define('YII_ENV', 'dev');

require(__DIR__ . '/../../vendor/autoload.php');
require(__DIR__ . '/../../vendor/yiisoft/yii2/Yii.php');
require(__DIR__ . '/../../common/config/bootstrap.php');
require(__DIR__ . '/../config/bootstrap.php');

$config = yii\helpers\ArrayHelper::merge(
    require(__DIR__ . '/../../common/config/main.php'),
    require(__DIR__ . '/../../common/config/main-local.php'),
    require(__DIR__ . '/../config/main.php'),
    require(__DIR__ . '/../config/main-local.php')
);

$application = new yii\web\Application($config);
Yii::$app->on(yii\base\Application::EVENT_BEFORE_REQUEST, function ($event) {
    yii::info('This is beforeRequest event.');
});
Yii::$app->on(yii\base\Application::EVENT_AFTER_REQUEST, function ($event) {
    yii::info('This is afterRequest event.');
});
$application->run();

//(new yii\web\Application($config))->run();