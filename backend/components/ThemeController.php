<?php
/**
 * Created by PhpStorm.
 * User: liumaxiao
 * Date: 2017/9/6
 * Time: 15:14
 */
namespace backend\components;

use Yii;
use yii\base\Object;

class ThemeController extends \yii\base\ActionFilter
{
    public function init ()
    {
        $switch = intval(Yii::$app->request->get('switch'));
        $theme = $switch ? 'spring' : 'christmas';

        Yii::$app->view->theme = Yii::createObject([
            'class' => 'yii\base\Theme',
            'pathMap' => [
                '@app/views' => [
                    "@app/themes/{$theme}",
                ]
            ],
        ]);
    }
}