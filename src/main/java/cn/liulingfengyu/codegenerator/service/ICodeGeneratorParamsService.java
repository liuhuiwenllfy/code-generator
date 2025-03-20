package cn.liulingfengyu.codegenerator.service;

import cn.liulingfengyu.codegenerator.dto.CodeGeneratorParamsInsertDto;
import cn.liulingfengyu.codegenerator.dto.CodeGeneratorParamsPageDto;
import cn.liulingfengyu.codegenerator.dto.CodeGeneratorParamsUpdateDto;
import cn.liulingfengyu.codegenerator.entity.CodeGeneratorParams;
import cn.liulingfengyu.codegenerator.vo.CodeGeneratorParamsVo;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author 刘凌枫羽工作室
 * @since 2024-10-17 14:55:17
 */
public interface ICodeGeneratorParamsService extends IService<CodeGeneratorParams> {

    /**
     * 分页查询代码生成参数
     *
     * @param dto 条件入参
     * @return {@linkplain  IPage}
     */
    IPage<CodeGeneratorParamsVo> getByPage(CodeGeneratorParamsPageDto dto);

    /**
     * 查询代码生成参数集合
     *
     * @return {@linkplain  IPage}
     */
    List<CodeGeneratorParamsVo> getList();

    /**
     * 根据id查询代码生成参数
     *
     * @param id 主键
     * @return {@link CodeGeneratorParamsVo}
     */
    CodeGeneratorParamsVo queryById(String id);

    /**
     * 新增代码生成参数
     *
     * @param dto 新增参数
     * @return boolean
     */
    boolean insertItem(CodeGeneratorParamsInsertDto dto);

    /**
     * 修改代码生成参数
     *
     * @param dto 修改参数
     * @return boolean
     */
    boolean updateItem(CodeGeneratorParamsUpdateDto dto);

    /**
     * 批量删除代码生成参数
     *
     * @param idList ids
     * @return boolean
     */
    boolean deleteBatchByIdList(List<String> idList);

}
