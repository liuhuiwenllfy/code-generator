package cn.liulingfengyu.codegenerator.service.impl;

import cn.liulingfengyu.codegenerator.dto.DatabaseConnectionInsertDto;
import cn.liulingfengyu.codegenerator.dto.DatabaseConnectionPageDto;
import cn.liulingfengyu.codegenerator.dto.DatabaseConnectionUpdateDto;
import cn.liulingfengyu.codegenerator.entity.DatabaseConnection;
import cn.liulingfengyu.codegenerator.mapper.DatabaseConnectionMapper;
import cn.liulingfengyu.codegenerator.service.IDatabaseConnectionService;
import cn.liulingfengyu.codegenerator.vo.DatabaseConnectionVo;
import cn.liulingfengyu.core.config.mybatisplus.PageUtils;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 数据库连接 服务实现类
 * </p>
 *
 * @author 刘凌枫羽工作室
 * @since 2024-10-12 15:00:33
 */
@Service
public class DatabaseConnectionServiceImpl extends ServiceImpl<DatabaseConnectionMapper, DatabaseConnection> implements IDatabaseConnectionService {

    @Override
    public IPage<DatabaseConnectionVo> getByPage(DatabaseConnectionPageDto dto) {
        Page<DatabaseConnectionVo> page = new PageUtils<DatabaseConnectionVo>().getPage(dto);
        List<DatabaseConnectionVo> list = baseMapper.getByPage(page, dto);
        page.setRecords(list);
        return page;
    }

    @Override
    public List<DatabaseConnectionVo> getList() {
        return baseMapper.getList();
    }

    @Override
    public DatabaseConnectionVo queryById(String id) {
        return baseMapper.queryById(id);
    }

    @Override
    public boolean insertItem(DatabaseConnectionInsertDto dto) {
        DatabaseConnection entity = new DatabaseConnection();
        BeanUtils.copyProperties(dto, entity);
        return this.save(entity);
    }

    @Override
    public boolean updateItem(DatabaseConnectionUpdateDto dto) {
        DatabaseConnection entity = new DatabaseConnection();
        BeanUtils.copyProperties(dto, entity);
        return this.updateById(entity);
    }

    @Override
    public boolean deleteBatchByIdList(List<String> idList) {
        return baseMapper.deleteByIds(idList) > 0;
    }

}
