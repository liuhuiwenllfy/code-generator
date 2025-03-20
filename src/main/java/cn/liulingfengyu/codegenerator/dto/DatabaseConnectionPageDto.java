package cn.liulingfengyu.codegenerator.dto;

import cn.liulingfengyu.core.config.mybatisplus.entity.PageInfo;
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
@Schema(name = "DatabaseConnectionPageDto")
public class DatabaseConnectionPageDto extends PageInfo {

    @Schema(description = "标题")
    private String title;

}
