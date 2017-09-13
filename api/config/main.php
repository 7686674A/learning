<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-frontend',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'controllerNamespace' => 'frontend\controllers',
    'modules' => [
        'v1' => [
            'class' => 'api\modules\v1\Module',
        ],
    ],
    'components' => [
        'response'=>[
            'class' => 'yii\web\Response',
            'on beforeSend' => function ($event) {
                $response = $event->sender;
                // 状态码 比如404,200
                $code = $response->getStatusCode();
                // 信息
                $msg = $response->statusText;
                if ($code == 404) {
                    !empty($response->data['message']) && $msg = $response->data['message'];
                }
                $data = [
                    'code' => $code,
                    'msg' => $msg,
                ];
                $code == 200 && $data['data'] = $response->data;
                $response->data = $data;
                // 响应格式为json
                $response->format = yii\web\Response::FORMAT_JSON;
            },
        ],
        'request' => [
            'csrfParam' => '_csrf-frontend',
        ],
        // 关闭user组件的session会话
        'user' => [
            'identityClass' => 'common\models\User',
            'enableAutoLogin' => true,
            'enableSession' => false,
            'loginUrl' => null,
            // 'identityCookie' => ['name' => '_identity-frontend', 'httpOnly' => true],
        ],
        'session' => [
            // this is the name of the session cookie used for login on the frontend
            'name' => 'advanced-frontend',
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],

        'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'enableStrictParsing' =>true,
            // 加载url-rules.php里面的路由配置
            'rules' => require(__DIR__.'/url-rules.php'),
        ],

    ],
    'params' => $params,
];
