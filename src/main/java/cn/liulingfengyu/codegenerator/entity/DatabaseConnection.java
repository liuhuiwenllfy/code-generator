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
 * 数据库连接
 * </p>
 *
 * @author 刘凌枫羽工作室
 * @since 2024-10-12 15:00:33
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("d_database_connection")
@Schema(name = "DatabaseConnection", description = "数据库连接")
public class DatabaseConnection extends Model<DatabaseConnection> {

    private static final long serialVersionUID = 1L;

    @Schema(description = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    @Schema(description = "创建人")
    @TableField(fill = FieldFill.INSERT)
    private String createUser;

    @Schema(description = "删除时间")
    @TableField(fill = FieldFill.UPDATE)
    private Date deleteTime;

    @Schema(description = "删除人")
    @TableField(fill = FieldFill.UPDATE)
    private String deleteUser;

    @TableId(value = "id", type = IdType.ASSIGN_UUID)
    @Schema(description = "主键")
    private String id;

    @Schema(description = "标题")
    private String title;

    @Schema(description = "删除状态")
    @TableLogic
    private Boolean isDelete;

    @Schema(description = "密码")
    private String password;

    @Schema(description = "备注")
    private String remark;

    @Schema(description = "修改时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @Schema(description = "修改人")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String updateUser;

    @Schema(description = "地址")
    private String url;

    @Schema(description = "用户名")
    private String username;

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
