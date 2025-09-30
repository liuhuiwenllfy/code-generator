package cn.liulingfengyu.codegenerator.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;


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
@Schema(name = "DatabaseConnectionInsertDto")
public class DatabaseConnectionInsertDto {

    @Schema(description = "标题")
    @NotBlank(message = "标题不能为空")
    @Size(max = 90, message = "标题长度在1~90字符之间")
    private String title;

    @Schema(description = "密码")
    @NotBlank(message = "密码不能为空")
    @Size(max = 30, message = "密码长度在1~30字符之间")
    private String password;

    @Schema(description = "备注")
    @Size(max = 300, message = "备注长度在1~900字符之间")
    private String remark;

    @Schema(description = "地址")
    @NotBlank(message = "数据库地址不能为空")
    @Size(max = 300, message = "数据库地址不能为空")
    private String url;

    @Schema(description = "用户名")
    @NotBlank(message = "用户名称不能为空")
    @Size(max = 30, message = "用户名称长度在1~20字符之间")
    private String username;

}
