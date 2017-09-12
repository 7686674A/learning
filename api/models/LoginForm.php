<?php
namespace api\models;

use Yii;
use yii\base\Model;
use common\models\User;

/**
 * Login form
 */
class LoginForm extends Model
{
    public $username;
    public $password;

    private $_user;
    const GET_API_TOKEN = 'generate_api_token';

    public function init()
    {
        parent::init(); // TODO: Change the autogenerated stub
        $this->on(self::GET_API_TOKEN,[$this,'onGenerateApiToken']);
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            // username和password必须
            [['username', 'password'], 'required'],
            // 这里需要注意的是 validatePassword 是自定义的验证方法！！！只需要在当前模型内增加对应的认证方法即可
            ['password', 'validatePassword'],
        ];
    }

    /**
     * Validates the password.
     * This method serves as the inline validation for password.
     *
     * @param string $attribute the attribute currently being validated
     * @param array $params the additional name-value pairs given in the rule
     */
    public function validatePassword($attribute, $params)
    {
        // hasErrors方法，用于获取rule失败的数据
        if (!$this->hasErrors()) {
            // 调用当前模型的getUser方法获取用户
            $this->_user = $this->getUser();
            // 获取到用户信息，然后校验用户的密码对不对，校验密码调用的是 backend\models\UserBackend 的validatePassword方法，
            // 这个我们下面会在UserBackend方法里增加
            if (!$this->_user || !$this->_user->validatePassword($this->password)) {
                // 验证失败，调用addError方法给用户提醒信息
                $this->addError($attribute, '用户名或密码错误.');
            }
        }
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'username' => '用户名',
            'password' => '密码',
        ];
    }

    /**
     * Logs in a user using the provided username and password.
     *
     * @return bool whether the user is logged in successfully
     */
    public function login()
    {
        // 调用validate方法 进行rule的校验，其中包括用户是否存在和密码是否正确的校验
        if ($this->validate()) {
            $this->trigger(self::GET_API_TOKEN);
            // 校验成功后，session保存用户信息
            return $this->_user;
        } else {
            return null;
        }
    }

    /**
     * 根据用户名获取用户的认证信息
     *
     * @return User|null
     */
    protected function getUser()
    {
        if ($this->_user === null) {
            // 根据用户名 调用认证类 backend\models\UserBackend 的 findByUsername 获取用户认证信息
            // 这个我们下面会在UserBackend增加一个findByUsername方法对其实现
            $this->_user = User::findByUsername($this->username);
        }

        return $this->_user;
    }

    /**
     * 登录校验成功后，为用户生成新的token
     * 如果token失效，则重新生成token
     */
    public function onGenerateApiToken()
    {
        if (!User::apiTokenIsValid($this->_user->api_token)){
            $this->_user->generateApiToken();
            $this->_user->save();
        }
    }
}