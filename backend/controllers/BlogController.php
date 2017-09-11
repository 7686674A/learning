<?php

namespace backend\controllers;

use Yii;
use common\models\Blog;
use common\models\BlogSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use common\models\BlogCategory;
use yii\base\Exception;

/**
 * BlogController implements the CRUD actions for Blog model.
 */
class BlogController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            // 附加行为
//            'myBehavior' => \backend\components\MyBehavior::className(),
            'as access' => [
                'class' => 'backend\components\AccessControl',
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Blog models.
     * @return mixed
     */
    public function actionIndex()
    {
        // 判断是否是游客
        // ①
        /*$myBehavior = $this->getBehavior('myBehavior');
        $isGuest = $myBehavior->isGuest();
        var_dump($isGuest);*/
        // ②
        /*$isGuest = $this->isGuest();
        var_dump($isGuest);*/

        // 判断权限
        if (!Yii::$app->user->can('/blog/index')) {
            throw new \yii\web\ForbiddenHttpException("没权限访问.");
        }

        $searchModel = new BlogSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Blog model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Blog model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Blog();

        // 注意这里调用的是validate，非save,save我们放在了事务中处理了
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            // 开启事务
            $transaction = Yii::$app->db->beginTransaction();
            try{
                $model->save(false);
                // 我们这里是获取刚刚插入blog表的id
                $blogId = $model->id;
                /**
                 * batch insert category
                 * 我们在Blog模型中设置过category字段的验证方式是required,因此下面foreach使用之前无需再做判断
                 */
                $data = [];
                foreach ($model->category as $k => $v){
                    // 注意这里的数组形式[blog_id, category_id]，一定要跟下面batchInsert方法的第二个参数保持一致
                    $data[] = [$blogId,$v];
                }
                // 获取BlogCategory模型的所有属性和表名
                $blogCategory = new BlogCategory;
                $attribute = ['blog_id','category_id'];
                $tableName = $blogCategory::tableName();
                $db = BlogCategory::getDb();
                // 批量插入栏目到BlogCategory::tableName表
                $db->createCommand()->batchInsert(
                    $tableName,
                    $attribute,
                    $data
                )->execute();
                // 提交
                $transaction->commit();
                return $this->redirect(['index']);
            }catch(\Exception $e){
                // 回滚
                $transaction->rollBack();
                throw $e;
            }
        } else {
//            yii::$app->helper->p($model->errors);die;
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Blog model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Blog model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Blog model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Blog the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Blog::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
