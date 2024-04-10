package org.dromara.system.service;

import org.dromara.system.domain.Faceinfos;
import org.dromara.system.domain.vo.FaceinfosVo;
import org.dromara.system.domain.bo.FaceinfosBo;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 人脸信息Service接口
 *
 * @author Lion Li
 * @date 2024-04-10
 */
public interface IFaceinfosService {

    /**
     * 查询人脸信息
     */
    FaceinfosVo queryById(Long faceId);

    /**
     * 查询人脸信息列表
     */
    TableDataInfo<FaceinfosVo> queryPageList(FaceinfosBo bo, PageQuery pageQuery);

    /**
     * 查询人脸信息列表
     */
    List<FaceinfosVo> queryList(FaceinfosBo bo);

    /**
     * 新增人脸信息
     */
    Boolean insertByBo(FaceinfosBo bo);

    /**
     * 修改人脸信息
     */
    Boolean updateByBo(FaceinfosBo bo);

    /**
     * 校验并批量删除人脸信息信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
