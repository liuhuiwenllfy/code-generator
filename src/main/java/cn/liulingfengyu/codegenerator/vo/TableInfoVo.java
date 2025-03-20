package cn.liulingfengyu.codegenerator.vo;

import cn.liulingfengyu.core.config.mybatisplus.entity.BaseInfo;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;


/**
 * <p>
 *
 * </p>
 *
 * @author 刘凌枫羽工作室
 * @since 2024-10-17 16:03:38
 */
@Getter
@Setter
@Schema(name = "TableInfoVo")
public class TableInfoVo extends BaseInfo {

    @Schema(description = "数据库名称")
    private String databaseName;

    @Schema(description = "表名称")
    private String tableName;

    @Schema(description = "字段名称")
    private String columnName;

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

    @Schema(description = "是否展示")
    private Boolean isShow;

    @Schema(description = "是否作为修改参数")
    private Boolean isUpdateParam;

    @Schema(description = "是否乐观锁")
    private Boolean isVersion;
}
