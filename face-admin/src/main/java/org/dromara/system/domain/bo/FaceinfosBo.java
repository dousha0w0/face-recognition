package org.dromara.system.domain.bo;

import org.dromara.system.domain.Faceinfos;
import org.dromara.common.mybatis.core.domain.BaseEntity;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 人脸信息业务对象 faceinfos
 *
 * @author Lion Li
 * @date 2024-04-10
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = Faceinfos.class, reverseConvertGenerate = false)
public class FaceinfosBo extends BaseEntity {

    /**
     * 人脸ID
     */
    @NotNull(message = "人脸ID不能为空", groups = { EditGroup.class })
    private Long faceId;

    /**
     * 用户ID
     */
    @NotNull(message = "用户ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long userId;

    /**
     * 人脸数据
     */
    @NotBlank(message = "人脸数据不能为空", groups = { AddGroup.class, EditGroup.class })
    private String faceData;

    /**
     * 人脸数据录入时间戳
     */
    @NotNull(message = "人脸数据录入时间戳不能为空", groups = { AddGroup.class, EditGroup.class })
    private Date timestamp;


}
