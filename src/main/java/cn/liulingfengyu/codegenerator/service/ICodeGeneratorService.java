package cn.liulingfengyu.codegenerator.service;

import cn.liulingfengyu.codegenerator.dto.GenerateCodeDto;
import cn.liulingfengyu.codegenerator.dto.TableInfoDto;
import cn.liulingfengyu.codegenerator.vo.TableAndFieldVo;
import cn.liulingfengyu.codegenerator.vo.TableIdAndCommentVo;
import cn.liulingfengyu.codegenerator.vo.UiTypeVo;

import java.util.List;
import java.util.Map;

/**
 * @author 刘凌枫羽工作室
 */
public interface ICodeGeneratorService {

    /**
     * 获取数据库列表
     *
     * @param databaseConnectionId 数据库连接id
     * @return {@link List}
     */
    List<String> getDatabaseList(String databaseConnectionId);

    /**
     * 获取数据库表列表
     *
     * @param databaseConnectionId 数据库连接id
     * @param databaseName         数据库名称
     * @return {@link List}
     */
    List<TableIdAndCommentVo> getDatabaseTableList(String databaseConnectionId, String databaseName);

    /**
     * 获取表和字段信息
     *
     * @param tableInfoDto 入参
     * @return {@link List}
     */
    List<TableAndFieldVo> getTableAndField(TableInfoDto tableInfoDto);

    /**
     * 生成代码
     *
     * @param generateCodeDto 入参
     * @return boolean
     */
    boolean generateCode(GenerateCodeDto generateCodeDto);

    /**
     * 获取UI类型
     *
     * @return {@link Map}
     */
    List<UiTypeVo> getUiTypeList();
}
