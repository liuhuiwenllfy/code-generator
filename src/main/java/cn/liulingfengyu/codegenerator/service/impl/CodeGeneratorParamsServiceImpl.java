package cn.liulingfengyu.codegenerator.service.impl;

import cn.liulingfengyu.codegenerator.dto.CodeGeneratorParamsInsertDto;
import cn.liulingfengyu.codegenerator.dto.CodeGeneratorParamsPageDto;
import cn.liulingfengyu.codegenerator.dto.CodeGeneratorParamsUpdateDto;
import cn.liulingfengyu.codegenerator.entity.CodeGeneratorParams;
import cn.liulingfengyu.codegenerator.mapper.CodeGeneratorParamsMapper;
import cn.liulingfengyu.codegenerator.service.ICodeGeneratorParamsService;
import cn.liulingfengyu.codegenerator.vo.CodeGeneratorParamsVo;
import cn.liulingfengyu.core.config.mybatisplus.PageUtils;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author 刘凌枫羽工作室
 * @since 2024-10-17 14:55:17
 */
@Service
public class CodeGeneratorParamsServiceImpl extends ServiceImpl<CodeGeneratorParamsMapper, CodeGeneratorParams> implements ICodeGeneratorParamsService {

    @Override
    public IPage<CodeGeneratorParamsVo> getByPage(CodeGeneratorParamsPageDto dto) {
        Page<CodeGeneratorParamsVo> page = new PageUtils<CodeGeneratorParamsVo>().getPage(dto);
        List<CodeGeneratorParamsVo> list = baseMapper.getByPage(page, dto);
        page.setRecords(list);
        return page;
    }

    @Override
    public List<CodeGeneratorParamsVo> getList() {
        return baseMapper.getList();
    }

    @Override
    public CodeGeneratorParamsVo queryById(String id) {
        return baseMapper.queryById(id);
    }

    @Override
    public boolean insertItem(CodeGeneratorParamsInsertDto dto) {
        CodeGeneratorParams entity = new CodeGeneratorParams();
        BeanUtils.copyProperties(dto, entity);
        return this.save(entity);
    }

    @Override
    public boolean updateItem(CodeGeneratorParamsUpdateDto dto) {
        CodeGeneratorParams entity = new CodeGeneratorParams();
        BeanUtils.copyProperties(dto, entity);
        return this.updateById(entity);
    }

    @Override
    public boolean deleteBatchByIdList(List<String> idList) {
        return baseMapper.deleteByIds(idList) > 0;
    }

}
