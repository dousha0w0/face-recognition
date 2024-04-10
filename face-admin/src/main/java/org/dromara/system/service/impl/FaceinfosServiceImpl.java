package org.dromara.system.service.impl;

import org.dromara.common.core.utils.MapstructUtils;
import org.dromara.common.core.utils.StringUtils;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.dromara.system.domain.bo.FaceinfosBo;
import org.dromara.system.domain.vo.FaceinfosVo;
import org.dromara.system.domain.Faceinfos;
import org.dromara.system.mapper.FaceinfosMapper;
import org.dromara.system.service.IFaceinfosService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 人脸信息Service业务层处理
 *
 * @author Lion Li
 * @date 2024-04-10
 */
@RequiredArgsConstructor
@Service
public class FaceinfosServiceImpl implements IFaceinfosService {

    private final FaceinfosMapper baseMapper;

    /**
     * 查询人脸信息
     */
    @Override
    public FaceinfosVo queryById(Long faceId){
        return baseMapper.selectVoById(faceId);
    }

    /**
     * 查询人脸信息列表
     */
    @Override
    public TableDataInfo<FaceinfosVo> queryPageList(FaceinfosBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<Faceinfos> lqw = buildQueryWrapper(bo);
        Page<FaceinfosVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询人脸信息列表
     */
    @Override
    public List<FaceinfosVo> queryList(FaceinfosBo bo) {
        LambdaQueryWrapper<Faceinfos> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<Faceinfos> buildQueryWrapper(FaceinfosBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<Faceinfos> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getUserId() != null, Faceinfos::getUserId, bo.getUserId());
        lqw.eq(StringUtils.isNotBlank(bo.getFaceData()), Faceinfos::getFaceData, bo.getFaceData());
        lqw.eq(bo.getTimestamp() != null, Faceinfos::getTimestamp, bo.getTimestamp());
        return lqw;
    }

    /**
     * 新增人脸信息
     */
    @Override
    public Boolean insertByBo(FaceinfosBo bo) {
        Faceinfos add = MapstructUtils.convert(bo, Faceinfos.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setFaceId(add.getFaceId());
        }
        return flag;
    }

    /**
     * 修改人脸信息
     */
    @Override
    public Boolean updateByBo(FaceinfosBo bo) {
        Faceinfos update = MapstructUtils.convert(bo, Faceinfos.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(Faceinfos entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除人脸信息
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
