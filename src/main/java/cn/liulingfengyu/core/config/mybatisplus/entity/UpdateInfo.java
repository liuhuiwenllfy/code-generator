package cn.liulingfengyu.core.config.mybatisplus.entity;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * 修改通用父类
 *
 * @author 刘凌枫羽工作室
 */
@Getter
@Setter
public class UpdateInfo {

    @Schema(description = "主键")
    @NotBlank(message = "id.empty")
    private String id;

    @Schema(description = "乐观锁")
    @NotNull(message = "version.empty")
    private Integer version;
}
