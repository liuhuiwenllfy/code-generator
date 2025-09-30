package cn.liulingfengyu.core.config.mybatisplus.entity;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

/**
 * 修改通用父类
 *
 * @author 刘凌枫羽工作室
 */
@Getter
@Setter
public class UpdateInfo {

    @Schema(description = "主键")
    @NotBlank(message = "主键主键不能为空")
    private String id;

    @Schema(description = "乐观锁")
    @NotNull(message = "乐观锁不能为空")
    private Integer version;
}
