export interface FaceinfosVO {
  /**
   * 人脸ID
   */
  faceId: string | number;

  /**
   * 用户ID
   */
  userId: string | number;

  /**
   * 人脸数据
   */
  faceData: string;

  /**
   * 人脸数据录入时间戳
   */
  timestamp: string;

}

export interface FaceinfosForm extends BaseEntity {
  /**
   * 人脸ID
   */
  faceId?: string | number;

  /**
   * 用户ID
   */
  userId?: string | number;

  /**
   * 人脸数据
   */
  faceData?: string;

  /**
   * 人脸数据录入时间戳
   */
  timestamp?: string;

}

export interface FaceinfosQuery extends PageQuery {

  /**
   * 用户ID
   */
  userId?: string | number;

  /**
   * 人脸数据
   */
  faceData?: string;

  /**
   * 人脸数据录入时间戳
   */
  timestamp?: string;

    /**
     * 日期范围参数
     */
    params?: any;
}



