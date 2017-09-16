<?php
/**
 * Created by PhpStorm.
 * User: liumaxiao
 * Date: 2017/9/15
 * Time: 9:56
 */
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use backend\models\File;
use yii\web\UploadedFile;

class FileController extends Controller
{
    public function actionIndex()
    {
        $model = new File;
        return $this->render('index',[
            'model'=>$model
        ]);
    }

    public function actionUpload()
    {
        $model = new File();

        if (Yii::$app->request->isPost) {
            $model->file = UploadedFile::getInstance($model, 'file');

            if ($model->file && $model->validate()) {
                $model->file->saveAs(str_replace('\\','/',Yii::$app->basePath).'/../uploads/' . time() . '.' . $model->file->extension);
                echo $model->file->baseName;
                echo '<br>';
                echo Yii::$app->basePath;die;
            }else{
                return '文件格式不符合';
            }
        }else{
            return '请求方式不允许';
        }

        return $this->render('upload', ['model' => $model]);
    }
}