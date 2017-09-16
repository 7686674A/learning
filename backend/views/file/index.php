<?php
use yii\widgets\ActiveForm;
?>

<?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data'],'action' => ['upload']]) ?>

<?= $form->field($model, 'file')->fileInput() ?>

    <button>Submit</button>

<?php ActiveForm::end() ?>