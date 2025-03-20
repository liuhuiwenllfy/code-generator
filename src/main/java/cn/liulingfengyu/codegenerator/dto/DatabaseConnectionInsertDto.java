package cn.liulingfengyu.codegenerator.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

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
    @NotBlank(message = "title.empty")
    @Size(max = 90, message = "title.length")
    private String title;

    @Schema(description = "密码")
    @NotBlank(message = "password.empty")
    @Size(max = 30, message = "password.length")
    private String password;

    @Schema(description = "备注")
    @Size(max = 300, message = "remark.length")
    private String remark;

    @Schema(description = "地址")
    @NotBlank(message = "databaseUrl.empty")
    @Size(max = 300, message = "databaseUrl.length")
    private String url;

    @Schema(description = "用户名")
    @NotBlank(message = "username.empty")
    @Size(max = 30, message = "username.length")
    private String username;

}
