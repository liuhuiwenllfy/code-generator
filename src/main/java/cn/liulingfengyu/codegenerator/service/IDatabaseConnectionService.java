package cn.liulingfengyu.codegenerator.service;

import cn.liulingfengyu.codegenerator.dto.DatabaseConnectionInsertDto;
import cn.liulingfengyu.codegenerator.dto.DatabaseConnectionPageDto;
import cn.liulingfengyu.codegenerator.dto.DatabaseConnectionUpdateDto;
import cn.liulingfengyu.codegenerator.entity.DatabaseConnection;
import cn.liulingfengyu.codegenerator.vo.DatabaseConnectionVo;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 数据库连接 服务类
 * </p>
 *
 * @author 刘凌枫羽工作室
 * @since 2024-10-12 15:00:33
 */
public interface IDatabaseConnectionService extends IService<DatabaseConnection> {

    /**
     * 分页查询数据库连接
     *
     * @param dto 条件入参
     * @return {@linkplain  IPage}
     */
    IPage<DatabaseConnectionVo> getByPage(DatabaseConnectionPageDto dto);

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

    /**
     * 新增数据库连接
     *
     * @param dto 数据库连接新增参数
     * @return boolean
     */
    boolean insertItem(DatabaseConnectionInsertDto dto);

    /**
     * 修改数据库连接
     *
     * @param dto 数据库连接修改参数
     * @return boolean
     */
    boolean updateItem(DatabaseConnectionUpdateDto dto);

    /**
     * 批量删除数据库连接
     *
     * @param idList ids
     * @return boolean
     */
    boolean deleteBatchByIdList(List<String> idList);

}
