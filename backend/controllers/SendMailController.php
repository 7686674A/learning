<?php
/**
 * Created by PhpStorm.
 * User: liumaxiao
 * Date: 2017/9/8
 * Time: 10:03
 */
namespace backend\controllers;
use backend\components\MailEvent;
use Yii;
use yii\web\Controller;

/**
 * 发送邮件
 */
class SendMailController extends Controller
{
    const SEND_MAIL = 'send_mail';

    public function init()
    {
        parent::init(); // TODO: Change the autogenerated stub

        // 绑定邮件类，当事件触发的时候，调用我们刚刚定义的邮件类Mail
        $this->on(self::SEND_MAIL,['backend\components\Mail','sendMail']);
    }

    public function actionSend()
    {
        $event = new MailEvent();
        $event->email = '2460855072@qq.com';
        $event->subject = '事件邮件测试';
        $event->content = '邮件测试内容';
        // 触发邮件事件
        $this->trigger(self::SEND_MAIL,$event);
    }
}