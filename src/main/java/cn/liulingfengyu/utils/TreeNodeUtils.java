package cn.liulingfengyu.utils;

import cn.hutool.core.util.StrUtil;
import cn.liulingfengyu.core.config.mybatisplus.entity.TreeNode;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 构建树结构工具类
 *
 * @author 刘凌枫羽工作室
 */
public class TreeNodeUtils {

    private final static String ZERO = "0";

    /**
     * 构建树结构
     *
     * @param allList     列表
     * @param topNodeName 顶级节点名称
     * @return {@link List<TreeNode>}
     */
    public static List<TreeNode> getTree(List<TreeNode> allList, String topNodeName) {
        List<TreeNode> topNodeList = allList.stream()
                .filter(item -> ZERO.equals(item.getParentId()))
                .sorted(Comparator.comparing(TreeNode::getSort))
                .collect(Collectors.toList());
        if (StrUtil.isBlank(topNodeName)) {
            return getChildren(topNodeList, allList);
        }
        List<TreeNode> children = getChildren(topNodeList, allList);
        TreeNode treeNode = new TreeNode();
        treeNode.setId(ZERO);
        treeNode.setName(topNodeName);
        treeNode.setChildren(children);
        List<TreeNode> list = new ArrayList<>();
        list.add(treeNode);
        return list;
    }

    private static List<TreeNode> getChildren(List<TreeNode> topNodeList, List<TreeNode> allList) {
        topNodeList.forEach(topNode -> {
            List<TreeNode> childNodeList = allList.stream()
                    .filter(childNode -> topNode.getId().equals(childNode.getParentId()))
                    .sorted(Comparator.comparing(TreeNode::getSort))
                    .collect(Collectors.toList());
            topNode.setChildren(childNodeList);
            if (!childNodeList.isEmpty()) {
                getChildren(childNodeList, allList);
            }
        });
        return topNodeList;
    }
}
