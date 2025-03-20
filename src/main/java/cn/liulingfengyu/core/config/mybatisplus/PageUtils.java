package cn.liulingfengyu.core.config.mybatisplus;

import cn.hutool.core.util.StrUtil;
import cn.liulingfengyu.core.config.mybatisplus.entity.PageInfo;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.Function;

/**
 * pageInfo转换为page
 *
 * @param <T> page
 * @author 刘凌枫羽工作室
 */
public class PageUtils<T> {

    /**
     * pageInfo转换为page
     *
     * @param pageInfo 分页对象
     * @return {@link Page}
     */
    public Page<T> getPage(PageInfo pageInfo) {
        // 创建一个新的分页对象
        Page<T> page = new Page<>();
        // 设置当前页码，默认为第一页
        page.setCurrent(pageInfo.getPage() != null ? pageInfo.getPage() : 1);
        // 设置每页显示的记录数，默认为10条
        page.setSize(pageInfo.getPageSize() != null ? pageInfo.getPageSize() : 10);
        // 初始化排序列表
        List<OrderItem> orderItemList = new ArrayList<>();
        // 处理升序排序，并添加到列表中
        processOrderItems(pageInfo.getAscs(), OrderItem::ascs, orderItemList);
        // 处理降序排序，并添加到列表中
        processOrderItems(pageInfo.getDescs(), OrderItem::descs, orderItemList);
        // 将处理后的订单项列表设置到分页对象中
        page.setOrders(orderItemList);
        // 返回分页对象
        return page;
    }

    private void processOrderItems(String attribute, Function<String[], List<OrderItem>> processor, List<OrderItem> orderItemList) {
        // 检查属性是否不为空且不包含空白字符
        if (StringUtils.isNotBlank(attribute)) {
            // 将属性字符串按逗号分割成字符串数组
            String[] split = attribute.split(",");
            // 使用处理器函数处理分割后的字符串数组，
            // 将每个元素转换为下划线命名法，并将结果添加到订单项列表中
            orderItemList.addAll(processor.apply(Arrays.stream(split)
                    .map(StrUtil::toUnderlineCase).toArray(String[]::new)));
        }
    }
}
