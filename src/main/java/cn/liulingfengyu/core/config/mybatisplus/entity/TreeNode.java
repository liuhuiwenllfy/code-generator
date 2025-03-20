package cn.liulingfengyu.core.config.mybatisplus.entity;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * 树结构通用类
 *
 * @author 刘凌枫羽工作室
 */
@Getter
@Setter
public class TreeNode {

    @Schema(description = "节点id")
    private String id;

    @Schema(description = "节点名称")
    private String name;

    @Schema(description = "父节点")
    private String parentId;

    @Schema(description = "排序")
    private Integer sort;

    @Schema(description = "子节点")
    private List<TreeNode> children;
}
