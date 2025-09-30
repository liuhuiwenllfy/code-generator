package cn.liulingfengyu.codegenerator.bo;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * 模板表信息Bo
 *
 * @author 刘凌枫羽工作室
 */
@Getter
@Setter
public class TableInfoBo {

    /**
     * 数据库名称
     */
    private String databaseName;

    /**
     * 表名称
     */
    private String tableName;

    /**
     * 表名称大驼峰
     */
    private String tableNameGreatHump;

    /**
     * 表名称小驼峰
     */
    private String tableNameHump;

    /**
     * 表注释
     */
    private String tableComment;

    /**
     * 是否生成树结构查询接口
     */
    private Boolean isGenerateTreeSelect;

    /**
     * 是否开启缓存
     */
    private Boolean isCache;

    /**
     * 缓存key字段小驼峰
     */
    private String cacheKeyHump;

    /**
     * 缓存key字段大驼峰
     */
    private String cacheKeyBigHump;

    /**
     * 缓存value字段小驼峰
     */
    private String cacheValueHump;

    /**
     * 缓存value字段大驼峰
     */
    private String cacheValueBigHump;

    /**
     * 字段信息
     */
    private List<TableField> tableField;

    @Getter
    @Setter
    public static class TableField {

        /**
         * 字段名称
         */
        private String columnName;

        /**
         * 字段名称小驼峰
         */
        private String columnNameHump;

        /**
         * 字段名称大驼峰
         */
        private String columnNameBigHump;

        /**
         * 字段类型(带有长度)
         */
        private String columnType;

        /**
         * 字段长度
         */
        private Integer characterMaximumLength;

        /**
         * 数据库字段类型
         */
        private String dataType;

        /**
         * java字段类型
         */
        private String javaType;

        /**
         * ts字段类型
         */
        private String tsType;

        /**
         * 字段注释
         */
        private String columnComment;

        /**
         * 是否是主键
         */
        private Boolean isPrimaryKey;

        /**
         * 是否自动填充
         */
        private Boolean isAutofill;

        /**
         * 自动填充规则 INSERT；INSERT_UPDATE；UPDATE
         */
        private String autofillRule;

        /**
         * 是否逻辑删除
         */
        private Boolean isLogicDelete;

        /**
         * 是否乐观锁
         */
        private Boolean isVersion;

        /**
         * 是否展示
         */
        private Boolean isShow;

        /**
         * 是否在详情中展示
         */
        private Boolean isShowDetails;

        /**
         * 是否作为条件
         */
        private Boolean isCondition;

        /**
         * 是否模糊查询
         */
        private Boolean isFuzzyQuery;

        /**
         * 是否作为新增参数
         */
        private Boolean isAddParam;

        /**
         * 是否作为修改参数
         */
        private Boolean isUpdateParam;

        /**
         * 是否必填
         */
        private Boolean isRequiredField;

        /**
         * UI类型
         */
        private String uiType;

        /**
         * 是否展示字典数据
         */
        private Boolean isShowDict;

        /**
         * 选择框字典分组（用于选择框下拉展示的字典集合，不通过字典查询可不传入）
         */
        private String dictGroup;

        /**
         * 关联数据库小驼峰
         */
        private String associatedDatabaseHump;

        /**
         * 关联数据库大驼峰
         */
        private String associatedDatabaseBigHump;

        /**
         * 关联表小驼峰
         */
        private String associatedTableHump;

        /**
         * 关联表大驼峰
         */
        private String associatedTableBigHump;

        /**
         * 下拉Key字段小驼峰
         */
        private String dropdownKeyHump;

        /**
         * 下拉Key字段大驼峰
         */
        private String dropdownKeyBigHump;

        /**
         * 下拉Value字段小驼峰
         */
        private String dropdownValueHump;

        /**
         * 下拉Value字段大驼峰
         */
        private String dropdownValueBigHump;
    }
}
