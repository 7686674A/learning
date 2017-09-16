<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use backend\models\Category;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model common\models\Blog */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="blog-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'content')->widget(\yii\redactor\widgets\Redactor::className(), [
        'clientOptions' => [
            'imageManagerJson' => ['/redactor/upload/image-json'],
            'imageUpload' => ['/redactor/upload/image'],
            'fileUpload' => ['/redactor/upload/file'],
            'lang' => 'zh_cn',
            // 插件
            'plugins' => ['clips', 'fontcolor','imagemanager']
        ]
    ]) ?>

    <?= $form->field($model, 'file')->widget('manks\FileInput', [
    ]); ?>

    <?= $form->field($model, 'file2')->widget('manks\FileInput', [
        'clientOptions' => [
            'pick' => [
                'multiple' => true,
            ],
            /*'server' => Url::to('upload/u2'),
            'accept' => [
                'extensions' => 'png',
            ],*/
        ],
    ]); ?>

    <?= $form->field($model, 'views')->textInput() ?>

    <?= $form->field($model, 'is_delete')->textInput() ?>

    <?= $form->field($model, 'category')->label('栏目')->checkboxList(Category::dropDownList())?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
