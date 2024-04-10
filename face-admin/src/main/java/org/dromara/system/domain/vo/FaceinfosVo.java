package org.dromara.system.domain.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.dromara.system.domain.Faceinfos;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import org.dromara.common.excel.annotation.ExcelDictFormat;
import org.dromara.common.excel.convert.ExcelDictConvert;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;



/**
 * 人脸信息视图对象 faceinfos
 *
 * @author Lion Li
 * @date 2024-04-10
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = Faceinfos.class)
public class FaceinfosVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 人脸ID
     */
    @ExcelProperty(value = "人脸ID")
    private Long faceId;

    /**
     * 用户ID
     */
    @ExcelProperty(value = "用户ID")
    private Long userId;

    /**
     * 人脸数据
     */
    @ExcelProperty(value = "人脸数据")
    private String faceData;

    /**
     * 人脸数据录入时间戳
     */
    @ExcelProperty(value = "人脸数据录入时间戳")
    private Date timestamp;


}
