package cn.liulingfengyu.codegenerator.mapper;

import cn.liulingfengyu.codegenerator.dto.TableInfoPageDto;
import cn.liulingfengyu.codegenerator.entity.TableInfo;
import cn.liulingfengyu.codegenerator.vo.TableInfoVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author 刘凌枫羽工作室
 * @since 2024-10-17 16:03:38
 */
public interface TableInfoMapper extends BaseMapper<TableInfo> {

    /**
     * 分页查询代码生成属性信息
     *
     * @param page 分页对象
     * @param dto  条件入参
     * @return {@link List}
     */
    List<TableInfoVo> getByPage(Page<TableInfoVo> page, TableInfoPageDto dto);

    /**
     * 根据id查询代码生成属性信息
     *
     * @param id 主键
     * @return {@link TableInfoVo}
     */
    TableInfoVo queryById(String id);

}
