package cn.liulingfengyu.codegenerator.mapper;

import cn.liulingfengyu.codegenerator.dto.CodeGeneratorParamsPageDto;
import cn.liulingfengyu.codegenerator.entity.CodeGeneratorParams;
import cn.liulingfengyu.codegenerator.vo.CodeGeneratorParamsVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author 刘凌枫羽工作室
 * @since 2024-10-17 14:55:17
 */
public interface CodeGeneratorParamsMapper extends BaseMapper<CodeGeneratorParams> {

    /**
     * 分页查询代码生成参数
     *
     * @param page 分页对象
     * @param dto  条件入参
     * @return {@link List}
     */
    List<CodeGeneratorParamsVo> getByPage(Page<CodeGeneratorParamsVo> page, CodeGeneratorParamsPageDto dto);

    /**
     * 查询代码生成参数集合
     *
     * @return {@link List}
     */
    List<CodeGeneratorParamsVo> getList();

    /**
     * 根据id查询代码生成参数
     *
     * @param id 主键
     * @return {@link CodeGeneratorParamsVo}
     */
    CodeGeneratorParamsVo queryById(String id);

}
