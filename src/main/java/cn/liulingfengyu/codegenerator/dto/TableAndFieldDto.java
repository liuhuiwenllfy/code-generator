package cn.liulingfengyu.codegenerator.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

/**
 * @author 刘凌枫羽工作室
 */
@Getter
@Setter
public class TableAndFieldDto {

    @Schema(description = "是否生成树结构查询接口", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "是否生成树结构查询接口不能为空")
    private Boolean isGenerateTreeSelect;

    @Schema(description = "是否生成菜单", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "是否生成菜单不能为空")
    private Boolean isGenerateMenu;

    @Schema(description = "是否开启缓存", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "是否开启缓存不能为空")
    private Boolean isCache;

    @Schema(description = "缓存key字段")
    private String cacheKey;

    @Schema(description = "缓存value字段")
    private String cacheValue;

    @Schema(description = "数据库连接")
    @NotBlank(message = "数据库连接不能为空")
    private String databaseConnectionId;

    @Schema(description = "数据库名称")
    @NotBlank(message = "数据库名称不能为空")
    private String databaseName;

    @Schema(description = "表名称")
    @NotBlank(message = "表名称不能为空")
    private String tableName;

    @Schema(description = "表注释")
    private String tableComment;

    @Schema(description = "页面图标")
    private String tableIcon;

    @Schema(description = "字段名称")
    @NotBlank(message = "字段名称不能为空")
    private String columnName;

    @Schema(description = "字段注释")
    private String columnComment;

    @Schema(description = "字段类型(带有长度)", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "字段类型不能为空")
    private String columnType;

    @Schema(description = "字段长度", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "字段长度不能为空")
    private Integer characterMaximumLength;

    @Schema(description = "数据库字段类型", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "数据库字段类型不能为空")
    private String dataType;

    @Schema(description = "java字段类型", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "java字段类型不能为空")
    private String javaType;

    @Schema(description = "ts字段类型", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "ts字段类型不能为空")
    private String tsType;

    @Schema(description = "是否自动填充")
    private Boolean isAutofill;

    @Schema(description = "自动填充规则 INSERT；INSERT_UPDATE；UPDATE")
    private String autofillRule;

    @Schema(description = "是否作为新增参数")
    private Boolean isAddParam;

    @Schema(description = "是否作为条件")
    private Boolean isCondition;

    @Schema(description = "是否模糊查询")
    private Boolean isFuzzyQuery;

    @Schema(description = "是否逻辑删除")
    private Boolean isLogicDelete;

    @Schema(description = "是否是主键")
    private Boolean isPrimaryKey;

    @Schema(description = "是否展示表格")
    private Boolean isShow;

    @Schema(description = "是否在详情中展示")
    private Boolean isShowDetails;

    @Schema(description = "是否作为修改参数")
    private Boolean isUpdateParam;

    @Schema(description = "是否乐观锁")
    private Boolean isVersion;

    @Schema(description = "是否必填")
    private Boolean isRequiredField;

    @Schema(description = "UI类型")
    private String uiType;

    @Schema(description = "是否展示字典数据")
    private Boolean isShowDict;

    @Schema(description = "选择框字典分组（用于选择框下拉展示的字典集合，不通过字典查询可不传入）")
    private String dictGroup;

    @Schema(description = "关联数据库")
    private String associatedDatabase;

    @Schema(description = "关联表")
    private String associatedTable;

    @Schema(description = "下拉Key字段")
    private String dropdownKey;

    @Schema(description = "下拉Value字段")
    private String dropdownValue;
}
