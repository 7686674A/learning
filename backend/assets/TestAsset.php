<?php
/**
 * Created by PhpStorm.
 * User: liumaxiao
 * Date: 2017/9/11
 * Time: 13:48
 */
namespace backend\assets;

use yii\web\AssetBundle;

/**
 * Test asset bundle.
 */
class TestAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/site_test.css',
    ];
    // 加载js
    public $js = [
        'js/test.js'
    ];

    // 加载依赖包test2的内容
    public $depends = [
        'backend\assets\Test2Asset'
    ];
}