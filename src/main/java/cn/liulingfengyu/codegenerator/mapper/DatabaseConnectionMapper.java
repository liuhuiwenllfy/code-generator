package cn.liulingfengyu.codegenerator.mapper;

import cn.liulingfengyu.codegenerator.dto.DatabaseConnectionPageDto;
import cn.liulingfengyu.codegenerator.entity.DatabaseConnection;
import cn.liulingfengyu.codegenerator.vo.DatabaseConnectionVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.List;

/**
 * <p>
 * 数据库连接 Mapper 接口
 * </p>
 *
 * @author 刘凌枫羽工作室
 * @since 2024-10-12 15:00:33
 */
public interface DatabaseConnectionMapper extends BaseMapper<DatabaseConnection> {

    /**
     * 分页查询数据库连接
     *
     * @param page 分页对象
     * @param dto  条件入参
     * @return {@link List}
     */
    List<DatabaseConnectionVo> getByPage(Page<DatabaseConnectionVo> page, DatabaseConnectionPageDto dto);

    /**
     * 查询数据库连接集合
     *
     * @return {@linkplain  IPage}
     */
    List<DatabaseConnectionVo> getList();

    /**
     * 根据id查询数据库连接
     *
     * @param id 主键
     * @return {@link DatabaseConnectionVo}
     */
    DatabaseConnectionVo queryById(String id);

}
