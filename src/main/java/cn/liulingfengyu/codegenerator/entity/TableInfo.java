package cn.liulingfengyu.codegenerator.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 *
 * </p>
 *
 * @author 刘凌枫羽工作室
 * @since 2024-10-17 16:23:23
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("d_table_info")
@Schema(name = "TableInfo", description = "")
public class TableInfo extends Model<TableInfo> {

    private static final long serialVersionUID = 1L;

    @Schema(description = "数据库连接id")
    private String databaseConnectionId;

    @Schema(description = "自动填充规则 INSERT；INSERT_UPDATE；UPDATE")
    private String autofillRule;

    @Schema(description = "字段名称")
    private String columnName;

    @Schema(description = "字段描述")
    private String columnComment;

    @Schema(description = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    @Schema(description = "创建人")
    @TableField(fill = FieldFill.INSERT)
    private String createUser;

    @Schema(description = "数据库名称")
    private String databaseName;

    @Schema(description = "删除时间")
    @TableField(fill = FieldFill.UPDATE)
    private Date deleteTime;

    @Schema(description = "删除人")
    @TableField(fill = FieldFill.UPDATE)
    private String deleteUser;

    @TableId(value = "id", type = IdType.ASSIGN_UUID)
    @Schema(description = "主键")
    private String id;

    @Schema(description = "是否作为新增参数")
    private Boolean isAddParam;

    @Schema(description = "是否自动填充")
    private Boolean isAutofill;

    @Schema(description = "是否作为条件")
    private Boolean isCondition;

    @Schema(description = "是否删除")
    @TableLogic
    private Boolean isDelete;

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

    @Schema(description = "表名称")
    private String tableName;

    @Schema(description = "UI类型")
    private String uiType;

    @Schema(description = "字典分组名称")
    private String dictGroup;

    @Schema(description = "修改时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @Schema(description = "修改人")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String updateUser;

    @Schema(description = "乐观锁")
    @Version
    private Integer version;

    @Schema(description = "租户id")
    private String tenantId;

    @Override
    public Serializable pkVal() {
        return this.id;
    }
}
