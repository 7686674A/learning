<?php
/**
 * Created by PhpStorm.
 * User: liumaxiao
 * Date: 2017/8/30
 * Time: 15:37
 */
namespace common\components;
class Helper
{
    //打印的函数
    public static function p($data){
        // 定义样式
        $str='<pre style="display: block;padding: 9.5px;margin: 44px 0 0 0;font-size: 13px;line-height: 1.42857;color: #333;word-break: break-all;word-wrap: break-word;background-color: #F5F5F5;border: 1px solid #CCC;border-radius: 4px;">';
        // 如果是boolean或者null直接显示文字；否则print
        if (is_bool($data)) {
            $show_data=$data ? 'true' : 'false';
        }elseif (is_null($data)) {
            $show_data='null';
        }else{
            $show_data=print_r($data,true);
        }
        $str.=$show_data;
        $str.='</pre>';
        echo $str;
    }

    // 生成随机数
    public static function create_rand($pw_length)
    {
        // 密码字符集，可任意添加你需要的字符
        $chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
            $password = '';
        for ( $i = 0; $i < $pw_length; $i++ )
        {
        // 这里提供两种字符获取方式
        // 第一种是使用 substr 截取$chars中的任意一位字符；
        // 第二种是取字符数组 $chars 的任意元素
        // $password .= substr($chars, mt_rand(0, strlen($chars) – 1), 1);
            $password .= $chars[ mt_rand(0, strlen($chars) - 1) ];
        }
        return $password;
    }

    // 生成不重复的文件名
    public static function file_rename($length = 6,$pw_length = 4)
    {
        $str = substr(time(),10-$length,$length).self::create_rand($pw_length);
        return $str;
    }
}