<?php
/**
 * Created by PhpStorm.
 * User: liumaxiao
 * Date: 2017/9/8
 * Time: 10:10
 */
namespace backend\components;

use yii\base\Event;

class MailEvent extends Event
{
    public $email;
    public $subject;
    public $content;
}