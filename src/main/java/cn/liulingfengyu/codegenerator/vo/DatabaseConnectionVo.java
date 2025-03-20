package cn.liulingfengyu.codegenerator.vo;

import cn.liulingfengyu.core.config.mybatisplus.entity.BaseInfo;
import io.swagger.v3.oas.annotations.media.Schema;
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
@Schema(name = "DatabaseConnectionVo")
public class DatabaseConnectionVo extends BaseInfo {

    @Schema(description = "标题")
    private String title;

    @Schema(description = "密码")
    private String password;

    @Schema(description = "备注")
    private String remark;

    @Schema(description = "地址")
    private String url;

    @Schema(description = "用户名")
    private String username;

}
