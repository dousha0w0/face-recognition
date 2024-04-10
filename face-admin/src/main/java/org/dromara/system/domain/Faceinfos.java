package org.dromara.system.domain;

import org.dromara.common.mybatis.core.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serial;

/**
 * 人脸信息对象 faceinfos
 *
 * @author Lion Li
 * @date 2024-04-10
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("faceinfos")
public class Faceinfos extends BaseEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 人脸ID
     */
    @TableId(value = "face_id")
    private Long faceId;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 人脸数据
     */
    private String faceData;

    /**
     * 人脸数据录入时间戳
     */
    private Date timestamp;


}
