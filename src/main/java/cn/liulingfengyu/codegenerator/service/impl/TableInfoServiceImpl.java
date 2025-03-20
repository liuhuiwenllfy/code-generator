package cn.liulingfengyu.codegenerator.service.impl;

import cn.liulingfengyu.codegenerator.entity.TableInfo;
import cn.liulingfengyu.codegenerator.vo.TableInfoVo;
import cn.liulingfengyu.codegenerator.dto.TableInfoPageDto;
import cn.liulingfengyu.codegenerator.dto.TableInfoInsertDto;
import cn.liulingfengyu.codegenerator.dto.TableInfoUpdateDto;
import cn.liulingfengyu.codegenerator.mapper.TableInfoMapper;
import cn.liulingfengyu.codegenerator.service.ITableInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import cn.liulingfengyu.core.config.mybatisplus.PageUtils;

import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author 刘凌枫羽工作室
 * @since 2024-10-17 16:03:38
 */
@Service
public class TableInfoServiceImpl extends ServiceImpl<TableInfoMapper, TableInfo> implements ITableInfoService {

    @Override
    public IPage<TableInfoVo> getByPage(TableInfoPageDto dto) {
        Page<TableInfoVo> page = new PageUtils<TableInfoVo>().getPage(dto);
        List<TableInfoVo> list = baseMapper.getByPage(page, dto);
        page.setRecords(list);
        return page;
    }

    @Override
    public TableInfoVo queryById(String id) {
        return baseMapper.queryById(id);
    }

    @Override
    public boolean insertItem(TableInfoInsertDto dto) {
        TableInfo entity = new TableInfo();
        BeanUtils.copyProperties(dto, entity);
        return this.save(entity);
    }

    @Override
    public boolean updateItem(TableInfoUpdateDto dto) {
        TableInfo entity = new TableInfo();
        BeanUtils.copyProperties(dto, entity);
        return this.updateById(entity);
    }

    @Override
    public boolean deleteBatchByIdList(List<String> idList) {
        return baseMapper.deleteBatchIds(idList) > 0;
    }

}
