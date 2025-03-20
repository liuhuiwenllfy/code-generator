package cn.liulingfengyu.codegenerator.convert;

import cn.hutool.core.util.StrUtil;
import org.apache.commons.lang3.StringUtils;

/**
 * @author 刘凌枫羽工作室
 */
public class TableNameConvert {

    /**
     * 转大驼峰
     *
     * @param tableName      表名
     * @param isRemovePrefix 是否去除前缀
     * @return {@link String}
     */
    public static String convertGreatHumpDelPrefix(String tableName, boolean isRemovePrefix) {
        if (isRemovePrefix) {
            int i = tableName.indexOf("_");
            if (i > 0) {
                tableName = tableName.substring(i + 1);
            }
        }
        return StringUtils.capitalize(StrUtil.toCamelCase(tableName));
    }

    /**
     * 转小驼峰
     *
     * @param tableName      表名
     * @param isRemovePrefix 是否去除前缀
     * @return {@link String}
     */
    public static String convertHumpDelPrefix(String tableName, boolean isRemovePrefix) {
        if (isRemovePrefix) {
            int i = tableName.indexOf("_");
            if (i > 0) {
                tableName = tableName.substring(i + 1);
            }
        }
        return StrUtil.toCamelCase(tableName);
    }
}
