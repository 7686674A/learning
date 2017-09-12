<?php
/**
 * Created by PhpStorm.
 * User: liumaxiao
 * Date: 2017/9/8
 * Time: 16:24
 */
namespace console\controllers;

use Yii;
use yii\console\Controller;

/**
 * Test Console Application
 */
class TestController extends Controller
{

    public function actionIndex ($name,$age)
    {
        echo "name is {$name}\n";
        echo "age is {$age}\n";
        return self::EXIT_CODE_NORMAL;
    }

}