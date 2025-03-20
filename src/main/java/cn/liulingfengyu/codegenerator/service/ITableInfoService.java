package cn.liulingfengyu.codegenerator.service;

import cn.liulingfengyu.codegenerator.dto.TableInfoInsertDto;
import cn.liulingfengyu.codegenerator.dto.TableInfoPageDto;
import cn.liulingfengyu.codegenerator.dto.TableInfoUpdateDto;
import cn.liulingfengyu.codegenerator.entity.TableInfo;
import cn.liulingfengyu.codegenerator.vo.TableInfoVo;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author 刘凌枫羽工作室
 * @since 2024-10-17 16:03:38
 */
public interface ITableInfoService extends IService<TableInfo> {

    /**
     * 分页查询代码生成属性信息
     *
     * @param dto 条件入参
     * @return {@linkplain  IPage}
     */
    IPage<TableInfoVo> getByPage(TableInfoPageDto dto);

    /**
     * 根据id查询代码生成属性信息
     *
     * @param id 主键
     * @return {@link TableInfoVo}
     */
    TableInfoVo queryById(String id);

    /**
     * 新增代码生成属性信息
     *
     * @param dto 新增参数
     * @return boolean
     */
    boolean insertItem(TableInfoInsertDto dto);

    /**
     * 修改代码生成属性信息
     *
     * @param dto 修改参数
     * @return boolean
     */
    boolean updateItem(TableInfoUpdateDto dto);

    /**
     * 批量删除代码生成属性信息
     *
     * @param idList ids
     * @return boolean
     */
    boolean deleteBatchByIdList(List<String> idList);

}
