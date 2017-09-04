<?php
/**
 * Created by PhpStorm.
 * User: liumaxiao
 * Date: 2017/9/4
 * Time: 9:10
 */
namespace backend\controllers;
use Yii;
use yii\web\Controller;

class RbacController extends Controller
{
    public function actionInit()
    {
        $auth = Yii::$app->authManager;

        // 添加 "/blog/index"权限
        $blogIndex = $auth->createPermission('/blog/index');
        $blogIndex->description = '博客列表';
        $auth->add($blogIndex);

        // 创建一个角色 '博客管理'，并为该角色分配“/blog/index”权限
        $blogManager = $auth->createRole('博客管理');
        $auth->add($blogManager);
        $auth->addChild($blogManager,$blogIndex);

        // 为用户admin（uid = 1） 分配日角色 '博客管理'权限
        $auth->assign($blogManager,1);
    }

    public function actionInit2()
    {
        $auth = Yii::$app->authManager;

        // 添加权限
        $blogView = $auth->createPermission('/blog/view');
        $auth->add($blogView);
        $blogCreate = $auth->createPermission('/blog/create');
        $auth->add($blogCreate);
        $blogUpdate = $auth->createPermission('/blog/update');
        $auth->add($blogUpdate);
        $blogDelete = $auth->createPermission('/blog/delete');
        $auth->add($blogDelete);

        // 分配‘博客管理’权限
        $blogManager = $auth->getRole('博客管理');
        $auth->addChild($blogManager,$blogView);
        $auth->addChild($blogManager,$blogCreate);
        $auth->addChild($blogManager,$blogUpdate);
        $auth->addChild($blogManager,$blogDelete);

    }
}