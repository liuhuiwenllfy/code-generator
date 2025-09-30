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
 * @since 2024-10-17 14:55:17
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("d_code_generator_params")
@Schema(name = "CodeGeneratorParams", description = "")
public class CodeGeneratorParams extends Model<CodeGeneratorParams> {

    private static final long serialVersionUID = 1L;

    @Schema(description = "前端接口片段")
    private String api;

    @Schema(description = "标题")
    private String title;

    @Schema(description = "作者")
    private String author;

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

    @Schema(description = "是否删除")
    @TableLogic
    private Boolean isDelete;

    @Schema(description = "是否去表前缀")
    private Boolean isRemovePrefix;

    @Schema(description = "后端项目地址")
    private String javaProjectAddress;

    @Schema(description = "模块名")
    private String moduleName;

    @Schema(description = "模块中文名")
    private String moduleCnName;

    @Schema(description = "模块图标")
    private String moduleIcon;

    @Schema(description = "包名")
    private String packageName;

    @Schema(description = "修改时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @Schema(description = "修改人")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String updateUser;

    @Schema(description = "乐观锁")
    @Version
    private Integer version;

    @Schema(description = "前端项目地址")
    private String vueProjectAddress;

    @Schema(description = "租户id")
    private String tenantId;

    @Override
    public Serializable pkVal() {
        return this.id;
    }
}
