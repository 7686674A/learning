<?php
/**
 * Created by PhpStorm.
 * User: liumaxiao
 * Date: 2017/9/14
 * Time: 13:21
 */
namespace common\components;
use Yii;
use yii\base\Model;
use yii\web\UploadedFile;
use yii\base\Exception;
use yii\helpers\FileHelper;
/**
 * 文件上传处理
 */
class Upload extends Model
{
    public $file;
    private $_appendRules;
    public function init ()
    {
        parent::init();
        $extensions = Yii::$app->params['webuploader']['baseConfig']['accept']['extensions'];
        $this->_appendRules = [
            [['file'], 'file', 'extensions' => $extensions],
        ];
    }
    public function rules()
    {
        $baseRules = [];
        return array_merge($baseRules, $this->_appendRules);
    }
    /**
     *
     */
    public function upImage ()
    {
        $model = new static;
        $model->file = UploadedFile::getInstanceByName('file');
        if (!$model->file) {
            return false;
        }
        $relativePath = $successPath = '';
        if ($model->validate()) {
            $relativePath = Yii::$app->params['imageUploadRelativePath'];
            $successPath = Yii::$app->params['imageUploadSuccessPath'];
            $fileName = Yii::$app->helper->file_rename() .'.'. $model->file->extension;
            //$rootpath 项目的根目录
            $rootpath = str_replace('\\','/',Yii::$app->basePath).'/../';
            if (!is_dir($relativePath)) {
                FileHelper::createDirectory($relativePath);
            }

            $model->file->saveAs($rootpath.$relativePath . $fileName);

            return [
                'code' => 0,
                'url' => Yii::$app->params['domain'] . $successPath . $fileName,
                'attachment' => $successPath . $fileName
            ];
        } else {
            $errors = $model->errors;
            return [
                'code' => 1,
                'msg' => current($errors)[0]
            ];
        }
    }
}