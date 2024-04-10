export interface CaserecordsVO {
  /**
   * 病例ID
   */
  caseId: string | number;

  /**
   * 用户ID
   */
  userId: string | number;

  /**
   * 患者性别
   */
  gender: string;

  /**
   * 患者年龄
   */
  age: number;

  /**
   * 既往病史
   */
  medicalhistory: string;

  /**
   * 药物过敏病史
   */
  drugallergy: string;

  /**
   * 手术史
   */
  surgicalHistory: string;

  /**
   * 记录的时间戳
   */
  timestamp: string;

}

export interface CaserecordsForm extends BaseEntity {
  /**
   * 病例ID
   */
  caseId?: string | number;

  /**
   * 用户ID
   */
  userId?: string | number;

  /**
   * 患者性别
   */
  gender?: string;

  /**
   * 患者年龄
   */
  age?: number;

  /**
   * 既往病史
   */
  medicalhistory?: string;

  /**
   * 药物过敏病史
   */
  drugallergy?: string;

  /**
   * 手术史
   */
  surgicalHistory?: string;

  /**
   * 记录的时间戳
   */
  timestamp?: string;

}

export interface CaserecordsQuery extends PageQuery {

  /**
   * 用户ID
   */
  userId?: string | number;

  /**
   * 患者性别
   */
  gender?: string;

  /**
   * 患者年龄
   */
  age?: number;

  /**
   * 既往病史
   */
  medicalhistory?: string;

  /**
   * 药物过敏病史
   */
  drugallergy?: string;

  /**
   * 手术史
   */
  surgicalHistory?: string;

  /**
   * 记录的时间戳
   */
  timestamp?: string;

    /**
     * 日期范围参数
     */
    params?: any;
}



