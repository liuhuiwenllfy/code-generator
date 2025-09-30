package cn.liulingfengyu.codegenerator.emnus;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 接口枚举
 *
 * @author 刘凌枫羽工作室
 */
@Getter
@AllArgsConstructor
public enum UrlEnum {

    GET_BY_PAGE("getByPage", "条件分页查询", 1),
    GET_LIST("getList", "表集合", 2),
    QUERY_BY_ID("queryById", "根据id查询", 3),
    GET_TREE("getTree", "树结构查询", 4),
    INSERT("insert", "新增", 5),
    UPDATE_BY_ID("updateById", "修改", 6),
    DELETE_BATCH_BY_ID_LIST("deleteBatchByIdList", "批量删除", 7);

    private final String code;

    private final String message;

    private final Integer sort;
}
