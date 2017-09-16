<?php

namespace backend\models;

use Yii;
use yii\web\UploadedFile;

/**
 * This is the model class for table "file".
 *
 * @property integer $id
 * @property string $file
 */
class File extends \yii\db\ActiveRecord
{
    /**
     * @var UploadedFile file attribute
     */
    public $file;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'file';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['file'], 'file'],
            [['file'], 'file', 'skipOnEmpty' => false],
            [['file'], 'file', 'extensions' => 'jpg, png', 'mimeTypes' => 'image/jpeg, image/png',],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'file' => 'File',
        ];
    }
}
