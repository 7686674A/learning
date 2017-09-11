<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-backend',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'backend\controllers',
    'bootstrap' => ['log'],
    'modules' => [
        'admin' => [
            'class' => 'mdm\admin\Module',
        ],
        'redactor' => [
            'class' => 'backend\components\RedactorModule',
            'uploadDir' => './uploads',  // 比如这里可以填写 ./uploads   文件保存目录
            'uploadUrl' => './uploads',
            'imageAllowExtensions'=>['jpg','png','gif']
        ],

    ],
    'aliases' => [
        '@mdm/admin' => '@vendor/mdmsoft/yii2-admin',
    ],
    'components' => [
        'request' => [
            'csrfParam' => '_csrf-backend',
        ],
        'user' => [
            // 指定后台的用户表
            'identityClass' => 'backend\models\UserBackend',
            'enableAutoLogin' => true,
            'identityCookie' => ['name' => '_identity-backend', 'httpOnly' => true],
        ],
        'session' => [
            // this is the name of the session cookie used for login on the backend
            'name' => 'advanced-backend',
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
            // 是否开启美化效果
            // false：/index.php?r=blog%2Findex
            // true：/index.php/blog/index
            'enablePrettyUrl' => true,
            // 是否或略脚本名index.php
            'showScriptName' => false,
            // 是否开启严格解析路由
            'enableStrictParsing' => false,
            'suffix' => '',
            'rules' => [
                '/blogs/<id:\d+>' => '/blog/view',
                "<controller:\w+>/<action:\w+>"=>"<controller>/<action>",
            ],
        ],
        'assetManager' => [
            'bundles' => [
                'dmstr\web\AdminLteAsset' => [
                    'skin' => 'skin-black-light',
                ],
            ],
        ],
        // 权限管理
        'authManager' => [
            'class' => 'yii\rbac\DbManager',
            'defaultRoles' => ['guest'],
        ],
        // 主题
        /*'view' => [
            'theme' => [
                // 'basePath' => '@app/themes/spring',
                // 'baseUrl' => '@web/themes/spring',
                'pathMap' => [
                    // 将app/view替换为app/themes/spring
                    '@app/views' => [
                        '@app/themes/christmas',
                        '@app/themes/spring',
                    ]
                ],
            ],
        ],*/
    ],
    // 权限
    'as access' => [
        'class' => 'mdm\admin\components\AccessControl',
        'allowActions' => [
            //这里是允许访问的action，不受权限控制
            //controller/action
//            'site/*',
//            'gii/*',
            '*',
        ]
    ],
    // 主题
    'as theme' => [
        'class' => 'backend\components\ThemeController',
    ],
    // 加载自定义的行为类
//    'as myBehavior2' => \backend\components\MyBehavior::className(),
    'params' => $params,
];
