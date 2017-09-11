<?php
/**
 * Created by PhpStorm.
 * User: liumaxiao
 * Date: 2017/9/8
 * Time: 16:24
 */
namespace console\controller;

use Yii;
use yii\console\Controller;

/**
 * Test console Application
 */
class TestController extends Controller
{
    public function actionIndex()
    {
        echo "This is my first console application.";
    }
}