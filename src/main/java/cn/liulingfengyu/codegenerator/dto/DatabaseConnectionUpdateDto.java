package cn.liulingfengyu.codegenerator.dto;

import cn.liulingfengyu.core.config.mybatisplus.entity.UpdateInfo;
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
@Schema(name = "DatabaseConnectionUpdateDto")
public class DatabaseConnectionUpdateDto extends UpdateInfo {

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
