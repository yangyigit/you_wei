<?php
/**
 * 易优CMS
 * ============================================================================
 * 版权所有 2016-2028 海南赞赞网络科技有限公司，并保留所有权利。
 * 网站地址: http://www.eyoucms.com
 * ----------------------------------------------------------------------------
 * 如果商业用途务必到官方购买正版授权, 以免引起不必要的法律纠纷.
 * ============================================================================
 * Author: 小虎哥 <1105415366@qq.com>
 * Date: 2018-4-3
 */

// 用户自定义函数文件，函数名必须以 diy_ 前缀开头，避免与官方函数冲突报错

if (!function_exists('diy_number_format')) {
    /**
     * 将价格格式还原为普通价格
     */
    function diy_number_format($price = '')
    {
        $price = str_replace(',', '', $price);
        $price = preg_replace('/^(\d+)\.00/i', '${1}', $price);
        return $price;
    }
}